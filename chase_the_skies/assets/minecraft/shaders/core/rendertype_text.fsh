#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
        if(color.r < 64/255.0 && color.g < 64/255.0 && color.b < 64/255.0 && color.r > 63/255.0 && color.g > 63/255.0 && color.b > 63/255.0){
        color = vec4(1, 1, 1, color.a);
    }

    if(color.r < 127/255.0 && color.g < 253/255.0 && color.b < 33/255.0 && color.r > 125/255.0 && color.g > 251/255.0 && color.b > 31/255.0){
        color = vec4(1, 1, 1, color.a);
    }

    if(color.r < 33/255.0 && color.g < 63/255.0 && color.b < 9/255.0 && color.r > 31/255.0 && color.g > 61/255.0 && color.b > 7/255.0){
        color = vec4(0.17, 0.15, 0.25, color.a);
    }

    if(color.r < 64/255.0 && color.g < 126/255.0 && color.b < 17/255.0 && color.r > 62/255.0 && color.g > 124/255.0 && color.b > 15/255.0){
        color = vec4(0.47, 0.47, 0.58, color.a);
    }

    if(color.r < 17/255.0 && color.g < 32/255.0 && color.b < 5/255.0 && color.r > 15/255.0 && color.g > 30/255.0 && color.b > 3/255.0){
        color = vec4(0.17, 0.15, 0.25, color.a);
    }
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
