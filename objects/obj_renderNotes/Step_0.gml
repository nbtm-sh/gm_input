/// @description Insert description here
// You can write your code in this editor

play_key = vk_space;

prev_key = key;
key = keyboard_check(play_key);

space_key = max(key-prev_key, 0);

map_start = map_start xor space_key;

if (map_start == 1 && space_key) {
	begin_timer = get_timer() / 1000;
}

if (map_start) {
	time_code = (get_timer()/1000) - begin_timer;
} else {
	time_code = 0;
}