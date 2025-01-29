




#libcamera-vid -v 0 -t 0 --nopreview --framerate 15 --codec mjpeg --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 --inline -o -|gst-launch-1.0 fdsrc ! jpegparse ! tee name=tp tp. ! queue ! rtpjpegpay ! udpsink host=home.kolesnik.org port=3333 tp. ! queue ! filesink location=dst2.mpe



#libcamera-vid -v 0 -t 0 --nopreview --framerate 15 --codec mjpeg --bitrate 2500000 --profile baseline --rotation 180  --width 640 --height 480 \
#	 --inline -o -|gst-launch-1.0 fdsrc ! jpegparse ! tee name=tp \
#		tp. ! queue ! rtpjpegpay ! udpsink host=home.kolesnik.org port=3333 \
#		tp. ! queue ! videorate ! 'video/x-raw,framerate=1/1' ! jpegenc ! multifilesink location=img1_%03d.jpeg

#libcamera-vid -v 0 -t 0 --nopreview --codec h264 --framerate 30 --bitrate 9000000 --profile baseline --rotation 180  --width 1920 --height 1080 \
#	 --inline -o -|gst-launch-1.0 fdsrc ! h264parse ! h264enc ! tee name=tp \
#		tp. ! queue ! rtph264pay ! udpsink host=home.kolesnik.org port=3333 \
#		tp. ! queue ! h264parse ! videorate ! 'video/x-raw,framerate=1/1' ! jpegenc ! multifilesink location=img1_%03d.jpeg



#libcamera-vid -v 0 -t 0 --nopreview --codec mjpeg --framerate 30 --bitrate 9000000 --profile baseline --rotation 180  --width 1920 --height 1080 \
#        --inline -o -|gst-launch-1.0 fdsrc ! jpegparse ! tee name=tp \
#               tp. ! queue ! rtpjpegpay ! udpsink host=home.kolesnik.org port=3333 \
#               tp. ! queue ! videorate ! 'video/x-raw,framerate=1/1' ! jpegenc ! multifilesink location=img1_%03d.jpeg


#works
#gst-launch-1.0 -e libcamerasrc ! video/x-raw, width=640, height=480, framerate=30/1, rotation=180 ! clockoverlay time-format="%D %H:%M:%S" ! jpegenc ! jpegparse !  rtpjpegpay ! udpsink host=home.kolesnik.org port=3333


#gst-launch-1.0 -e libcamerasrc ! video/x-raw, width=640, height=480, framerate=30/1, rotation=180 ! videoflip method=rotate-180 \
#	! clockoverlay time-format="%D %H:%M:%S" !tee name=tp  \
#	tp. ! queue ! jpegenc ! jpegparse !  rtpjpegpay ! udpsink host=home.kolesnik.org port=3333 \
#	tp. ! queue ! videorate ! 'video/x-raw,framerate=30/1' ! jpegenc ! multifilesink location=img1_%03d.jpeg \
#	tp. ! queue ! omxh264enc ! splitmuxsink location=video%02d.mov max-size-time=10000000000 max-size-bytes=1000000


gst-launch-1.0 -e libcamerasrc ! video/x-raw, width=640, height=480, framerate=30/1, rotation=180 ! videoflip method=rotate-180 \
	! clockoverlay time-format="%D %H:%M:%S" !tee name=tp  \
	tp. ! queue ! jpegenc ! jpegparse !  rtpjpegpay ! udpsink host=home.kolesnik.org port=3333 \
	tp. ! queue ! avimux ! filesink location=vid.avi



#	tp. ! queue ! avimux ! videorate ! 'video/x-raw,framerate=30/1' ! filesink location=vid.avi



