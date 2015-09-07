#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif
 
uniform vec4 nearColor;
uniform vec4 farColor;
uniform float near;
uniform float far;
 
varying vec4 vertColor;
 
void main() {
	
	vec4 mixed = mix(nearColor, farColor, smoothstep(near, far, gl_FragCoord.z / gl_FragCoord.w));
    
    
	gl_FragColor = mixed;
}