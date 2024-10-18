

/*if !surface_exists(srf){
	srf = surface_create(room_width, room_height)
}

surface_set_target(srf)
draw_set_color(c_black)
draw_rectangle(0, 0, room_width, room_height, false)*/
var estica = 0.75
var ww = sprite_get_width(spr_2d_layers) * estica
for(var i = array_length(obj_2d_controller.lista) - 1; i >= 0; i--){
	for(var j = 0; j < room_width; j += ww){
		draw_sprite_ext(spr_2d_layers, lista[i, 0], j, 0, estica, estica, 0, image_blend, lista[i, 1])
		//draw_sprite_ext(spr_teste, 0, j/3, 200, estica, estica, 0, image_blend, 1)
	}
}
/*surface_reset_target()

draw_surface(srf, 0, 0)
*/
