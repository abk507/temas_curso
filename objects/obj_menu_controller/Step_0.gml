

ygo = clamp(ygo, 0, room_height - 1080)
y_current += (ygo - y_current) / 10

camera_set_view_pos(view_camera[0], 0, y_current)