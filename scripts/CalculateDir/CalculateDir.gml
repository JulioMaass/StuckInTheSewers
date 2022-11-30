function CalculateDir(){
	
	//turn input into coortinate additions
	dir_x = 0
	dir_y = 0
	if		input_up	then {dir_y -= 1}
	else if input_down	then {dir_y += 1}
	else if input_left	then {dir_x -= 1}
	else if input_right then {dir_x += 1}
}