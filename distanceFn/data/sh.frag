uniform vec2 resolution;
uniform float vX;

void main() {
	vec2 uv = gl_FragCoord.xy/resolution;
	float v = 0.;
	vec3 rgb = vec3(0.);

	//distance.
	
	vec2 center = vec2(.5, .5);
	v = distance(uv, center);
	rgb = vec3(v);
	

	//distance+step;
	/*
	vec2 center = vec2(.5, .5);
	v = step(.3, distance(uv, center));
	rgb = vec3(v);
	*/

	//distance+step + aspect correction
	/*
	float f = resolution.x/resolution.y;
	uv.x = uv.x * f; //aspect correction.
	vec2 center = vec2(.5, .5);
	v = step(.3, distance(uv, center));
	rgb = vec3(v);
	*/

	//distance+step + aspect correction + center correction.
	/*
	float f = resolution.x/resolution.y;
	uv.x = uv.x * f;
	vec2 center = vec2(.5*f, .5); //center correction.
	v = step(.3, distance(uv, center));
	rgb = vec3(v);
	*/

	//distance + step + mod.
	/*
	float f = resolution.x/resolution.y;
	uv.x = uv.x * f;
	float s = .1;
  	float d = distance( mod(uv,s), vec2(s*.5,s*.5));
  	v = step(vX*.05, d);
  	rgb = vec3(v);
  	*/
	gl_FragColor = vec4( rgb, 1.0);	
}

