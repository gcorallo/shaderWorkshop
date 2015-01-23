#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform vec2 texOffset;

varying vec4 vertColor;
varying vec4 vertTexCoord;
uniform float xOff;

void main(void) {
  // Grouping texcoord variables in order to make it work in the GMA 950. See post #13
  // in this thread:
  // http://www.idevgames.com/forums/thread-3467.html
  vec2 tc0 = vertTexCoord.st + vec2(-texOffset.s*xOff, 0.0);
  vec2 tc1 = vertTexCoord.st + vec2(         0.0, 0.0);
  vec2 tc2 = vertTexCoord.st + vec2(+texOffset.s*xOff, 0.0);
  

  vec4 col0 = texture2D(texture, tc0);
  vec4 col1 = texture2D(texture, tc1);
  vec4 col2 = texture2D(texture, tc2);
  
  vec4 sum = (1.0 * col0 + 2.0 * col1 + 1.0 * col2)/ 4.0;            
  gl_FragColor = vec4(sum.rgb, 1.0) * vertColor;  
}
