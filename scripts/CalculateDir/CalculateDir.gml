function CalculateDir(){
	
	//turn input into coortinate additions
	dir_x = 0
	dir_y = 0
	if		input_up	 {dir_y -= 1}
	else if input_down	 {dir_y += 1}
	else if input_left	 {dir_x -= 1}
	else if input_right  {dir_x += 1}
}