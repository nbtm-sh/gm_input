/// @description Insert description here
// You can write your code in this editor

function draw_notes() {
	var y_ = 0;
	var x_ = 0;
	for (y_ = 0; y_ <= array_length_1d(notes) - 1; y_ += 1) {
		for (x_ = 0; x_ <= array_length_1d(notes[y_]) - 1; x_ += 1) {
			var modx = notes[y_][x_][0] mod line_duration;
			var xscale = modx/line_duration;
			var xpos = xscale * line_length;
			
			//var yval = -floor((time_code)/line_duration)*y_scale;
			var yval = 0 ;
			yval -= lerp(0, y_scale, time_code/line_duration);
			
			draw_text(xpos + x_offset, yval + (y_*y_scale) + y_offset, notes[y_][x_][1]);
		}
	}
}

function draw_inputs() {
	var y_ = 0;
	var x_ = 0;
	for (y_ = 0; y_ <= array_length_1d(inputs) - 1; y_ += 1) {
		for (x_ = 0; x_ <= array_length_1d(inputs[y_]) - 1; x_ += 1) {
			var modx = inputs[y_][x_][0] mod line_duration;
			var xscale = modx/line_duration;
			var xpos = xscale * line_length;
			
			//var yval = -floor((time_code)/line_duration)*y_scale;
			var yval = 0 ;
			yval -= lerp(0, y_scale, time_code/line_duration);
			
			draw_text_color(xpos + x_offset, yval + (y_*y_scale) + y_offset, notes[y_][x_][1], 16776960, 16776960, 16776960, 16776960, 1);
		}
	}
}

function draw_cursor(_x) {
	var modx = _x mod line_duration;
	var xscale = modx/line_duration;
	var xpos = xscale * line_length;
	
	
	var yval = 0 ;
	yval -= lerp(0, 25, (time_code % line_duration)/line_duration);
	draw_text(0, 400, string((get_timer() / 1000) - begin_timer));
	
	draw_text((xpos mod line_duration) + 100, (yval % 25) + 25, "|\n|\nV");
}

draw_text(0, 0, string(json_stringify(notes)) + "\n" + string(map_start));

draw_notes();
draw_inputs();
if (map_start) {
	draw_cursor(((get_timer() / 1000) - begin_timer));
} else {
	draw_cursor(100);
}

d = ds_list_create();
ds_list_add(d, "x", 10);
draw_text(100, 200, json_encode(d));