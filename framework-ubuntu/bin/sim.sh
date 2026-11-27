


source /home/maciek/venv-ardupilot/bin/activate
export PATH=/opt/gcc-arm-none-eabi-10-2020-q4-major/bin:$PATH
export PATH=/home/maciek/ArduPilot/ardupilot/Tools/autotest:$PATH
export PATH=/usr/lib/ccache:$PATH



cd ~/ArduPilot
sim_vehicle.py -v copter --out 127.0.0.1:14551 -L Maciek
#sim_vehicle.py -v copter --out /dev/ttyUSB0 -L Maciek
#sim_vehicle.py -v copter --out 192.168.3.6:14540


