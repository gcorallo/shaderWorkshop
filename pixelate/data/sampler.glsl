#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform sampler2D texture2;
uniform vec2 texOffset;
uniform float time;
uniform vec2 resolution;

varying vec4 vertTexCoord;
uniform float vY;



void main(void){
	vec3 rgb = vec3(0.,0.,0.);
	float t = time*.001;
	vec2 uv = gl_FragCoord.xy/vec2(resolution.x,resolution.y) ;
	float f = resolution.x/resolution.y; 
	uv.x = uv.x*f;

	float h = .2;
	float offX = 0.;
	
	float s = vY;
	vec2 tc0 = vec2( vertTexCoord.s - mod(vertTexCoord.s, s), vertTexCoord.t - mod(vertTexCoord.t, s*f));
	//vec2 tc0 = vec2( vertTexCoord.s - mod(vertTexCoord.s-vertTexCoord.t, s), vertTexCoord.t - mod(vertTexCoord.s-vertTexCoord.t, s*f));	

	vec4 col = texture2D(texture, tc0);

	rgb = col.rgb;



		
	gl_FragColor = vec4(rgb, 1.0);

}