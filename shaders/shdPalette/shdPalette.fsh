
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float palette_shade; //palette sprite y axis
uniform sampler2D palette_texture; //important: for making a shader texture, the sprite needs its own texture page

void main()
{
	vec4 original_color = texture2D(gm_BaseTexture, v_vTexcoord);
	//define palette sprite x axis
	float palette_index = (original_color.r + original_color.g + original_color.b) / 3.0;
	//
	vec2 palette_coordinate = vec2(palette_index, palette_shade);
	vec4 palette_color = texture2D(palette_texture, palette_coordinate);
	palette_color.a = original_color.a;
	
	gl_FragColor = v_vColour * palette_color;
}


