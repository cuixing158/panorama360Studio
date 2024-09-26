%% 测试图像旋转，坐标变化

figure(Position=[50,50,600,600]);
ax = gca();
[X,Y] = meshgrid(1:10);
Z = ones(size(X));
s = surf(ax,X,Y,Z);

% 定义突出部分
s.ZData(2:4,2:4)=2;

% 转换对象
h = hgtransform(ax);
s.Parent = h;
% warning off;

% 旋转，发现坐标点旋转后并没改变？？？
h.Matrix(1:3,1:3) = roty(45);

% 改变的点逆旋转
x = s.XData(2:4,2:4);
y = s.YData(2:4,2:4);
z = s.ZData(2:4,2:4);
xyz = [x(:),y(:),z(:)]';
xyz3 = roty(-45)*xyz;
xdata = reshape(xyz3(1,:),[3,3]);
ydata = reshape(xyz3(2,:),[3,3]);
zdata = reshape(xyz3(3,:),[3,3]);
s.XData(2:4,2:4) = xdata;
s.YData(2:4,2:4) = ydata;
s.ZData(2:4,2:4) = zdata;


% 坐标点统一旋转
xyz = [s.XData(:),s.YData(:),s.ZData(:)]';
xyz1 = roty(45)*xyz;
xyz2 = roty(-45)*xyz;

hold on;
plot3(xyz1(1,:),xyz1(2,:),xyz1(3,:),'ro')

xdata = reshape(xyz2(1,:),size(s.XData));
ydata = reshape(xyz2(2,:),size(s.YData));
zdata = reshape(xyz2(3,:),size(s.ZData));

% 并没改变图像位置？？？
s.XData = xdata;
s.YData = ydata;
s.ZData = zdata;

% % 坐标点会变化，旋转中心为Box中心
% direction = [0,1,0];
% rotate(s,direction,45);