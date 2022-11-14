show_debug_message(current_state);

timer--

//dealing state
if (current_state = 0) {

if (timer <= 0){
	//dealing row 1
	if (current_card >=0){
		cards[|current_card].target_x = row1;
		cards[|current_card].target_y = 50;
		audio_play_sound(sound_card, 10, false);
		row1 +=150;
	}
	
	//dealing row 2
	if (current_card >=5){
		cards[|current_card].target_x = row2;
		cards[|current_card].target_y = 225;
		audio_play_sound(sound_card, 10, false);
		row2 +=150;
	}
	
	//dealing row 3
	if (current_card >=10){
		cards[|current_card].target_x = row3;
		cards[|current_card].target_y = 400;
		audio_play_sound(sound_card, 10, false);
		row3 +=150;
	}
	
	//dealing row 4
	if (current_card >=15){
		cards[|current_card].target_x = row4;
		cards[|current_card].target_y = 575;
		audio_play_sound(sound_card, 10, false);
		row4 +=150;
	}
	
	current_card += 1;

	//resetting timer
	timer = 30;
	
	if (current_card >=20){
		current_state = flipping_state;
	}
}
}

//flipping state
if (current_state = 1){
	
if (timer <= 0){
	
	if (flipped = false){
	obj_card.facedown = false;
	timer = 150;
	flipped = true;
	}
	
	else if (flipped = true){
		obj_card.facedown = true;
		current_state = selecting_state;
		}
}
}

//selecting state
if (current_state = 2){
	player_timer -= room_speed * 0.0005;
	
}