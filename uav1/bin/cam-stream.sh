
#DEFAULT UDP/TCP/RTP GST

#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --codec mjpeg --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -|gst-launch-1.0 fdsrc ! jpegparse ! rtpjpegpay ! udpsink host=home.kolesnik.org port=3333


#tcp
#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --codec mjpeg --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -|gst-launch-1.0 fdsrc ! jpegparse ! rtpjpegpay ! tcpclientsink host=piserver port=3334



#FFMPEG streeaming
# PREREQS
# sudo apt install ffmpeg


#libcamera-vid -t 0 --camera 0 --nopreview --codec yuv420 --width 1280 --height 720 --inline --listen -o - | ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 1280x720 -i /dev/stdin -c:v libx264 -preset ultrafast -tune zerolatency -f rtsp rtsp://piserver3:8554/mystream


# goodish one
#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --codec yuv420 --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline  -o - | ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 640x480 -i /dev/stdin -c:v libx264 -preset ultrafast -tune zerolatency -f rtsp rtsp://home.kolesnik.org:8554/mystream


#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --codec mjpeg --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline  -o - | ffmpeg -f mjpeg  -i /dev/stdin -c:v copy -preset ultrafast -tune zerolatency -f rtsp -rtsp_transport tcp rtsp://home.kolesnik.org:8554/mystream



#GST WITH RTSP

# PREREQS
# https://github.com/bluenviron/mediamtx?tab=readme-ov-file#installation
# sudo apt install gstreamer1.0-rtsp


#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --codec mjpeg --bitrate 500000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -|gst-launch-1.0 fdsrc ! jpegparse ! rtspclientsink protocols=tcp sync=false location=rtsp://home.kolesnik.org:8554/mystream


#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --bitrate 5000000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -|gst-launch-1.0 fdsrc ! jpegparse ! qtdemux name=d d.video_0 ! rtspclientsink location=rtsp://piserver3:8554/mystream



#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --bitrate 5000000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -|gst-launch-1.0 fdsrc ! qtdemux name=d d.video_0 ! rtspclientsink location=rtsp://piserver3:8554/mystream


#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --codec mjpeg --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -| gst-launch-1.0 fdsrc ! qtdemux name=d d.video_0 ! rtspclientsink location=rtsp://piserver3:8554/mystream

#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -| gst-launch-1.0 fdsrc ! qtdemux name=d d.video_0 ! rtspclientsink location=rtsp://piserver3:8554/mystream



#with clock

#raw to jpeg
#gst-launch-1.0 -e libcamerasrc ! video/x-raw, width=640, height=480, framerate=15/1, rotation=180 ! clockoverlay time-format="%D %H:%M:%S" ! jpegenc ! jpegparse ! rtspclientsink protocols=tcp sync=false location=rtsp://home.kolesnik.org:8554/mystream


#gst-launch-1.0 -e libcamerasrc ! video/x-raw, codec=mjpeg, width=640, height=480, framerate=15/1, rotation=180 ! clockoverlay time-format="%D %H:%M:%S" ! jpegparse ! rtspclientsink protocols=tcp sync=false location=rtsp://home.kolesnik.org:8554/mystream


#gst-launch-1.0 -e libcamerasrc ! video/x-raw, bitrate=500000, nopreview, profile=baseline, inline, width=640, height=480, framerate=15/1, rotation=180, lens-position=0.0, autofocus-mode=manual  ! clockoverlay time-format="%D %H:%M:%S" ! jpegenc ! jpegparse ! rtspclientsink protocols=tcp sync=false location=rtsp://home.kolesnik.org:8554/mystream

gst-launch-1.0 -e libcamerasrc ! video/x-raw, width=640, height=480, framerate=15/1, rotation=180, bitrate=500000, nopreview=true, profile=baseline, inline=true, lens-position=0.0, autofocus-mode=manual, auto-focus-mode=off ! clockoverlay time-format="%D %H:%M:%S" ! jpegenc ! jpegparse ! rtspclientsink protocols=tcp sync=false location=rtsp://home.kolesnik.org:8554/mystream
