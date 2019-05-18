
# C:\cygwin\usr\local\bin\ffmpeg -i BladeRunnerDirectorsCut.mpg -r 24 -aspect 16:9 -pass 1 -vcodec libvpx -filter:v deshake -filter:v yadif -vb 1000K -qmax 40 -qmin 10 -bufsize 10000k -rc_buf_aggressivity 0.95 -an -y BladeRunnerDirectorsCut.webm

# C:\cygwin\usr\local\bin\ffmpeg -i BladeRunnerDirectorsCut.mpg -r 24 -aspect 16:9 -pass 2 -vcodec libvpx -filter:v deshake -filter:v yadif -vb 1000K -qmax 40 -qmin 10 -bufsize 10000k -rc_buf_aggressivity 0.95 -acodec libvorbis -y BladeRunnerDirectorsCut.webm

/usr/local/bin/ffmpeg -i Hypercube_2002_DVDRip_XviD_AC3.avi -pass 1 -codec:v libvpx -threads 3 -quality best -cpu-used 0 -filter:v yadif -b:v 1024k -qmin 10 -qmax 42 -maxrate 1024k -bufsize 2048k -an -f webm -y /dev/null

/usr/local/bin/ffmpeg -i Hypercube_2002_DVDRip_XviD_AC3.avi -pass 2 -codec:v libvpx -threads 3 -quality best -cpu-used 0 -filter:v yadif -b:v 1024k -qmin 10 -qmax 42 -maxrate 1024k -bufsize 2048k -acodec libvorbis -f webm -y Hypercube_2002_DVDRip_vp8_vorbis.mkv

