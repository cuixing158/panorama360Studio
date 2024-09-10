%% 制作播放，暂停icon
[img,map,trans] = imread("play.png");
pauseImg = uint8(255*ones(size(img)));
dstImg = insertShape(pauseImg,"line",[14,8,14,29;23,8,23,29],"LineWidth",5,"ShapeColor", ...
    "black");
dstImg(dstImg==0)=97;
imshowpair(img,dstImg,"montage")

mask = dstImg(:,:,1);
mask(mask<255)=0;
mask = uint8(255-mask);
imwrite(dstImg,"pause.png",Alpha=mask)