#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform sampler2D depthSampler;
uniform vec2 texOffset;

varying vec4 vertColor;
varying vec4 vertTexCoord;
uniform float xOff;
uniform float foco;
uniform float mode;
uniform float time;

float rand(vec2 co){
  return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main(void) {


  vec2 resolution = vec2(960.0, 540.0);
  vec2 pos= gl_FragCoord.xy/resolution.xy;  

  vec4 srcColor = texture2D(depthSampler, vec2(pos.x, pos.y));

  float ammnt= srcColor.g;


  
  if(mode == 1.0){
    vec2 tc0 = vertTexCoord.st + vec2(0.0, -texOffset.t*xOff*ammnt);
    vec2 tc1 = vertTexCoord.st + vec2(         0.0, 0.0);
    vec2 tc2 = vertTexCoord.st + vec2(0.0, +texOffset.t*xOff*ammnt);
    vec4 col0 = texture2D(texture, tc0);
    vec4 col1 = texture2D(texture, tc1);
    vec4 col2 = texture2D(texture, tc2);
    

    vec4 sum = (1.0 * col0 + 1.0 * col1 + 1.0 * col2)/ 3.0;   

    gl_FragColor = vec4(sum.rgb, 1.0) * vertColor;  
  }
  else if(mode == 2.0){

    vec2 tc0 = vertTexCoord.st + vec2( (sin( gl_FragCoord.t*0.1+time*0.0001)*0.5+0.5)*ammnt*xOff*0.1,0.0 );
    vec4 col0 = texture2D(texture, tc0);

    gl_FragColor = vec4(col0.rgb, 1.0) * vertColor;  

  }


  else if(mode == 3.0){

    vec2 tc0 = vertTexCoord.st + vec2( -xOff*ammnt*0.001, 0.);
    vec2 tc1 = vertTexCoord.st + vec2(  xOff*ammnt*0.002, 0.0);
    vec2 tc2 = vertTexCoord.st + vec2(  xOff*ammnt*0.001,0.);
    /*
    vec2 tc0 = vertTexCoord.st + vec2( -xOff*0.002, 0.);
    vec2 tc1 = vertTexCoord.st + vec2(  xOff*0.002, 0.0);
    vec2 tc2 = vertTexCoord.st + vec2(  xOff*0.0025,0.);
    */
    vec4 col0 = texture2D(texture, tc0);
    vec4 col1 = texture2D(texture, tc1);
    vec4 col2 = texture2D(texture, tc2);

    vec3 rgb = vec3(col0.r,col1.g,col2.b );

    
    gl_FragColor = vec4(rgb.rgb, 1.0) * vertColor;  

  }

  else if(mode == 4.0){

    vec2 tc0 = vertTexCoord.st + vec2(         0.0, 0.0);
    vec4 col0 = texture2D(texture, tc0);
    gl_FragColor = vec4(col0.rgb, ammnt) * vertColor;  

  }

  else if(mode == 5.0){

    vec2 tc0 = vertTexCoord.st + vec2(         0.0, 0.0);
    vec4 col0 = texture2D(texture, tc0);
    float r = rand( vec2(gl_FragCoord.x+time, gl_FragCoord.y))*ammnt;
    gl_FragColor = vec4(col0.rgb +vec3(r-0.5*ammnt), 1.0) ;  
  }
  else if(mode == 5.0){

    vec2 tc0 = vertTexCoord.st + vec2(         0.0, 0.0);
    vec4 col0 = texture2D(texture, tc0);
    float r = rand( vec2(gl_FragCoord.x+time, gl_FragCoord.y))*ammnt;
    gl_FragColor = vec4(col0.rgb +vec3(r-0.5*ammnt) , 1.0) ;  
  }
  else if(mode == 6.0){

    vec2 tc0 = vertTexCoord.st + vec2(         0.0, 0.0);
    vec4 col0 = texture2D(texture, tc0);
    float r = rand( vec2(gl_FragCoord.x+time, gl_FragCoord.y))*ammnt;
    float rr= rand( vec2(gl_FragCoord.x+time, gl_FragCoord.y))*(1.-ammnt);
    gl_FragColor = vec4(col0.rgb +rr, 1.0) ;  
  }
  else if(mode == 7.0){

    vec2 tc0 = vertTexCoord.st + vec2(         0.0, 0.0);
    vec4 col0 = texture2D(texture, tc0);

    float rr= (xOff+50.)/150.0*(1.-ammnt) ;
   
      col0.r = max(col0.r, rr);
      col0.g = max(col0.g, rr);
      col0.b = max(col0.b, rr);
   

    gl_FragColor = vec4(col0.rgb , 1.0) ;  
  }



}
