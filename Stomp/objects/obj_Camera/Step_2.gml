/// @description Move Camera

//if global.game_state != game_states.main
	//{exit;};

if keyboard_check_pressed(ord("G"))
	{
	if follow != noone
		{follow = noone;};
	else
		{follow = obj_Player;};
	};

if instance_exists(follow)
	{
	x_to = follow.bbox_left+((follow.bbox_right-follow.bbox_left)/2);
	y_to = follow.bbox_top+((follow.bbox_bottom-follow.bbox_top)/2);
	};

if abs(x-x_to) < 0.01
	{x = x_to;};
else
	{x = lerp(x,x_to,spd);};
if abs(y-y_to) < 0.01
	{y = y_to;};
else
	{y = lerp(y,y_to,spd);};

if width < room_width
	{x = clamp(x,(width/2),(room_width-(width/2)));};
else
	{x = room_width/2;};
if height < room_height
	{y = clamp(y,(height/2),(room_height-(height/2)));};
else
	{y = room_height/2;};

camera_x = x;
camera_y = y;

#region camera shake
//add camera shake code here
#endregion

//camera_x = clamp(camera_x,width/2,room_width-(width/2));
//camera_y = clamp(camera_y,height/2,room_height-(height/2));

global.HUD_x = camera_x-(width/2);
global.HUD_y = camera_y-(height/2);

var vm = matrix_build_lookat(camera_x,camera_y,-10000,camera_x,camera_y,0,0,1,0);
camera_set_view_mat(camera,vm);