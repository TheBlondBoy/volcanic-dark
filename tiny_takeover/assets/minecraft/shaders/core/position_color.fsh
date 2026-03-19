#version 330

#moj_import <minecraft:dynamictransforms.glsl>

in vec4 vertexColor;

out vec4 fragColor;

void main() {
    vec4 color = vertexColor;
    if (color.a == 0.0) {
        discard;
    }
    if (color.r == 74/255.0 && color.g == 74/255.0 && color.b == 74/255.0) {
        color = vec4(0, 0, 0, 0);
    }
    fragColor = color * ColorModulator;
}
