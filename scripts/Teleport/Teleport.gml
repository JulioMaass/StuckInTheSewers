function Teleport(){
	if step_frame != 0 or fade_frame != 0  {return}
	
	var _tile_type = tilemap_get(tilemap_id, player_x, player_y),
		_tileset_x = _tile_type % 16,
		_tileset_y = floor(_tile_type / 16),
		_tile_is_pipe = _tileset_x >= 10 and _tileset_x <= 13 and _tileset_y <= 7

	if !_tile_is_pipe  {return}

	var _pipe_direction = _tileset_x,
		_pipe_color = _tileset_y

	//get player relative position inside the stage
	var _player_stage_x = player_x % STAGE_TILE_SIZE,
		_player_stage_y = player_y % STAGE_TILE_SIZE,
		_pipe_is_vertical = _pipe_direction == PIPE_UP or _pipe_direction == PIPE_DOWN

	//apply teleport to relative position
	if _pipe_color == PIPE_GREEN 
	{
		if _pipe_is_vertical  { _player_stage_y = 15 - _player_stage_y }
							 else { _player_stage_x = 15 - _player_stage_x }
	}
	else if _pipe_color == PIPE_RED 
	{
		if _pipe_is_vertical  { _player_stage_x = 15 - _player_stage_x }
							 else { _player_stage_y = 15 - _player_stage_y }
	}
	else if _pipe_color == PIPE_YELLOW 
	{
		_player_stage_x = 15 - _player_stage_x
		_player_stage_y = 15 - _player_stage_y
	}
	else if _pipe_color == PIPE_BLUE 
	{
		var _old_player_x = _player_stage_x
		_player_stage_x = 15 - _player_stage_y
		_player_stage_y = _old_player_x
	}
	else if _pipe_color == PIPE_WHITE 
	{
		if current_stage == 0 {current_stage = 0}
		current_stage += 1
		_player_stage_x = black_pipe_list[current_stage].x
		_player_stage_y = black_pipe_list[current_stage].y
		
		//ads
		CheckToShowAd();
	}
	else if _pipe_color == PIPE_BLACK 
	{
		current_stage -= 1
		_player_stage_x = white_pipe_list[current_stage].x
		_player_stage_y = white_pipe_list[current_stage].y
	}
	
	//set position based on stage + relative position
	var _coordinates = GetStageCoordinates(current_stage),
		_stage_x = _coordinates[0],
		_stage_y = _coordinates[1]
		player_x = _player_stage_x + _stage_x * STAGE_TILE_SIZE
		player_y = _player_stage_y + _stage_y * STAGE_TILE_SIZE
	
	//reposition camera
	if _pipe_color == PIPE_WHITE or _pipe_color == PIPE_BLACK 
	{
		var _camera_x = _stage_x * STAGE_PIXEL_SIZE,
			_camera_y = _stage_y * STAGE_PIXEL_SIZE
			
		camera_set_view_pos(view_camera[0], _camera_x, _camera_y)
	}
	
	//put player out of the pipe and play exit animation
	var _tile_type = tilemap_get(tilemap_id, player_x, player_y),
	_pipe_direction = _tile_type % 16
	
	if		_pipe_direction = PIPE_UP 		{dir_y = -1}
	else if _pipe_direction = PIPE_DOWN 	{dir_y = 1}
	else if _pipe_direction = PIPE_LEFT 	{dir_x = -1}
	else if _pipe_direction = PIPE_RIGHT 	{dir_x = 1}
	
	SetStepAnimation(dir_x, dir_y, STEP_TYPE_EXIT)
	player_x += dir_x
	player_y += dir_y
	CheckToGetItem(player_x, player_y)
}