# 交互制作特效视频编辑器

导入equirectangular类型全景视频，用户在不同时间戳上选择视角，自动插值生成预览特效视频，可导出mp4文件

```mermaid
flowchart LR

subgraph 相机在球内
    direction TB
    id11(("`perspective image<br>透视无畸变图`")) 
    id12(("`stereo image<br>小行星`"))
end

subgraph 相机在球外
    id3(("`fisheye image<br>鱼眼`"))
end

id11--->id3--->id11
id3--->id12--->id3
```

## References

1. [Changes in camera viewpoint parameters cannot be constrained within the axial coordinate area?](https://ww2.mathworks.cn/matlabcentral/answers/2152210-changes-in-camera-viewpoint-parameters-cannot-be-constrained-within-the-axial-coordinate-area)

1. [Create an App to Play and Visualize Audio Files](https://www.mathworks.com/help/audio/ug/create-an-app-to-play-and-visualize-audio-files.html)
