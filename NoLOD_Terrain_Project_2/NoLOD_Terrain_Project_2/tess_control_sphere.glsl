#version 460 core

layout(vertices = 3) out; // Patch di 3 vertici per triangoli

in vec3 vsCenter[]; //Dal vertex shader
out vec3 tcCenter[]; //Al TES

uniform vec3 cameraPosition;
uniform vec3 characterPosition;
uniform bool useCharacterToTess;

const int MIN_TES = 1;
const int MAX_TES = 16;
const float MAX_DIST = 6.0;

void main() {
    // Passa i vertici in output senza modifiche
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;
    tcCenter[gl_InvocationID] = vsCenter[gl_InvocationID];

    // Solo un thread decide i livelli di tessellazione
    if (gl_InvocationID == 0) {

        //Outer
        gl_TessLevelOuter[0] = MAX_TES;
        gl_TessLevelOuter[1] = MAX_TES;
        gl_TessLevelOuter[2] = MAX_TES;
        
        //Inner
        gl_TessLevelInner[0] = MAX_TES;
    }
}
