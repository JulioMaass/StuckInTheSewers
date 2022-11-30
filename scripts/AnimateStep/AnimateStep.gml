function AnimateStep(){
	if step_frame > 0 then
	{
		//calculate offset
		var _jump_height = GetJumpHeight()
		step_offset_x = -step_dir_x * step_frame
		step_offset_y = -step_dir_y * step_frame + _jump_height
		
		step_frame -= 1
	}
	else
	{
		//make sure offset is zero if no animation is going on
		step_offset_x = 0
		step_offset_y = 0
		step_type = STEP_TYPE_JUMP
	}
	if fade_frame > 0 then
	{
		fade_frame -= 1
	}
}

function GetJumpHeight(){
	//bypass if animation is not a jump
	if step_type != STEP_TYPE_JUMP then {return 0}
	
	//set jump height
	var _jump_height = 0
	if step_frame >= 3 and step_frame <= 6 then			{_jump_height = -2}
	else if step_frame >= 2 and step_frame <= 7 then 	{_jump_height = -1}
	else												{_jump_height =  0}
	
	return _jump_height
}