# conversion tools - for revision purposes.
requires parallel and a properly compiled ffmpeg; CUDA and a supported GPU from Nvidia https://developer.nvidia.com/video-encode-decode-gpu-support-matrix

# install parallel
sudo dnf -y install parallel

# ffmpeg 
Nvidia hwaccel enabled - cuda, nvdec, nvenc, libnpp, cuvid, opencl compiled on a Fedora 28 x86_64 system

# ffmpeg-cuda.sh 
the focus is on using hardware acceleration and parallel processing as much as possible

essentially we split the file into streams, convert the a video to a base mpeg2 stream (fastest for CPU time), and while we recode the mpeg2 into mpeg4 using your video engine and CUDA (GPU time), I like to convert out a few audio files for compatibility (CPU time). At the end we merge/copy everything together (CPU time). We hold files in shared memory until ready for the final merge/mux. There is a queue to add an srt file properly for the hearing impaired.

# commit.sh
speedup my commits

# dec-hex-txt folder and *.sh
some simple scripts for when I need to convert between dec <-> hex -> txt

# Pi folder and Pi.sh
simple one liner to calculate Pi - takes scale (decimal places) as input
