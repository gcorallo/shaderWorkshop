uniform vec2 resolution;
uniform float time;
void main() {
	
    
	vec3 rgb = vec3(0.,0.,0.);
	
	vec2 uv = gl_FragCoord.xy/vec2(resolution.x,resolution.y) ;
	float f = resolution.x/resolution.y; 


	float s = .3;

	vec2 pos  = mod( vec2(uv.x*f,uv.y)+vec2(time*0.0001,0.) , vec2(s,s))- vec2(s*.5,s*.5);
	vec2 pos2  = mod( vec2(uv.x*f,uv.y)+vec2(-time*0.0001,s*.5), vec2(s,s))- vec2(s*.5,s*.5);
	float d1 =dot(pos,pos)*uv.x*1000.;
	float d2 =dot(pos2,pos2)*(1000.-uv.x*1000.);

	rgb.r+=(1.-step(0.0015*resolution.x, d1 ))*(1.-uv.x);
	rgb.g+=(1.-step(0.0015*resolution.x, d2 ))*uv.x;

	rgb.b = (rgb.r+rgb.g)*  (uv.y*.7+.3);

	gl_FragColor = vec4(rgb,1.) ;
}

