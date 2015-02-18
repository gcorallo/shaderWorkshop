#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform sampler2D mask;
uniform vec2 texOffset;

varying vec4 vertColor;
varying vec4 vertTexCoord;
uniform float xOff;

void main(void) {

  //corregir coordenadas (inversión en y!!!)


  vec2 tc0 = vertTexCoord.st + vec2(0.0, 0.0);


  float d  = (1.0 - texture2D(mask, tc0).r) * 0.1 ;
  

  vec4 col0 = texture2D(texture, tc0+vec2(0.0, texOffset.t+d));
  
  gl_FragColor = col0;
}
