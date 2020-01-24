var x_ = floor(abs(x_speed)); //how many pixels we move horizontally this frame
var y_ = floor(abs(y_speed)); //how many pixels we move horizontally this frame

//handle sub-pixel movement
x_subpixel += frac(x_speed);
y_subpixel += frac(y_speed);
while(abs(x_subpixel) >= 1)
	{
	x_subpixel -= sign(x_subpixel);
	x_ += sign(x_subpixel);
	}
while(abs(y_subpixel) >= 1)
	{
	y_subpixel -= sign(y_subpixel);
	y_ += sign(y_subpixel);
	}

if(x_ > 0)
	{
	repeat(x_)
		{
		if(!place_meeting(x + sign(x_speed), y, obj_Wall))
			{x += sign(x_speed)}
		else//hit a wall
			{
			x_speed = 0;
			x_subpixel = 0;
			break;
			}
		}
	}

if(y_ > 0)
	{
	repeat(y_)
		{
		if(!place_meeting(x, y + sign(y_speed), obj_Wall))
			{y += sign(y_speed)}
		else//hit a floor/ceiling
			{
			y_speed = 0;
			y_subpixel = 0;
			break;
			}
		}
	}