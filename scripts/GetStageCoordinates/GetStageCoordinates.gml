function GetStageCoordinates(_stage_number){
	var _stage_x = _stage_number % world_stage_size_x,
		_stage_y = floor(_stage_number / world_stage_size_x)
	return [_stage_x, _stage_y]
}
