#version 330

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

    if(color.rgb == vec3(0.2509803921568627)) {
        color.rgb = vec3(1.0);
    }

    if(color.r == 0.5019607843137255 && color.g == 1.0 && color.b == 0.1254901960784314){
        color = vec4(1, 1, 1, color.a);
    }

    if(color.r == 0.1254901960784314 && color.g == 0.2470588235294118 && color.b == 0.0313725490196078){
        color = vec4(0.17, 0.15, 0.25, color.a);
    }

    if(color.r == 0.2509803921568627 && color.g == 0.4980392156862745 && color.b == 0.0627450980392157){
        color = vec4(0.47, 0.47, 0.58, color.a);
    }

    if(color.r == 0.0627450980392157 && color.g == 0.1215686274509804 && color.b == 0.0156862745098039){
        color = vec4(0.17, 0.15, 0.25, color.a);
    }

    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
