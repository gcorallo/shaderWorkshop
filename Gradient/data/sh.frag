uniform float time;
uniform vec2 resolution;
void main() {
	
	vec2 uv = gl_FragCoord.xy/resolution;


	//gradient 1d 
	gl_FragColor = vec4( uv.x, 0.25, 0.5, 1.0);
	
	
    
	//gradient 2d
    gl_FragColor = vec4( uv.x, uv.y, 0.25, 1.0);
	//gl_FragColor = vec4( (uv.x+ (1.-uv.y) )*.5,1.- (uv.x+ (1.-uv.y) )*.5 , 0.5, 1.0);

	//animated
	float r=sin(time*0.001)*0.5+0.5;
	gl_FragColor = vec4(r, gl_FragCoord.x/resolution.x, .5, 1.0);
	
	//mod function
	//gl_FragColor = vec4(mod(gl_FragCoord.x/resolution.x+gl_FragCoord.y/resolution.y, .3), .3 , .2, 1.0);

    float div = .25;
    //gl_FragColor = vec4( mod(uv.x, div) * 1/div, .0, .0, 1.0);
    
    gl_FragColor = vec4( mod(uv.x, div) * 1/div, .0, .0, 1.0);
    
	//mod function II
	
    /*
	gl_FragColor = vec4(mod(gl_FragCoord.x/resolution.x+gl_FragCoord.y/resolution.y, .3),
						mod((1.-gl_FragCoord.x)/resolution.x+(1.-gl_FragCoord.y)/resolution.y,
					 .4), .2, 1.0);
	*/

}

