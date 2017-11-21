#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif


varying vec3 norm;


void main() {
   
    
    
    vec3 color = norm / 2.0 + 0.5;
    
    
    gl_FragColor = vec4(color,1.0);
    
    
    
    
}
