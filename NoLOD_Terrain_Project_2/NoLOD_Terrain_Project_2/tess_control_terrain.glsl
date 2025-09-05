#version 460 core

//UNA ESECUZIONE PER OGNI PATCH

layout(vertices = 4) out;

uniform bool useCharacterToTess;
uniform vec3 cameraPosition;
uniform vec3 characterPosition;

const int MIN_TES = 6;
const int MAX_TES = 44;
const float MIN_DIST = 1.0;
const float MAX_DIST = 1.5;

in vec4 vDisplace[];

out vec4 tcDisplace[];

void main() {
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;
    tcDisplace[gl_InvocationID] = vDisplace[gl_InvocationID];

    if (gl_InvocationID == 0) {

        //Indica la suddivisione interna del patch (concretamente indica il numero di linee parallele a quelle dei lati della figura originale)
        gl_TessLevelInner[0] = MAX_TES; //Lato interno in alto
        gl_TessLevelInner[1] = MAX_TES; //Lato interno in basso

        //Indica la suddivisione sui bordi esterni del patch
        gl_TessLevelOuter[0] = MAX_TES; //Lato di sinistra
        gl_TessLevelOuter[1] = MAX_TES; //Lato in basso
        gl_TessLevelOuter[2] = MAX_TES; //Lato a destra
        gl_TessLevelOuter[3] = MAX_TES; //Lato in alto
    }
}