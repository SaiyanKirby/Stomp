///@description Handle states

#region input
var jump_pressed = keyboard_check_pressed(vk_space);
var jump_held = keyboard_check(vk_space);
var jump_released = keyboard_check_released(vk_space);
var move_direction = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var stomp_pressed = keyboard_check_pressed(ord("S"));
var sprint_held = keyboard_check(vk_shift);
#endregion

if(state == states.ground_idle)
	#region ground idle
	{
	//reset jumps
	jumps_left = max_jumps;
	jump_buffer = 0;
	jump_timer = 0;
	
	//change states
	if(move_direction != 0 || x_speed != 0)
		{state = states.ground_moving;}
	if(jump_pressed)
		{state = states.jumping;}
	if(!place_meeting(x, y+1, obj_Wall))
		{
		jump_buffer = jump_buffer_max;
		state = states.falling;
		}
	}
	#endregion

if(state == states.ground_moving)
	#region ground moving
	{
	//change horizontal speed
	scr_horizontal_movement(move_direction, sprint_held);
	
	//reset jumps
	jumps_left = max_jumps;
	jump_buffer = 0;
	jump_timer = 0;
	
	//change states
	if(move_direction == 0 && x_speed == 0)
		{state = states.ground_idle;}
	if(jump_pressed && jumps_left > 0)
		{state = states.jumping;}
	if(!place_meeting(x, y+1, obj_Wall))
		{
		jump_buffer = jump_buffer_max;
		state = states.falling;
		}
	}
	#endregion

if(state == states.jumping)
	#region jumping
	{
	//change horizontal speed
	scr_horizontal_movement(move_direction, sprint_held);
	
	//handle jumps
	scr_jump(jump_pressed);
	
	//change vertical speed
	if(jump_held && jump_timer < jump_timer_max)
		{
		jump_timer++;
		y_speed = jump_speed * -1;
		}
	else
		{
		if(jump_released && jump_timer < jump_timer_max)
			{y_speed = min(0, y_speed * 0.75);}
		y_speed += gravity_acceleration;
		}
	
	y_speed = clamp(y_speed, max_fall_speed * -1, max_fall_speed);
	
	//change states
	if(y_speed >= 0 || place_meeting(x, y-1, obj_Wall))
		{
		jump_buffer = 0;
		state = states.falling;
		}
	if(stomp_pressed && jump_timer >= jump_timer_max / 2)
		{
		y_speed = max_fall_speed * 2;
		y_subpixel = 0;
		state = states.stomping;
		}
	}
	#endregion

if(state == states.falling)
	#region falling
	{
	//change horizontal speed
	scr_horizontal_movement(move_direction, sprint_held);
	
	//change vertical speed
	y_speed += gravity_acceleration;
	y_speed = clamp(y_speed, max_fall_speed * -1, max_fall_speed);
	
	if(jump_buffer > 0)
		{
		jump_buffer--;
		if(jump_buffer == 0 && jumps_left == max_jumps)
			{jumps_left--;}
		}
	
	//change states
	scr_jump(jump_pressed);
	if(place_meeting(x, y+1, obj_Wall) && y_speed >= 0)
		{
		y_speed = 0;
		y_subpixel = 0;
		state = states.ground_idle;
		}
	if(stomp_pressed && jump_timer >= jump_timer_max / 2)
		{
		y_speed = max_fall_speed * 2;
		y_subpixel = 0;
		state = states.stomping;
		}
	}
	#endregion

if(state == states.stomping)
	#region stomping
	{
	//change horizontal speed
	scr_horizontal_movement(move_direction, sprint_held);
	
	//change states
	scr_jump(jump_pressed);
	if(place_meeting(x, y+1, obj_Wall) && y_speed >= 0)
		{
		y_speed = 0;
		y_subpixel = 0;
		state = states.ground_idle;
		}
	}
	#endregion