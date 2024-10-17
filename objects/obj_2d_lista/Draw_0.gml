

if !surface_exists(srf){
	srf = surface_create(room_width, room_height)
}

surface_set_target(srf)
draw_set_color(c_white)
draw_rectangle(0, 0, room_width, room_height, false)
gpu_set_blendmode(bm_normal)
gpu_set_alphatestenable(false)
var c = obj_2d_controller
for(var i = array_length(obj_2d_controller.lista) - 1; i >= 0; i--){
	draw_sprite_ext(spr_2d_layers, c.lista[i, 0], 0, 0, 0.75, 0.75, 0, c_white, c.lista[i, 1])
}
surface_reset_target()

draw_surface(srf, 0, 0)

draw_set_colour(c_white)
for(var i = 0; i < array_length(obj_2d_controller.lista); i++){
	draw_text(x, y+i*15, obj_2d_controller.lista[i])
}