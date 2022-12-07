/// @description Insert description here
// You can write your code in this editor

// initialize camera/window
InitializeCamera()

//game initializations
InitializeStages()
InitializePlayerVariables()

//initialize visuals
InitializeFont()

frame = 0
paused = false

virtual_key_add(44,	130,	40,		48, vk_up)
virtual_key_add(44,	178,	40,		48, vk_down)
virtual_key_add( 8,	154,	36,		48, vk_left)
virtual_key_add(84,	154,	36,		48, vk_right)
