// Name: Mix Texture 3D
// Description: Mix textures based on a mask
// Author: GradyTheDev
// License: CC0 1.0
// Date: 2023-12-14

// How to use
// Add this shader as the next pass after
// the shader that creates the shader mask
// Higher mask values (ALBEDO) increase the presence
// of color A, and reduces the presence of color B.

shader_type spatial;

uniform sampler2D texture_a: hint_default_black;
uniform sampler2D texture_b: hint_default_white;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	vec4 currentColor = textureLod(screen_texture, SCREEN_UV, 0.0);
	vec4 a = textureLod(texture_a, UV, 0.0);
	vec4 b = textureLod(texture_b, UV, 0.0);
	ALBEDO = mix(a.rgb, b.rgb, currentColor.rgb);
}
