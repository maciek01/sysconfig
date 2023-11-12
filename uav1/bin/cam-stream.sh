
libcamera-vid -v 0 -t 0 --nopreview --framerate 15 --codec mjpeg --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -|gst-launch-1.0 fdsrc ! jpegparse ! rtpjpegpay ! udpsink host=home.kolesnik.org port=3333


