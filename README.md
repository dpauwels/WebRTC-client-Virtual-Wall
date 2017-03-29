# WebRTC-client-Virtual-Wall
## Install Google Chrome and xvfb
run ``` sudo ./client_config.sh ```

## Run test
- With fake video capture: ``` google-chrome --no-first-run --no-default-brower-check --disable-translate --use-fake-ui-for-media-stream --use-fake-device-for-media-stream "http://server:8080"```
- With fake video capture from file (only .y4m format is supported): ``` google-chrome --no-first-run --no-default-brower-check --disable-translate --use-fake-ui-for-media-stream --use-fake-device-for-media-stream --use-file-for-fake-video-capture=soccer.y4m "http://server:8080"```
  (I have a test video in .y4m but it's too large (2.2 GB) to put on github)
- run in headless mode: ``` xvfb-run -a google-chrome ... ``` 

## WebRTC statistics
- in Chrome: go to chrome://webrtc-internals to see realtime WebRTC events and graphs
- logging to file: each second, the client logs the following bitrates:
  - googActualEncBitrate
  - googAvailableSendBandwidth 
  - googAvailableReceiveBandwidth: 
  - googRetransmitBitrate: 
  - googTargetEncBitrate: 
  - googBucketDelay: 
  - googTransmitBitrate: 

  These logs are both written to the console and a file (debugout.txt). On default, this file is downloaded 10 seconds after the page is loaded. This time can be set with the parameter log_duration in seconds. E.g: ``` https://server:8443/r/1?log_duration=60 ```
