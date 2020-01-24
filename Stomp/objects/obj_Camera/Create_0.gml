camera = camera_create();

image_speed = 0;
image_alpha = 0;
draw = 0;

//width = floor(global.res_X_Rendered/global.scale);
//height = floor(global.res_Y_Rendered/global.scale);
//this is stuff from another project

width = 480;
height = 270;

spd = 0.1;
follow = obj_Player;
if instance_exists(follow)
	{
	x = follow.x;
	y = follow.y;
	};
x_to = x;
y_to = y;

camera_x = x;
camera_y = y;

global.HUD_x = x;
global.HUD_y = y;
global.HUD_w = width;
global.HUD_h = height;

var vm = matrix_build_lookat(camera_x,camera_y,-10000,camera_x,camera_y,0,0,1,0);
var pm = matrix_build_projection_ortho(width,height,-10000,100000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;