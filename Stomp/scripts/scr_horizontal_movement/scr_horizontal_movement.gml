//argument0 = move direction
//argument1 = whether you're sprinting

var sprint = argument1 + 1;

//if you're moving in the opposite direction of your current speed, snap to 0 first
if(place_meeting(x, y+1, obj_Wall) && sign(argument0) != sign(x_speed) && sign(argument0) != 0)
	{
	x_speed = 0;
	x_subpixel = 0;
	}

if(argument0 == 0)//slow down
	{x_speed -= moving_acceleration * sign(x_speed) * sprint;}
else//speed up
	{x_speed += moving_acceleration * argument0 * sprint;}

//clamp speed
x_speed = clamp(x_speed, max_move_speed * -1 * sprint, max_move_speed * sprint);

//reset subpixel if not moving
if(argument0 == 0 && abs(x_speed) < moving_acceleration)
	{
	x_speed = 0;
	x_subpixel = 0;
	}