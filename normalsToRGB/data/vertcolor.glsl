#define PROCESSING_COLOR_SHADER

uniform mat4 transform;

attribute vec4 vertex;
attribute vec4 color;

attribute vec3 normal;
varying vec3 norm;
varying vec4 vertColor;

void main() {

  norm = normal;
  gl_Position = transform * vertex;    
  vertColor = color;

}
