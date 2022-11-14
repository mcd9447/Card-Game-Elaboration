//setting up game states
dealing_state = 0;
flipping_state = 1;
selecting_state = 2;
lose_state = 3;
win_state = 4;

current_state = dealing_state;

//initializing score and timer
player_score = 0;
player_timer = 100;

num_cards = 19;

timer = 30;
current_card = 0;

cards = ds_list_create();

num_card_type = 5;

card_x = 100;
card_y = 250;

row1 = 325;
row2 = 325;
row3 = 325;
row4 = 325;

//create card instances
for (i = 0; i <= num_cards; i++) {
	card_inst = instance_create_layer(0, 0, "Instances", obj_card);
	card_inst.card_type = i%num_card_type;
	
	//add to cards list
	ds_list_add(cards, card_inst);
	
	//positions of cards
	cards[|i].x = card_x;
	cards[|i].y = card_y + (2*i);
	
	cards[|i].target_x = 100;
	cards[|i].target_y = 300 + (2*i);
	
	show_debug_message("added card" + string(i));
	show_debug_message("the card type is" + string(card_inst.card_type));
}

