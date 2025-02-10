gst-launch-1.0 -e  udpsrc port=3333 ! application/x-rtp, encoding-name=JPEG, payload=26 ! rtpjpegdepay ! jpegdec !  videoflip method=rotate-180 ! autovideosink

