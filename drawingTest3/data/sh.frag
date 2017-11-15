uniform vec2 resolution;
uniform float time;
void main() {

	vec3 rgb = vec3(0.,0.,0.);
	float t= time*.001;
	vec2 uv = gl_FragCoord.xy/resolution; 
	float f = resolution.x/resolution.y;
	float s =.25;
	vec2 pos  = mod(vec2(uv.x*f, uv.y)+vec2(t*0.05,t*0.1 ), vec2(s*.5)) - vec2(s*.25);
	vec2 pos2 = mod(vec2(uv.x*f, uv.y)+vec2(t*0.05,t*0.1), vec2(s)) - vec2(s*.5-s*.25);
	float d1 = dot(pos, pos);
	float d2 = dot(pos2, pos2);

	rgb.r+=(1.-step(resolution.x*.0001,d1*100.))*uv.x*.6 *(uv.y*0.6+.4);
	rgb.g+=(1.-step(resolution.x*.0003,d2*100.))*uv.y*.4;
	rgb.b=(rgb.r+rgb.g)*.5;

	rgb+= vec3((uv.x+uv.y)*.2, 0.05,0.1);



	float v1=step(uv.y*100.-10.,sin(uv.x*10.+time*0.001)*10.+18.0)*.25;
	float v2=step(uv.y*100.-8., sin(uv.x*10.+time*0.002)*6.+15.0)*.25;
	float v3=step(uv.y*100.-6., sin(uv.x*10.+time*0.003)*4.+13.0)*.25;
	

	rgb+=vec3(0., vec2(v1+v2+v3));


		
	gl_FragColor = vec4(rgb,1.) ;
}

