// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InitializeFont(){
	font = font_add_sprite_ext(sprPicoFont,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.:!",false,1);
	draw_set_font(font);
}