# listener
The Listener - sonification of probe requests with wireshark + puredata

The Listener employs data sonification to materialise probe requests sent from networked devices, exposing this discrete process and creating new relationships to this data.

Hardware required:
Raspberry Pi (B+ 1 or 2) running Wheezy
WLAN adaptor (with RALINK 5370 or similar chipset that allows monitor/soft AP mode)
USB audio interface + speakers
Powered speaker connected via RPi audio jack

Software dependencies:
wireshark/tshark (available at: https://www.wireshark.org/)
pd-extended (available at: https://puredata.info/)

Directions: open 'Listener.pd' in pd-extended, with the USB audio interface as the output.  
From command line run: sudo tshark -I -l -i xxx -T fields -e wlan.sa -e wlan_mgt.ssid -e radiotap.dbm_antsignal type mgt subtype probereq | stdbuf -oL ./numbers.sh |nc -4u localhost 9997
(where xxx is the WLAN adaptor (e.g. wlan0, en0 etc) - also ensure that numbers.sh is in the current directory and you have given it executable permissions [sudo chmod +x numbers.sh])

Audio files can be found here: http://www.mediafire.com/download/73a3d84cltpwta9/Audio_Files.zip

NOTE
It is possible to run this on most Mac OSX computers with no external wifi adaptor required - finding a substitute for stdbuf that works to satisfaction is something I'll address in the future.
