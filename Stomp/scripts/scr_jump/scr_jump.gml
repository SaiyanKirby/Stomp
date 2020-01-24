if(argument0)
	{
	if(jumps_left > 0 || jump_buffer > 0)
		{
		jumps_left--;
		jump_buffer = 0;
		y_subpixel = 0;
		y_speed = jump_speed * -1;
		jump_timer = 0;
		state = states.jumping
		}
	}