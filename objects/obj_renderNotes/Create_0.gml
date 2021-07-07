/// @description Insert description here
// You can write your code in this editor

notes = [[500, "S"], [1000, "D"], [1500, "F"], [2000, "J"], [2500, "K"], [3000, "L"], [3500, "S"], [4000, "D"], [4500, "F"], [5000, "J"], [5500, "K"], [6000, "L"]];

notes = json_stringify(notes);
notes = json_parse(notes);

inputs = [];

map_start = false;
line_duration = 5000;
line_length = 1092;

x_offset = 100;
y_offset = 100;

y_scale = 50;

prev_space = false;
key = false;

begin_timer = 0;
end_timer = 0;

time_code = 0;

delta_time_window = 100;