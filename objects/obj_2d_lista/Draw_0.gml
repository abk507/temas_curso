

draw_set_colour(c_white)
for(var i = 0; i < array_length(obj_2d_controller.lista); i++){
	draw_text(x, y+i*15, obj_2d_controller.lista[i])
}