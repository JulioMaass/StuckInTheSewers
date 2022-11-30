function UpdatePlayerSprite(){
	if dir_y == -1 then
	{
		player_sprite = 1
	}
	else if dir_y == 1 then
	{
		player_sprite = 0
	}
	else if dir_x == -1 then
	{
		player_x_scale = -1
		player_sprite = 0
	}
	else if dir_x == 1 then
	{
		player_x_scale = 1
		player_sprite = 0
	}
}