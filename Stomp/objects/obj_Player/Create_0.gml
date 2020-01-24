enum states
	{
	ground_idle,
	ground_moving,
	jumping,
	falling,
	stomping
	};

jump_speed = 4;
jump_timer = 0;//how long they've held the jump button
jump_timer_max = 20;
jump_buffer = 0;//how long after walking off a ledge you can press jump and it'll still count
jump_buffer_max = 10;
jumps_left = 2;
max_jumps = 2;
moving_acceleration = 0.25;//acceleration for horizontal movement
gravity_acceleration = 0.2;//gravity, just to give it a different name than GM's built in one
max_move_speed = 3;
max_fall_speed = 6;
state = states.ground_idle;

//how much per frame you intend to move
x_speed = 0;
y_speed = 0;

x_subpixel = 0;
y_subpixel = 0;