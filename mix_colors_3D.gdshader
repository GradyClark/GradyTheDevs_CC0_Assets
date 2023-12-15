// Name: Mix Colors 3D
// Description: Mix colors based on a mask
// Author: GradyTheDev
// License: CC0 1.0

// How to use
// Add this shader as the next pass after
// the shader that creates the shader mask
// Higher mask values (ALBEDO) increase the presence
// of color A, and reduces the presence of color B.

shader_type spatial;

uniform vec3 color_a: source_color = vec3(1.0, 0.0, 1.0);
uniform vec3 color_b: source_color = vec3(0);
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	vec4 currentColor = textureLod(screen_texture, SCREEN_UV, 0.0);
	ALBEDO = mix(color_a, color_b, currentColor.rgb);
}
