draw_set_halign(fa_right);
draw_text(x-20, y + 5, string_format(x_speed,3,2));
draw_text(x-20, y + 15, string_format(y_speed,3,2));
draw_text(x+50, y + 5, string_format(x_subpixel,3,2));
draw_text(x+50, y + 15, string_format(y_subpixel,3,2));
draw_text(x-30, y - 40, string(jumps_left));
draw_text(x, y - 40, string(jump_timer));
draw_text(x+30, y-40, string(jump_buffer));