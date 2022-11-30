function InitializeCamera(){
	//configure window
	screen_width = GAMEPLAY_SIZE_X
	screen_height = GAMEPLAY_SIZE_Y + UI_SIZE_Y
	screen_scale = 3
	window_set_size(screen_width * screen_scale, screen_height * screen_scale)
	
	//configure camera
	surface_resize(application_surface, screen_width, screen_height)
	view_enabled = true
	view_visible[0] = true
	view_camera[0] = camera_create_view(0, 0, screen_width, screen_height)
	
	//mask surface
	mask_surface = -1
	fade_frame = 0
	fade_type = 0
}
