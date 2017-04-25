# WebRTC-client-Virtual-Wall
## Download
```git clone https://github.ugent.be/dripauwe/WebRTC-client-Virtual-Wall.git```

## Install Google Chrome, xvfb and the certificate
run ``` ./client_config.sh ```

## Run test
- With fake video capture: ``` google-chrome --no-first-run --no-default-brower-check --disable-translate --use-fake-ui-for-media-stream --use-fake-device-for-media-stream "https://server:8443"```
- With fake video capture from file (only .y4m format is supported): ``` google-chrome --no-first-run --no-default-brower-check --disable-translate --use-fake-ui-for-media-stream --use-fake-device-for-media-stream --use-file-for-fake-video-capture=soccer.y4m "https://server:8443"```
  (I have a test video in .y4m but it's too large (2.2 GB) to put on github)
- run in headless mode: ``` xvfb-run -a google-chrome ... ``` 
- Select a room: e.g room number 1: ``` "https://server:8443/r/1" ```

## WebRTC statistics
- in Chrome: go to chrome://webrtc-internals to see realtime WebRTC events and graphs
- logging to file: each second, the client logs the following bitrates:
  - googActualEncBitrate
  - googAvailableSendBandwidth 

  These logs are both written to the console and a file (debugout.txt).
  - On default, this file is downloaded 10 seconds after the page is loaded. This time can be set with the parameter log_duration in seconds. E.g: ``` https://server:8443/r/1?log_duration=60 ```
  - It is possible to log every available statistic every second. Set parameter ``` full_log=true ``` in the URL

- Enable low-level logging in google-chrome: add the flags ``` --enable-logging --v=1 ```. The log file will be created in $HOME/.config/google-chrome/chrome_debug.log
- In Google Chrome v58, our certificate is not excepted. For a workaround:
    - ``` sudo mkdir -p /etc/opt/chrome/policies/managed ```
    - ``` touch /etc/opt/chrome/policies/managed/test_policy.json ```
    - add the following content:
      ```  {
              "EnableCommonNameFallbackForLocalAnchors": true
            }
      ```
