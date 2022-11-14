draw_set_font(font1)

draw_text(110, 40, "SCORE:" + string(player_score) + "/10");

draw_text(1250, 40, "TIMER:" + string(round(player_timer)));

if (current_state = 1){
	draw_text_colour(175, 380, "MEMORIZE!", c_fuchsia, c_fuchsia, c_purple, c_purple, 1);
}

if (current_state = 2){
	draw_text_colour(175, 380, "MATCH!", c_fuchsia, c_fuchsia, c_purple, c_purple, 1);
}