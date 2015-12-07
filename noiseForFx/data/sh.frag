uniform vec2 resolution;
uniform float time;
uniform float val1;
uniform float val2;
uniform float val3;
uniform float subD;
uniform float mouseX;
uniform float mode;


vec2 random(vec2 st){
	st = vec2( dot(st,vec2(127.1,311.7)),
		dot(st,vec2(269.5,183.3)) );
	return -1.0 + 2.0*fract(sin(st)*43758.5453123);
}

// Value Noise by Inigo Quilez - iq/2013
// https://www.shadertoy.com/view/lsf3WH
float noise(vec2 st) {
	vec2 i = floor(st);
vec2 f = fract(st);

vec2 u = f*f*(3.0-2.0*f);

return mix( mix( dot( random(i + vec2(0.0,0.0) ), f - vec2(0.0,0.0) ), 
	dot( random(i + vec2(1.0,0.0) ), f - vec2(1.0,0.0) ), u.x),
mix( dot( random(i + vec2(0.0,1.0) ), f - vec2(0.0,1.0) ), 
	dot( random(i + vec2(1.0,1.0) ), f - vec2(1.0,1.0) ), u.x), u.y);
}


//https://gist.github.com/eieio/4109795
vec4 hsv_to_rgb(float h, float s, float v, float a)
{
	float c = v * s;
	h = mod((h * 6.0), 6.0);
	float x = c * (1.0 - abs(mod(h, 2.0) - 1.0));
	vec4 color;

	if (0.0 <= h && h < 1.0) {
		color = vec4(c, x, 0.0, a);
	} 
	else if (1.0 <= h && h < 2.0) {
		color = vec4(x, c, 0.0, a);
	} 
	else if (2.0 <= h && h < 3.0) {
		color = vec4(0.0, c, x, a);
	} 
	else if (3.0 <= h && h < 4.0) {
		color = vec4(0.0, x, c, a);
	} 
	else if (4.0 <= h && h < 5.0) {
		color = vec4(x, 0.0, c, a);
	} 
	else if (5.0 <= h && h < 6.0) {
		color = vec4(c, 0.0, x, a);
	} 
	else {
		color = vec4(0.0, 0.0, 0.0, a);
	}

	color.rgb += v - c;

	return color;
}

void main() {

	vec2 st = gl_FragCoord.xy/resolution.xy;
	//scale time for animations...
	float tt = -time*0.0005;

	if(mode==1.0){
		//fake terrain + heatmap.

		//scale uniforms.
		float val1s = val1*13.5; //hsv offset.
		float val2s = val2*100.;//black lines freq.
		float subDs = subD*10.; 

		//st scale.
		st*=subDs;


		//noise
		float nV = (noise(vec2(st.s, st.t+tt)));
		float nV2=min(nV,.25);


		//visualization.
		vec4 col = hsv_to_rgb ( 1.-( mod(nV2+val1s,1.+val1s)  ), 1., 1., 1.0);

		vec4 black = vec4(vec3(0.),1.);
		float mixV = smoothstep(0.,1., sin(nV*val2s)*1.5-1.);
		col = mix(col, black,  mixV);

		gl_FragColor = col;
	}

	else if(mode==2.0){
		//sinusoidal.

		//scale uniforms.
		float val1s = val1*.5; //frequencie.
		float val2s = val2*10.;//amplitude
		float val3s = val3*5.;//contrast
		
		float subDs = subD*10.; 

		//st scale.
		st*=subDs;

		float nV = (noise(vec2( st.s + sin(st.s*val1s*5.)*(val2s) , st.t + sin(st.t*val1s*5.)*(val2s) +tt)));


		nV += .5;
		nV = ((nV-.5)*val3s )+.5;

		vec4 col = vec4(vec3(nV),1. );

		gl_FragColor = col;
	}
	else if(mode==3.0){
		//RGB sin

		//scale uniforms.
		float val1s = val1*10; //frequencie.
		float val2s = val2*10.;//amplitude
		float val3s = val3*10.;//contrast
		
		float subDs = subD*10.; 

		//st scale.
		st*=subDs;

		float nVr = (noise(vec2( st.s*val1s, st.t*val1s +tt )));
		float nVg = (noise(vec2( st.s*val2s, st.t*val2s +tt )));
		float nVb = (noise(vec2( st.s*val3s, st.t*val3s +tt )));

		float adds = nVr+nVg+nVb;

		vec4 col = vec4(vec3(sin(adds*val1s)*0.5+.5, sin(adds*val2s)*0.5+.5, sin(adds*val3s)*0.5+.5),1. );

		

		gl_FragColor = col;
	}
	else if(mode==4.0){
		//divided.

		//scale uniforms.
		float val1s = val1*.5; //frequencie.
		float val2s = val2*.75;//amplitude
		float val3s = val3*1.;//contrast
		
		float subDs = subD*10.; 

		//st scale.
		st*=subDs;

		float nVr = (noise(vec2( st.s*val1s, st.t*val1s  +tt)));
		float nVg = (noise(vec2( st.s*val2s, st.t*val2s  +tt)));
		float nVb = (noise(vec2( st.s*val3s, st.t*val3s  +tt)));

		//float nV2=min(nV,.25);

		float adds = 1.-(nVr+nVg+nVb);	
		vec4 col = vec4(vec3(sin(nVr/nVg)*0.5+.5, sin(nVg/nVb)*0.5+.5, sin(nVb/nVr)*0.5+.5),1. );
		
		

		gl_FragColor = col;
	}
	else if(mode==5.0){
		//divided II.

		//scale uniforms.
		
		float subDs = subD*5.; 

		//st scale.
		st*=subDs;

		float nVr = (noise(vec2( st.s, st.t +tt*0.9)));
		float nVg = (noise(vec2( st.s, st.t +tt*1.1)));
		float nVb = (noise(vec2( st.s, st.t +tt*1.3)));


		float adds = (nVr+nVg+nVb);	
		float adds2 = (nVr/nVb+nVg/nVr+nVb/nVg);	
		float adds3 = (nVr/adds2+nVg/adds2+nVb/adds2);
		vec4 col = vec4(.5*nVr/adds3-abs(adds),.5*nVg/adds3-abs(adds),.5*nVb/adds3-abs(adds),1.);


		gl_FragColor = col;
	}
	else if(mode==6.0){
		//radial

		//scale uniforms.
		float val1s = val1*5.; //frequencie.
		float val2s = val2*.75;//offset
		float val3s = val3*2.;//contrast
		float subDs = subD*5.; 

		//st scale.
		st*=subDs;
		vec2 center= vec2(.5);
		float d = distance(st, center*subDs);
		float nV = noise( vec2(sin(d*val1s)*st.s, cos(d*val1s)*st.t +tt))*val3s+val2s;
		vec4 col = vec4(vec3(nV),1.);	



		gl_FragColor = col;
	}
	else if(mode==7.0){
		//water

		//scale uniforms.
		
		float val2s = val2*.75;//offset
		float val3s = val3*2.;//contrast
		float subDs = subD*5.; 

		//st scale.
		st*=subDs;
		vec2 center= vec2(.5);
		float d = distance(st, center*subDs);
		
		
		float nV = noise( vec2( st.s, st.t*5. +tt))*val3s+val2s;
		nV-= noise( vec2( st.s, st.t*10.*(1.-st.t)*.25 ))*val3s;	
		
		


		vec4 col = vec4( vec3(nV*.2, nV*.3,nV*.5),1.);	
		//vec4 col = vec4(nVr,nVg,nVb,1.);	



		gl_FragColor = col;
	}
}

