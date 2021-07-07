/// @description Insert description here
// You can write your code in this editor

key_s = keyboard_check_pressed(ord("S"));
key_d = keyboard_check_pressed(ord("D"));
key_f = keyboard_check_pressed(ord("F"));

key_j = keyboard_check_pressed(ord("J"));
key_k = keyboard_check_pressed(ord("K"));
key_l = keyboard_check_pressed(ord("L"));

key_map = ["S", "D", "F", "J", "K", "L"];
keys_down = [key_s, key_d, key_f, key_j, key_k, key_l];



for (var i = 0; i < array_length_1d(keys_down); i += 1) {
	if (keys_down[i]) {
		array_push(inputs, [time_code, key_map[i]]);
	}
}