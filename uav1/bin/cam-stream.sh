
#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --codec mjpeg --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -|gst-launch-1.0 fdsrc ! jpegparse ! rtpjpegpay ! udpsink host=home.kolesnik.org port=3333



#libcamera-vid -t 0 --camera 0 --nopreview --codec yuv420 --width 1280 --height 720 --inline --listen -o - | ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 1280x720 -i /dev/stdin -c:v libx264 -preset ultrafast -tune zerolatency -f rtsp rtsp://piserver3:8554/mystream

#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --codec yuv420 --bitrate 1500000 --profile baseline --rotation 180  --width 640 --height 480 --inline  -o - | ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 640x480 -i /dev/stdin -c:v libx264 -preset ultrafast -tune zerolatency -f rtsp rtsp://piserver3:8554/mystream


libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --codec mjpeg --bitrate 1500000 --profile baseline --rotation 180  --width 640 --height 480 --inline  -o - | ffmpeg -f mjpeg  -i /dev/stdin -c:v copy -preset ultrafast -tune zerolatency -f rtsp -rtsp_transport tcp rtsp://home.kolesnik.org:8554/mystream


# prereqs
# https://github.com/bluenviron/mediamtx?tab=readme-ov-file#installation
# sudo apt install gstreamer1.0-rtsp


#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --codec mjpeg --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -|gst-launch-1.0 fdsrc ! jpegparse ! rtspclientsink protocols=tcp location=rtsp://piserver3:8554/mystream


#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --bitrate 5000000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -|gst-launch-1.0 fdsrc ! jpegparse ! qtdemux name=d d.video_0 ! rtspclientsink location=rtsp://piserver3:8554/mystream



#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --bitrate 5000000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -|gst-launch-1.0 fdsrc ! qtdemux name=d d.video_0 ! rtspclientsink location=rtsp://piserver3:8554/mystream




#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --codec mjpeg --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -| gst-launch-1.0 fdsrc ! qtdemux name=d d.video_0 ! rtspclientsink location=rtsp://piserver3:8554/mystream

#libcamera-vid -v 0 -t 0 --lens-position=0.0 --autofocus-mode=manual --nopreview --framerate 15 --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -| gst-launch-1.0 fdsrc ! qtdemux name=d d.video_0 ! rtspclientsink location=rtsp://piserver3:8554/mystream


