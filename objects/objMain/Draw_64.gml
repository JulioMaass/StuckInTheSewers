/// @description Insert description here
// You can write your code in this editor

//draw upper screen with palette effect
shader_set(shdPalette);
shader_set_uniform_f(shadeUniform, shade);
texture_set_stage(paletteUniform, paletteTexture);
draw_surface(application_surface, 0, 0);
shader_reset();

//draw lower screen
draw_set_color(c_black)
draw_rectangle(0, 128, 128, 228, false)

draw_sprite(sprGamepad, 0, 0, 128)

////draw buttons hitboxes
//draw_set_color(c_white)
//draw_rectangle(44,	130,	-1+84,		-1+178, true)
//draw_rectangle(44,	178,	-1+84,		-1+226, true)
//draw_rectangle(8,	154,	-1+44,		-1+202, true)
//draw_rectangle(84,	154,	-1+120,		-1+202, true)

if pressed_up 		{draw_sprite(sprButtonUp, 1,	64-16,		128+2+8)}
else				{draw_sprite(sprButtonUp, 0,	64-16,		128+2+8)}
if pressed_down 	{draw_sprite(sprButtonDown, 1,	64-16,		128+2-8+64)}
else				{draw_sprite(sprButtonDown, 0,	64-16,		128+2-8+64)}
if pressed_left 	{draw_sprite(sprButtonLeft, 1,	64-16-32,	128+2+32)}
else				{draw_sprite(sprButtonLeft, 0,	64-16-32,	128+2+32)}
if pressed_right 	{draw_sprite(sprButtonRight, 1,	64-16+32,	128+2+32)}
else				{draw_sprite(sprButtonRight, 0,	64-16+32,	128+2+32)}

draw_rectangle(0, 128, 38, 136, false)
draw_set_color(c_white)
draw_text(2, 130, "COINS:" + string(coins))

draw_set_color(c_black)
draw_rectangle(100, 128, 128, 136, false)
draw_set_color(c_white)
draw_text(102, 130, "KEYS:" + string(keys))
