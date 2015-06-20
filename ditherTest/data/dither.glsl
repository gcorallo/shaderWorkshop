#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform sampler2D texture2;
uniform vec2 texOffset;
uniform float time;

varying vec4 vertTexCoord;

// Ordered dithering aka Bayer matrix dithering http://devlog-martinsh.blogspot.com.ar/2011/03/glsl-dithering.html

float scale = 1.0;

float find_closest(int x, int y, float c0)
{
	vec4 dither[4];

	dither[0] = vec4( 1.0, 33.0, 9.0, 41.0);
	dither[1] = vec4(49.0, 17.0, 57.0, 25.0);
	dither[2] = vec4(13.0, 45.0, 5.0, 37.0);
	dither[3] = vec4(61.0, 29.0, 53.0, 21.0);

	float limit = 0.0;
	if(x < 4)
	{
		limit = (dither[x][y]+1.0)/64.0;
	}

	if(c0 < limit)
	{
		return 0.0;

		}else{

			return 1.0;
		}

	}


	void main(void)
	{
		vec4 lum = vec4(0.299, 0.587, 0.114, 0.0);
		float grayscale = dot( texture2D(texture, vertTexCoord.xy), lum);
		vec3 rgb = texture2D(texture, vertTexCoord.xy).rgb;

		vec2 xy = gl_FragCoord.xy * scale;
		int x = int(mod(xy.x, 4.0));
		int y = int(mod(xy.y, 4.0));

		vec3 finalRGB;

		finalRGB.r = find_closest(x, y, rgb.r);
		finalRGB.g = find_closest(x, y, rgb.g);
		finalRGB.b = find_closest(x, y, rgb.b);

		float final = find_closest(x, y, grayscale);

		gl_FragColor = vec4(finalRGB, 1.0);
	}
