/// @description Insert description here
// You can write your code in this editor

//general info
var _stage_coordinates = GetStageCoordinates(current_stage),
	_stage_tile_x = _stage_coordinates[0] * STAGE_TILE_SIZE,
	_stage_tile_y = _stage_coordinates[1] * STAGE_TILE_SIZE,
	_stage_pixel_x = _stage_coordinates[0] * STAGE_PIXEL_SIZE,
	_stage_pixel_y = _stage_coordinates[1] * STAGE_PIXEL_SIZE

//draw coins
for (var _x = 0; _x < STAGE_TILE_SIZE; _x += 1)
{
	for (var _y = 0; _y < STAGE_TILE_SIZE; _y += 1)
	{
		var _tile_x = _x + _stage_tile_x,
			_tile_y = _y + _stage_tile_y,
			_tile_type = tilemap_get(tilemap_id, _tile_x, _tile_y)
		if _tile_type == 5 
		{
			draw_sprite(sprCoin, frame/6, _tile_x * TILE_SIZE, _tile_y * TILE_SIZE)
		}
	}
}

//draw character
if step_type == STEP_TYPE_JUMP 
{
	if fade_frame == 0 
	{
		var _player_sprite_x = player_x * TILE_SIZE + player_x_offset + step_offset_x,
			_player_sprite_y = player_y * TILE_SIZE + player_y_offset + step_offset_y

		draw_sprite_ext(sprMrMouse, player_sprite, _player_sprite_x, _player_sprite_y, player_x_scale, 1, 0, c_white, 1)
	}
}
else
{
	var _player_sprite_x = player_x * TILE_SIZE - player_x_scale * (TILE_SIZE - 1) + 4,
		_player_sprite_y = player_y * TILE_SIZE + player_y_offset,
		_left = 0,
		_top = 0,
		_width = 14,
		_height = 13
	
	//sprite clipping
	if step_dir_y == -1 
	{
		//up
		if step_type == STEP_TYPE_ENTER 
		{
			_player_sprite_y = player_y * TILE_SIZE + player_y_offset + 11
			_top = 10 - step_frame
		}
		else if step_type == STEP_TYPE_EXIT 
		{
			_player_sprite_y = player_y * TILE_SIZE + player_y_offset + step_frame + 1
			_height = 10 - step_frame
		}
	}
	else if step_dir_y == 1 
	{
		//down
		if step_type == STEP_TYPE_ENTER 
		{
			_player_sprite_y = player_y * TILE_SIZE + player_y_offset - step_frame - 1
			_height = 4 + step_frame
		}
		else if step_type == STEP_TYPE_EXIT 
		{
			_player_sprite_y = player_y * TILE_SIZE + player_y_offset + 3
			_top = 4 + step_frame
		}
	}
	else if step_dir_x == -1 
	{
		//left
		if step_type == STEP_TYPE_ENTER 
		{
			_player_sprite_x = player_x * TILE_SIZE + 12 + step_frame
			_width = 4 + step_frame
		}
		else if step_type == STEP_TYPE_EXIT 
		{
			_player_sprite_x = player_x * TILE_SIZE + 8
			_left = 4 + step_frame
		}
	}
	else if step_dir_x == 1 
	{
		//right
		if step_type == STEP_TYPE_ENTER 
		{
			_player_sprite_x = player_x * TILE_SIZE - 4 - step_frame
			_width = 4 + step_frame
		}
		else if step_type == STEP_TYPE_EXIT 
		{
			_player_sprite_x = player_x * TILE_SIZE
			_left = 4 + step_frame
		}
	}
	draw_sprite_part_ext(sprMrMouse, player_sprite, _left, _top, _width, _height, _player_sprite_x, _player_sprite_y, player_x_scale, 1, c_white, 1);
}


//mask surface
if fade_frame > 0 
{
	SurfaceCheckOrCreate("mask_surface", 128, 128)
	surface_set_target(mask_surface)
	draw_set_color(c_black)
	draw_rectangle(0, 0, STAGE_PIXEL_SIZE, STAGE_PIXEL_SIZE, false)
	gpu_set_blendmode(bm_subtract)
	
	var _circle_x = (player_x % STAGE_TILE_SIZE) * TILE_SIZE + 4,
		_circle_y = (player_y % STAGE_TILE_SIZE) * TILE_SIZE + 4
	draw_circle(_circle_x, _circle_y, (fade_frame-1) * 6, false)
	gpu_set_blendmode(bm_normal)
	surface_reset_target()	
	
	draw_surface(mask_surface, _stage_pixel_x, _stage_pixel_y)
}

