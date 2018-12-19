# raspberry-pi-octoprint

Octoprint for Raspberry Pi 1/Zero.
- no CuraEngine

Volumes:
- /data

Exposes:
- 5000

```
 $ docker run --privileged -p 80:5000 -v /octoprint/data:/data udom/raspberry-pi-octoprint
```

Camera can be accessed from another container based on https://github.com/jacksonliam/mjpg-streamer.git (mjpg-streamer-experimental/Dockerfile) 