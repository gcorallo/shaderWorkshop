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

void main(void) {

    

  vec2 tc0 = vertTexCoord.st + vec2(0.0, 0.0);
 
  float dx  = (texture2D(mask, tc0).r) * 0.05 ;
  float dy  = (texture2D(mask, tc0).g) * 0.05 ;
  
  vec4 col0 = texture2D(texture, tc0+vec2(texOffset.t+dx, texOffset.t+dy));
  
  gl_FragColor = col0;
}
