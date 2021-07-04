/// @description Insert description here
// You can write your code in this editor

notes = [[0, "S"], [500, "F"], [1000, "J"], [5000, "S"]];

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