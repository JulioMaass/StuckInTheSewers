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