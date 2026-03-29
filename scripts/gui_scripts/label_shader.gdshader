shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform vec4 color_light : source_color = vec4(0.125, 0.082, 0.2, 1.0);
uniform vec4 color_dark : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float threshold : hint_range(0.0, 1.0) = 0.5;


void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	if (tex_color.a > 0.0) {
		vec4 screen_color = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0);
		float brightness = dot(screen_color.rgb, vec3(0.299, 0.587, 0.114));
		COLOR = brightness > threshold ? vec4(color_light.rgb, tex_color.a) : vec4(color_dark.rgb, tex_color.a);
	} else {
		COLOR = vec4(0.0, 0.0, 0.0, 0.0);
	}
}