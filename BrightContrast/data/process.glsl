#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
varying vec4 vertTexCoord;

uniform float bright;
uniform float contrast;

void main(void){
	
	vec4 preColor = texture2D(texture, vertTexCoord.st);
	
    
    vec4 posColor = vec4(preColor.rgb * bright, 1.0);

    posColor.rgb = (posColor.rgb-0.5)*contrast+0.5;

    float v = (posColor.r + posColor.g +posColor.b)/3.0;
    posColor.rgb = vec3(v,v,v);

    gl_FragColor = posColor;
    
    
}


