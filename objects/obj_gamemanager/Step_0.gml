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
	//counting down timer
	player_timer -= room_speed * 0.0005;
	
	//selecting cards
	if (ds_list_size(faceup_cards) < 2 && mouse_check_button_pressed(mb_left)){
		card_inst = instance_position(mouse_x, mouse_y, obj_card);
		if (card_inst != noone){
			if (card_inst.facedown) {
				card_inst.facedown = false;
				ds_list_add(faceup_cards, card_inst);
				show_debug_message("card type is" + string(card_inst.card_type));
			}
		}
	}
	
	if (ds_list_size(faceup_cards) == 2){
		if (faceup_cards[|0].card_type == faceup_cards[|1].card_type){
			show_debug_message("Match!");
				//choose a random color
				var c = choose(c_fuchsia, c_purple, c_teal, c_blue);
				//explode
				part_particles_create_color(particle_system, faceup_cards[|0].x + 50, faceup_cards[|0].y + 75, explosion_particle_type, c, 100);
				part_particles_create_color(particle_system, faceup_cards[|1].x + 50, faceup_cards[|1].y + 75, explosion_particle_type, c, 100);
				//destroy cards
				instance_destroy(faceup_cards[|0], false);
				instance_destroy(faceup_cards[|1], false);
				//add to player score
				player_score += 1;
		}
		else {
			show_debug_message("No Match");
				//lose time for wrong guess
				player_timer -= 2;
				//flip back down
				faceup_cards[|0].facedown = true;
				faceup_cards[|1].facedown = true;
		}
	//resetting ds list
	ds_list_clear(faceup_cards);
	}
	
	//win or lose
	if (player_score >= 10){
		current_state = win_state;
	}
	
	if (player_score < 10 && player_timer <= 0){
		current_state = lose_state;
	}
}

//lose state
if (current_state = 3){
	room_goto(room_lose);
}

//win state
if (current_state = 4){
	room_goto(room_win);
}