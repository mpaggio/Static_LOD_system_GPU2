#version 460 core

layout(vertices = 4) out;

uniform vec3 cameraPosition;
uniform vec3 characterPosition;
uniform bool useCharacterToTess;

const float minDist = 1.0;
const float maxDist = 5.0;
const int minTessLevel = 4;
const int maxTessLevel = 64;

void main() {
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

    if (gl_InvocationID == 0) {

        gl_TessLevelOuter[0] = 1.0;
        gl_TessLevelOuter[1] = maxTessLevel;
    }
}
