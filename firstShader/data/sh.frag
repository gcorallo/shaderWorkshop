vec2 resolution;
uniform float time;
void main() {
	
	resolution = vec2(800.0, 450.0);

	//pleno
	//gl_FragColor = vec4( 1.0, 0.25, 0.5, 1.0);

	//gradiente 1d
	gl_FragColor = vec4( gl_FragCoord.x/resolution.x, 0.25, 0.5, 1.0);

	//gradiente 2d
	//gl_FragColor = vec4( gl_FragCoord.x/resolution.x, gl_FragCoord.y/resolution.y, 0.25, 1.0);

	//animado
	/*
	float r=sin(time*0.005)*0.5+0.5;
	gl_FragColor = vec4(r, g, b, 1.0);
	*/

}

