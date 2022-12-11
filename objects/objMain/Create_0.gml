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

//shader stuff
shadeUniform = shader_get_uniform(shdPalette, "palette_shade");
shade = 0/8;
//important: for making a shader texture, the sprite needs its own texture page (check out in the sprite properties)
paletteUniform = shader_get_sampler_index(shdPalette, "palette_texture");
paletteTexture = sprite_get_texture(sprPaletteFromGrayscale, 0);

//create surfaces
mask_surface = noone;

//play music
//audio_play_sound(musMain, 10, true)

//ads stuff
adTimer = 0;
adStageCounter = 0;
adsShown = 0;