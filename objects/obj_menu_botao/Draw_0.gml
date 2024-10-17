var cyy = camera_get_view_y(view_camera[0])
if y - cyy < 1380 and cyy - y < 300{
	depth = -efeito_cresce * 10

	efeito_cresce = clamp(efeito_cresce + (efeito_crescendo - efeito_cresce)/10, 0, 1)
	draw_sprite_ext(sprite_index, image_index, x, y,
		image_xscale+efeito_cresce, image_yscale+efeito_cresce, image_angle, image_blend, image_alpha)


	var largura = sprite_get_width(sprite_index) * (image_xscale + efeito_cresce)
	var altura = sprite_get_height(sprite_index) * (image_yscale + efeito_cresce)

	efeito_transicao += ((largura * efeito_cresce) - efeito_transicao) / 5

	var srf1 = surface_create(largura, altura)
	surface_set_target(srf1)
	draw_sprite_ext(spr_botao_tema_mask, 0, 0, 0, image_xscale + efeito_cresce, image_yscale + efeito_cresce, image_angle, image_blend, image_alpha);
	gpu_set_blendmode(bm_subtract)
	draw_sprite_ext(spr_botao_tema_mask, 0, efeito_transicao, 0, image_xscale + efeito_cresce, image_yscale + efeito_cresce, image_angle, image_blend, image_alpha);
	gpu_set_blendmode(bm_normal)
	surface_reset_target()

	var srf2 = surface_create(largura, altura)
	surface_set_target(srf2)
	draw_sprite_ext(spr_botao_tema_mask, 0, 0, 0, image_xscale + efeito_cresce, image_yscale + efeito_cresce, image_angle, image_blend, image_alpha);
	gpu_set_blendmode(bm_subtract)
	draw_surface(srf1, 0, 0)
	gpu_set_blendmode(bm_normal)
	surface_reset_target()



	gpu_set_blendenable(false)
	gpu_set_colorwriteenable(false,false,false,true);
	draw_set_alpha(0);
	draw_rectangle(0,0, room_width,room_height, false);
	draw_set_alpha(1);
	draw_surface(srf2, x-largura/2, y-altura/2)
	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true,true,true,true);
	gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
	gpu_set_alphatestenable(true);

	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_colour(c_white)
	draw_text_transformed(x, y, obj_menu_controller.nome_fases[count], 1+efeito_cresce, 1+efeito_cresce, 0)
	//draw_sprite_ext(spr_teste, 0, x, y, image_xscale+efeito_cresce, image_yscale+efeito_cresce, 0, c_white, 1)

	gpu_set_alphatestenable(false);
	gpu_set_blendmode(bm_normal);

	//metadinha

	//metadinha
	if efeito_transicao > 0.01{
		gpu_set_blendenable(false)
		gpu_set_colorwriteenable(false,false,false,true);
		draw_set_alpha(0);
		draw_rectangle(0,0, room_width,room_height, false);
		draw_set_alpha(1);
		draw_surface(srf1, x-largura/2, y-altura/2)
		gpu_set_blendenable(true);
		gpu_set_colorwriteenable(true,true,true,true);
		gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
		gpu_set_alphatestenable(true);

		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_set_colour(c_white)
		draw_sprite_ext(spr_teste, 0, x, y, image_xscale+efeito_cresce, image_yscale+efeito_cresce, 0, c_white, 1)

		gpu_set_alphatestenable(false);
		gpu_set_blendmode(bm_normal);
	}

	surface_free(srf1)
	surface_free(srf2)

	//passador
	draw_sprite_ext(spr_botao_tema_passa, 0, x -largura/2 + efeito_transicao, y,
		 image_xscale+efeito_cresce, image_yscale+efeito_cresce, image_angle, image_blend, image_alpha)
}