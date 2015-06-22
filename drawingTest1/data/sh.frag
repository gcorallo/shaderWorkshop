uniform vec2 resolution;
uniform float time;
void main() {
	
	vec3 rgb = vec3(0.,0.,0.);
	float s= .4;
	float t=time*.00015;
	vec2 uv = gl_FragCoord.xy/resolution;
	float f=resolution.x/resolution.y;
	vec2 pos  = mod(vec2(uv.x*f,uv.y)+ vec2(.0,s*.5)+ vec2(t*1.5,0.), vec2(s)) - vec2(s*.5);
	vec2 pos2 = mod(vec2(uv.x*f,uv.y)+ vec2(s*.0)  + vec2(0.,t*1.5), vec2(s)) - vec2(s*.5);
	
	
	float d1= dot(pos, pos)*100.;
	float d2= dot(pos2, pos2)*100.;
	rgb.r+=(1.-step(sin(uv.x*f*50.)*.15+.25, d1 *1.0))*.8;
	rgb.r-=(1.-step(sin(uv.x*f*50.)*.15+.25, d1 *1.5))*.2;
	rgb.b+=.2*rgb.r;

	rgb.b+=(1.-step(sin(uv.y*50.)*.15+.25, d2 *1.0))*.7;
	rgb.b-=(1.-step(sin(uv.y*50.)*.15+.25, d2 *1.5))*.2;
	rgb.r+=.2*rgb.b;

	rgb.g+=(rgb.r*.3+rgb.b*.7)*.5;

	rgb+= vec3(.3, (1.-uv.y)*.3, (uv.y)*.3);
	
	float d3= distance(uv, vec2(.5,0.2))*.2;

	rgb-=vec3(d3);


	gl_FragColor = vec4(rgb,1.) ;
}
