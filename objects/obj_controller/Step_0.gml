

if passa_room == noone{
	alpha_dark = max(0, alpha_dark-0.02)
}
else{
	alpha_dark = min(1, alpha_dark+0.02)
	if alpha_dark == 1{
		room_goto(passa_room)
		passa_room = noone
	}
}

if keyboard_check_released(vk_escape){
	if room = room_menu{ game_end() }
	else{ passa_room = room_menu }
}