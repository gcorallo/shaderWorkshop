#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform vec2 texOffset;


uniform float time;
uniform vec2 resolution;

varying vec4 vertTexCoord;



void main(void){
	vec3 rgb = vec3(0.,0.,0.);
    
	float t = time*.001;
    
	vec2 uv = gl_FragCoord.xy/vec2(resolution.x,resolution.y) ;
    
	float f = resolution.x/resolution.y;
    
	uv.x = uv.x*f;

	float h = .2;
	float offX = 0.;
	
	//1d distort
    
	float d = sin(vertTexCoord.t*5.+t*3.)*.1;
	vec2 tc0 = vec2( vertTexCoord.s + d, vertTexCoord.t );
    
    // tc0 = vertTexCoord.st;

	//noise vhs-like distortion.
	/*
	float d = sin( (vertTexCoord.s-vertTexCoord.t) *15.+t*3.)*.1;
	vec2 tc0 = vec2( vertTexCoord.s +d, mod(vertTexCoord.t+t,1.) );	
     */

	
    /*
	float d = sin(vertTexCoord.t*10.+t*3.)*.05;
	d += sin(vertTexCoord.t*13.+t*2.)*.05;
	d += sin(vertTexCoord.t*43.+t*5.)*.02;
	vec2 tc0 = vec2( vertTexCoord.s +d, vertTexCoord.t );
	*/
    
	/*
	float dx = sin(vertTexCoord.s*5.+t*3.)*.05;
	float dy = cos(vertTexCoord.t*5.+t*3.)*.05;
	vec2 tc0 = vec2( vertTexCoord.s +dx, vertTexCoord.t+dy );
     */
	
    
	vec4 col = texture2D(texture, tc0);
    
	rgb = col.rgb;
	





		
	gl_FragColor = vec4(rgb, 1.0);

}
