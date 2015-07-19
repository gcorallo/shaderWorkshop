uniform vec2 resolution;
uniform float time;
uniform float vX;
void main() {
	vec2 uv = gl_FragCoord.xy/resolution;
	float v = 0.;
	vec3 rgb = vec3(0.);

	//step.
	
	v = uv.x;	
	v = step(vX, v);
	rgb = vec3(v);
	

	//step.
	/*
	v = sin(uv.x*50.)*.5+.5;
	v = step(.5, v);
	rgb = vec3(v);
	*/

	//smoothstep.
	/*
	v = uv.x;
	v = smoothstep(.25,.75,v);
	rgb = vec3(v);
	*/

	//mix
	/*
	vec3 color1 = vec3(1.,1.,0.);
	vec3 color2 = vec3(0.,1.,1.);
	rgb = mix(color1, color2, vX);
	*/

	//mix + smoothstep
	/*
	v = uv.x;
	vec3 color1 = vec3(1.,1.,0.);
	vec3 color2 = vec3(0.,1.,1.);
	rgb = mix(color1, color2, smoothstep(vX-.2, vX+.2, v) );
	*/
	
	
	//mix + time
	/*
	v = uv.x;
	vec3 color1 = vec3(1.,1.,0.);
	vec3 color2 = vec3(0.,1.,1.);

	v = sin(v*20.+time*.005)*.5+.5;
	float v2 = sin(v*10.+time*.005)*.5+.5;
	rgb = mix(color1, color2, v)+mix(color1, color2, v2);
	*/

	gl_FragColor = vec4( rgb, 1.0);	
}

