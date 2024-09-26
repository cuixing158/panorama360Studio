# 360° Panorama Studio

![panoramaStudio](images/output.gif)

导入[equirectangular类型](https://en.wikipedia.org/wiki/Equirectangular_projection)全景视频，用户在不同时间戳上选择不同视角(perspective透视，crystal水晶球，littleplanet小行星)，自动插值生成预览特效视频，可导出mp4文件。

## Features

+ [x] 支持360°实时全景视频播放，播放，暂停，停止基本按钮控件
+ [x] 支持全景播放时鼠标拖曳，滚轮缩放视角
+ [x] 支持编辑插入，删除关键帧
+ [x] 支持进度条拖曳播放进度

## Requirements

MathWorks Products (<https://www.mathworks.com>)

+ MATLAB R2023b or later
+ Computer Vision Toolbox™
+ Image Processing Toolbox™
+ Symbolic Math Toolbox™ (optional,only "doc/mathTransformation.mlx" require)

## Know Issues

1. 当相邻的两个关键帧一个为鱼眼，另一个是透视或者小行星时候，不支持旋转，播放画面会异常
1. 播放/暂停按钮有时不灵敏
1. 高分辨全景视频解码较慢，播放可能存在卡顿
1. 导出视频文件较慢
1. 无音频信息

## References

1. [Changes in camera viewpoint parameters cannot be constrained within the axial coordinate area?](https://ww2.mathworks.cn/matlabcentral/answers/2152210-changes-in-camera-viewpoint-parameters-cannot-be-constrained-within-the-axial-coordinate-area)

1. [Create an App to Play and Visualize Audio Files](https://www.mathworks.com/help/audio/ug/create-an-app-to-play-and-visualize-audio-files.html)
