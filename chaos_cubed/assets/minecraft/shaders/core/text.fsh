#version 330

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
#moj_import <minecraft:fog.glsl>
#endif

#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
in float sphericalVertexDistance;
in float cylindricalVertexDistance;
#endif

in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
#ifdef IS_GRAYSCALE
    vec4 texColor = texture(Sampler0, texCoord0).rrrr;
#else
    vec4 texColor = texture(Sampler0, texCoord0);
#endif

#ifdef IS_SEE_THROUGH
    vec4 color = texColor * vertexColor;
#else
    vec4 color = texColor * vertexColor * ColorModulator;
#endif
    if (color.a < 0.1) {
        discard;
    }

#ifdef IS_SEE_THROUGH
    fragColor = color * ColorModulator;
#elif defined(IS_GUI)
    fragColor = color;

    if(fragColor.rgb == vec3(0.2509803921568627)) {
        fragColor.rgb = vec3(1.0);
    }

    if(fragColor.r == 0.5019607843137255 && fragColor.g == 1.0 && fragColor.b == 0.1254901960784314){
        fragColor = vec4(1, 1, 1, fragColor.a);
    }

    if(fragColor.r == 0.1254901960784314 && fragColor.g == 0.2470588235294118 && fragColor.b == 0.0313725490196078){
        fragColor = vec4(0.17, 0.15, 0.25, fragColor.a);
    }

    if(fragColor.r == 0.2509803921568627 && fragColor.g == 0.4980392156862745 && fragColor.b == 0.0627450980392157){
        fragColor = vec4(0.47, 0.47, 0.58, fragColor.a);
    }

    if(fragColor.r == 0.0627450980392157 && fragColor.g == 0.1215686274509804 && fragColor.b == 0.0156862745098039){
        fragColor = vec4(0.17, 0.15, 0.25, fragColor.a);
    }
#else
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
#endif
}
