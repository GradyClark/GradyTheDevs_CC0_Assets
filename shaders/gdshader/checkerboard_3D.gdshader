// Name: Checkerboard 3D
// Description: 3D world space checkerboard mask shader
// Author: GradyTheDev
// License: CC0 1.0
// Date: 2023-12-14

shader_type spatial;
render_mode unshaded;

uniform float grid_size = 1.0;

// 0.001 is a workaround for what I think is a shader bug.
// It's probbly this bug 
// https://github.com/godotengine/godot/issues/78889
// https://github.com/godotengine/godot/issues/85711
uniform vec3 offset = vec3(0.001); 

const vec3 white = vec3(1.0);

void fragment() {
	vec3 world = (INV_VIEW_MATRIX * vec4(VERTEX+offset, 1.0)).xyz;
	world.y = -world.y; // make it match godot's directions

	ALBEDO = round(mod(world/(grid_size*2.0), 1.0));
	int a = int(ALBEDO.x + ALBEDO.y + ALBEDO.z);
	ALBEDO = white * float(a == 2 || a == 0);
}
