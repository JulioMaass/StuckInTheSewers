/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(ord("Q")) or keyboard_check_pressed(ord("W")) then
{
	paused = false
}

if paused == false then
{
	frame += 1
	Teleport()
	GetInput()
	CalculateDir()
	ApplyMovement()
	AnimateStep()
}

if keyboard_check_pressed(ord("Q")) then
{
	paused = true
}