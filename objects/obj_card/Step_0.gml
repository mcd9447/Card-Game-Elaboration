x = lerp(x, target_x, 0.1);
y = lerp(y, target_y, 0.1);

if (facedown){
	sprite_index = spr_facedown;
} else {
	if (card_type == 0){
		sprite_index = spr_1
	} 
	else if (card_type == 1){
		sprite_index = spr_2
	} 
	else if (card_type == 2){
		sprite_index = spr_3
	} 
	else if (card_type == 3){
		sprite_index = spr_4
	} 
	else if (card_type == 4){
		sprite_index = spr_5
	}
}