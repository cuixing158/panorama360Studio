%% 测试 Graph Object渲染在坐标区域内，uiaxes不同于axes，坐标要归一化
% 结论：符合预期
p = uipanel(Position=[0.5,0.5,0.5,0.5]);
ax = uiaxes(p,Units="normalized",Position=[0,0,1,1]);
% ax = axes(p);
disableDefaultInteractivity(ax)
[X, Y, Z] = sphere(50);
s = surf(ax, X, Y, Z,FaceColor="none",EdgeColor="black");
ax.DataAspectRatio = [1,1,1];
ax.CameraPosition = [0,0,0];
ax.CameraTarget = [1,0,0];
ax.CameraUpVector = [0,0,1];
ax.CameraViewAngle = 100;
ax.Projection = 'orthographic';%'perspective';%'perspective';