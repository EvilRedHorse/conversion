#! /usr/bin/sh
# requires parallel and a properly compiled ffmpeg; CUDA and a supported GPU from Nvidia https://developer.nvidia.com/video-encode-decode-gpu-support-matrix

# Take in some inputs, get filename with and without extension,
# this will not check the validity - there are many more rendering options available.
START=$( date +%s )
BIN=~/Public/ffmpeg
MEM=/dev/shm
printf "input file: "
read INPUT
printf "input srt file: "
read SRT
NAME_EXT=$( basename "$INPUT" )
NAME=$( echo ${NAME_EXT%.*} )
#NAME=$( basename "$INPUT" | cut -f1 -d"." )
printf "encoding: $NAME ...\n"
# parallel - CPU extract video (avi) from stream & CPU extract audio (mp3) from stream
parallel ::: "$BIN -y -i '$INPUT' -vn -acodec copy '$MEM/input-audio.mp3'" "$BIN -y -i '$INPUT' -vcodec copy -an '$MEM/$NAME_EXT'"

# try first
# $BIN -hide_banner -hwaccel cuvid -c:v h264_cuvid -autorotate 0 -i $INPUT -c:v h264_nvenc -preset slow output-video.mp4

# try second
# $BIN -hide_banner -hwaccel cuvid -c:v h265_cuvid -autorotate 0 -i $INPUT -c:v h264_nvenc -preset slow output-video.mp4

# CPU decode - "non nvdec compatible" - static - media file -> raw h264 - pass 1
#
#$BIN -init_hw_device cuda:0.1 -y -i "$MEM/$NAME_EXT" -c:v libx264 -preset fast "$MEM/output-video.h264"
$BIN -y -i "$MEM/$NAME_EXT" -c:v mpeg2video -b:v 5M -refs 1 -bf 0 -preset slow "$MEM/output-video.mpg"

# parallel - CPU convert mp3 to aac, ac3 & GPU encode static - raw h264 -> h264
#parallel ::: "$BIN -y -i '$MEM/input-audio.mp3' -c:a aac '$MEM/output-audio.m4a'" "$BIN -y -i '$MEM/input-audio.mp3' -c:a ac3 '$MEM/output-audio.ac3'" "$BIN -y -hide_banner -hwaccel cuvid -c:v h264_cuvid -autorotate 0 -i '$MEM/output-video.h264'  -c:v h264_nvenc -preset slow -tune animation -crf 0 '$MEM/output-video.mp4'"
parallel ::: "$BIN -y -i '$MEM/input-audio.mp3' -c:a aac '$MEM/output-audio.m4a'" "$BIN -y -i '$MEM/input-audio.mp3' -c:a ac3 '$MEM/output-audio.ac3'" "$BIN -y -hide_banner -hwaccel cuvid -c:v mpeg2_cuvid -autorotate 0 -i '$MEM/output-video.mpg'  -c:v h264_nvenc -preset slow -tune animation -b:v 1M  '$MEM/output-video.mp4'"

# CPU Merge multiple audio and video inputs
$BIN -y -i "$MEM/output-video.mp4" -i "$MEM/output-audio.m4a" -i "$MEM/output-audio.ac3" -i "$MEM/input-audio.mp3" -f srt -i "$SRT" \
-map 0:v -map 1:a -map 2:a -map 3:a -map 4:0 \
-metadata:s:a:0 language=eng -metadata:s:a:0 title="aac" \
-metadata:s:a:1 language=eng -metadata:s:a:1 title="ac3" \
-metadata:s:a:2 language=eng -metadata:s:a:2 title="mp3" \
-metadata:s:s:0 language=eng -metadata:s:s:0 title="eng subtitles" \
-c:s mov_text -c:v copy -c:a copy "$NAME.mp4"
# Calculate/display conversion time.
END=$( date +%s )
TIME=$( echo "$END-$START" | bc)
printf "\n\n"$TIME" seconds to convert.\n"
