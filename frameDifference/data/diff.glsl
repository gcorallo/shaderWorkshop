#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
varying vec4 vertTexCoord;
uniform sampler2D previo;

void main(void){
	
	vec4 prevColor = texture2D(previo, vec2(vertTexCoord.s, 1.0 - vertTexCoord.t));
	vec4 actualColor = texture2D(texture, vertTexCoord.st);;

	vec4 diferencia = abs (actualColor - prevColor);


	gl_FragColor = vec4(diferencia.rgb, 1.0);
    
    
}


