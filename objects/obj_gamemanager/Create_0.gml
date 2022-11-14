//setting up game states
dealing_state = 0;
selecting_state = 1;
discarding_state = 2;
reset_state = 3;

current_state = dealing_state;

//initializing score
player_score = 0;

num_cards = 19;
facedown = true;

timer = 30;
current_card = 0;
selected_card = 0;

cards = ds_list_create();
faceup_cards = ds_list_create();

//making an array of sprites
//spriteList = [spr_carddown, spr_cardrock, spr_cardpaper, spr_cardscissors];

//spriteId = irandom_range(0, 23);
num_card_type = 3;

card_x = 100;
card_y = 250;

row1 = 350;
row2 = 350;
row3 = 350;
row4 = 350;

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
	
	ds_list_shuffle(cards);
	
	show_debug_message("added card" + string(i));
	show_debug_message(card_inst.card_type);
}

