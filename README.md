# listener
The Listener - sonifying probe requests with raspberry pi + puredata

The Listener employs data sonification to materialise probe requests sent from networked devices, exposing this discrete process and creating new relationships to this data.

Hardware required:
Raspberry Pi (B+ 1 or 2)
WLAN adaptor (with RALINK 5370 or similar chipset that allows monitor/soft AP mode)
USB audio interface + speakers
Powered speaker connected via RPi audio jack

Software dependencies:
wireshark/tshark
pd-extended

Directions: open 'Listener.pd' in pd-extended, with the USB audio interface as the output.  
From command line run: sudo tshark -I -l -i wlan0 -T fields -e wlan.sa -e wlan_mgt.ssid -e radiotap.dbm_antsignal type mgt subtype probereq | stdbuf -oL ./numbers.sh |nc -4u localhost 9997
(where wlan0 is the WLAN adaptor - also ensure that numbers.sh is in the current directory)

Audio files can be found here: http://www.mediafire.com/download/73a3d84cltpwta9/Audio_Files.zip
