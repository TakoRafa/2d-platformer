//shader_type canvas_item;

//uniform bool active = false;

//void fragment() {
    // COLOR already includes the texture and the modulate/self_modulate tint
    //vec4 c = COLOR;
    
    //if (active) {
        // Invert the tinted color
        //c.rgb = 1.0 - c.rgb;
    //}
    
    // Assign back to COLOR to apply the final result
    //COLOR = c;
//}
shader_type canvas_item;

uniform bool active = false;

// Función para convertir RGB a HSV
vec3 rgb2hsv(vec3 c) {
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

// Función para convertir HSV a RGB
vec3 hsv2rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void fragment() {
    // Tomamos el color que ya incluye el 'modulate'
    vec4 color = COLOR;
    
    if (active) {
        vec3 hsv = rgb2hsv(color.rgb);
        // Rotamos el tono (Hue) 180 grados (0.5 en rango 0-1)
        hsv.x = mod(hsv.x + 0.5, 1.0);
        color.rgb = hsv2rgb(hsv);
    }
    
    COLOR = color;
}