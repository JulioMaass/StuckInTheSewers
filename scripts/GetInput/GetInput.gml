function GetInput(){
	if step_frame > 0 or fade_frame > 0 then 
	{
		input_up = false
		input_down = false
		input_left = false
		input_right = false
		return
	}
	
	pressed_up = keyboard_check(vk_up)
	pressed_down = keyboard_check(vk_down)
	pressed_left = keyboard_check(vk_left)
	pressed_right = keyboard_check(vk_right)
	
	input_up = pressed_up and !pressed_down
	input_down = pressed_down and !pressed_up
	input_left = pressed_left and !pressed_right
	input_right = pressed_right and !pressed_left
}