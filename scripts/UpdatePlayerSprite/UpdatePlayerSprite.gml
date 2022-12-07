function UpdatePlayerSprite(){
	if dir_y == -1 
	{
		player_sprite = 1
	}
	else if dir_y == 1 
	{
		player_sprite = 0
	}
	else if dir_x == -1 
	{
		player_x_scale = -1
		player_sprite = 0
	}
	else if dir_x == 1 
	{
		player_x_scale = 1
		player_sprite = 0
	}
}