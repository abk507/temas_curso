

for(var i = 0; i < sprite_get_number(spr_2d_layers); i++){
	lista[i, 0] = i
	lista[i, 1] = true
	f = instance_create_depth(100, 0, i - 1000, obj_2d_lista)
	f.ygo = 100 + i*70
	f.count = i
}