/// @description Insert description here
// You can write your code in this editor

function calc_pos(milis) {
	note_x = ((milis mod line_duration)/line_duration)*line_length;
	note_y = floor(milis/line_duration)*y_scale;
	
	return [note_x, note_y];
}

function calc_scroll(milis) {
	var yval = 0 ;
	yval += lerp(0, y_scale, milis/line_duration);
	
	return yval
}

function get_nearest_note(milis, range) {
	var closest = "";
	for (var i = 0; i < array_length_1d(notes); i += 1) {
		if (abs(milis-notes[i][0]) < range) {
			if (closest != "") {
				return notes[i];
			}
			closest = notes[i];
		} else {
			if (closest != "") {
				return closest;	
			}
		}
	}
	
	if (closest != "") {
		return closest;
	}
	
	return false;
}

function draw_notes() {
	for (var i = 0; i < array_length_1d(notes); i += 1) {
		note_pos = calc_pos(notes[i][0]);
		
		note_pos[0] += 100;
		note_pos[1] += 100 - calc_scroll(time_code);
		
		
		draw_text_color(note_pos[0], note_pos[1], notes[i][1], 16777215, 16777215, 16777215, 16777215, 1);
		switch(notes[i][1]) {
		case "S" :
		draw_sprite(note_S,0,note_pos[0],note_pos[1]);
		break;
		case "D" :
		draw_sprite(note_D,0,note_pos[0],note_pos[1]);
		break;
		case "F" :
		draw_sprite(note_F,0,note_pos[0],note_pos[1]);
		break;
		case "J" :
		draw_sprite(note_J,0,note_pos[0],note_pos[1]);
		break;
        case "K" :
		draw_sprite(note_K,0,note_pos[0],note_pos[1]);
		break;
		case "L" :
		draw_sprite(note_L,0,note_pos[0],note_pos[1]);
		break;
		}
		
		
	}
}

function draw_inputs() {
	for (var i = 0; i < array_length_1d(inputs); i += 1) {
		note_pos = calc_pos(inputs[i][0]);
		
		note_pos[0] += 100;
		note_pos[1] += 100 - calc_scroll(time_code);
		
		nearest = get_nearest_note(inputs[i][0], delta_time_window);
		draw_text(0, 300 + i*20, nearest); // Draw the inputs
		
		if (nearest != false) {
			note_pos = calc_pos(nearest[0]);
			note_pos[0] += 100;
			note_pos[1] += 100 - calc_scroll(time_code);
			
			colour = 65280;
			if (nearest[1] != inputs[i][1]) {
				colour = 255;	
			}
			
			draw_text_color(note_pos[0], note_pos[1], inputs[i][1], colour, colour, colour, colour, 1);
			continue;
		}
		
		draw_text_color(note_pos[0], note_pos[1], inputs[i][1], 255, 255, 255, 255, 1);
	}
}

function draw_cursor() {
	note_pos = calc_pos(time_code);
		
	note_pos[0] += 100;
	note_pos[1] += 35 - calc_scroll(time_code);
	
	draw_text(note_pos[0], note_pos[1], "|\n|\nV");
}

draw_text(0, 0, string(json_stringify(notes)) + "\n" + string(map_start));

draw_notes();
draw_inputs();
draw_cursor();