#version 460 core

//UNA ESECUZIONE PER OGNI PATCH

layout(vertices = 4) out;

uniform bool useCharacterToTess;
uniform vec3 cameraPosition;
uniform vec3 characterPosition;

const int MIN_TES = 12;
const int MAX_TES = 64;
const float MIN_DIST = 0.5;
const float MAX_DIST = 1.0;

in vec3 normal[];

out vec3 normal_tcs[];

void main() {
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position; 
    normal_tcs[gl_InvocationID] = normal[gl_InvocationID];
    
    if (gl_InvocationID == 0) {

        // Impostiamo i livelli di tessellazione per i bordi
        gl_TessLevelOuter[0] = MAX_TES; // Lato sinistro
        gl_TessLevelOuter[1] = MAX_TES; // Lato inferiore
        gl_TessLevelOuter[2] = MAX_TES; // Lato destro
        gl_TessLevelOuter[3] = MAX_TES; // Lato superiore

        // Per gli inner levels, facciamo in modo che siano la media dei bordi opposti
        gl_TessLevelInner[0] = MAX_TES / 2; // Direzione orizzontale
        gl_TessLevelInner[1] = MAX_TES / 2; // Direzione verticale
    }
}