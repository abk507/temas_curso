

draw_set_color(c_white)
draw_set_halign(fa_top)
draw_set_valign(fa_left)
draw_text(0, 0, fps)

if toca_subway_surfers{
	video_srf = video_draw()
	if !video_srf[0]{
		draw_surface_ext(video_srf[1], 0, 0, 0.5, 0.5, 0, c_white, 1)
	}
}