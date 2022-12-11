/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(ord("Q")) or keyboard_check_pressed(ord("W")) 
{
	paused = false
}

if paused == false 
{
	UpdateFrame()
	Teleport()
	GetInput()
	CalculateDir()
	ApplyMovement()
	AnimateStep()
}

if keyboard_check_pressed(ord("Q")) 
{
	paused = true
}

show_debug_message(adTimer);
show_debug_message(adStageCounter);
show_debug_message(adsShown);
