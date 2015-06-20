uniform float time;
uniform vec2 resolution;
uniform float vX;
void main() {
	
	vec2 uv = gl_FragCoord.xy/resolution;


	//gradient 1d 
	//gl_FragColor = vec4( uv.x, 0.25, 0.5, 1.0);
	//gl_FragColor = vec4( uv.y, 0.25, 0.5, 1.0);
	//gl_FragColor = vec4( uv.x, uv.y, 0.25, 1.0);
    
	//gradient 2d
	gl_FragColor = vec4( (uv.x+ (1.-uv.y) )*.5,1.- (uv.x+ (1.-uv.y) )*.5 , 0.5, 1.0);

	//animado
	//float r=sin(time*0.001)*0.5+0.5;
	//gl_FragColor = vec4(r, gl_FragCoord.x/resolution.x, .5, 1.0);
	

}

