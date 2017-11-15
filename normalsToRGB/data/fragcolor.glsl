#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertColor;
vec2 resolution;
varying vec3 norm;


void main() {
  resolution = vec2(800.0,600.0);	
  vec2 pos= gl_FragCoord.xy/resolution.xy;		
    vec3 color = norm / 2.0 + 0.5;
  gl_FragColor = vec4(color,1.0);//*vertColor;
  //gl_FragColor = vec4(color,1.0)*vertColor; 
  //gl_FragColor = vec4(color,1.0)*0.15+vertColor*0.85; 
  //gl_FragColor = vec4(color.r,color.g,sin(color.b*10.0),1.0);

  //gl_FragColor = vec4(pos.x,.2,.8,1.0)*vertColor;


}
