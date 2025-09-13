OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];

rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.2256) q[2];
rz(0.2031) q[3];
rz(0.1923) q[4];
rz(0.2089) q[5];
rz(0.2217) q[6];
rz(0.1876) q[7];
rz(0.1964) q[8];
rz(0.2132) q[9];
rz(0.2058) q[10];

// Layer 2: Edge interactions (CZ gates for edge cover constraints)
// Edge 0-4
cz q[0], q[4];
// Edge 0-5
cz q[0], q[5];
// Edge 1-2
cz q[1], q[2];
// Edge 1-3
cz q[1], q[3];
// Edge 2-3
cz q[2], q[3];
// Edge 2-4
cz q[2], q[4];
// Edge 2-5
cz q[2], q[5];
// Edge 2-6
cz q[2], q[6];
// Edge 3-4
cz q[3], q[4];
// Edge 3-5
cz q[3], q[5];
// Edge 3-6
cz q[3], q[6];

// Parameterized rotations after interactions
rz(0.4231) q[0];
rz(0.3982) q[1];
rz(0.4512) q[2];
rz(0.4063) q[3];
rz(0.3846) q[4];
rz(0.4178) q[5];
rz(0.4434) q[6];
rz(0.3752) q[7];
rz(0.3928) q[8];
rz(0.4264) q[9];
rz(0.4116) q[10];

// Layer 3: Final mixing and measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];

rz(0.6423) q[0];
rz(0.5978) q[1];
rz(0.6768) q[2];
rz(0.6094) q[3];
rz(0.5769) q[4];
rz(0.6267) q[5];
rz(0.6651) q[6];
rz(0.5628) q[7];
rz(0.5892) q[8];
rz(0.6396) q[9];
rz(0.6174) q[10];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];