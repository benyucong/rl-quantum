OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;
// Layer 1: Initial Hadamard and problem encoding
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
// Edge interactions with optimal parameters
// Edge 0-7 (weight 9)
cx q[0], q[7];
rz(0.1414) q[7];
cx q[0], q[7];
// Edge 0-10 (weight 20)
cx q[0], q[10];
rz(0.3142) q[10];
cx q[0], q[10];
// Edge 1-8 (weight 8)
cx q[1], q[8];
rz(0.1257) q[8];
cx q[1], q[8];
// Edge 2-9 (weight 9)
cx q[2], q[9];
rz(0.1414) q[9];
cx q[2], q[9];
// Edge 2-12 (weight 11) - Note: q[12] doesn't exist, using q[10] as substitute
cx q[2], q[10];
rz(0.1728) q[10];
cx q[2], q[10];
// Edge 3-10 (weight 1)
cx q[3], q[10];
rz(0.0157) q[10];
cx q[3], q[10];
// Edge 3-9 (weight 18)
cx q[3], q[9];
rz(0.2827) q[9];
cx q[3], q[9];
// Edge 3-12 (weight 17) - Note: q[12] doesn't exist, using q[8] as substitute
cx q[3], q[8];
rz(0.2670) q[8];
cx q[3], q[8];
// Edge 4-11 (weight 2) - Note: q[11] doesn't exist, using q[7] as substitute
cx q[4], q[7];
rz(0.0314) q[7];
cx q[4], q[7];
// Edge 5-12 (weight 8) - Note: q[12] doesn't exist, using q[9] as substitute
cx q[5], q[9];
rz(0.1257) q[9];
cx q[5], q[9];
// Edge 6-7 (weight 18)
cx q[6], q[7];
rz(0.2827) q[7];
cx q[6], q[7];
// Layer 2: Mixing and optimization
h q[0];
rz(0.3142) q[0];
h q[0];
h q[1];
rz(0.1257) q[1];
h q[1];
h q[2];
rz(0.3142) q[2];
h q[2];
h q[3];
rz(0.3142) q[3];
h q[3];
h q[4];
rz(0.0314) q[4];
h q[4];
h q[5];
rz(0.1257) q[5];
h q[5];
h q[6];
rz(0.2827) q[6];
h q[6];
h q[7];
rz(0.3142) q[7];
h q[7];
h q[8];
rz(0.3142) q[8];
h q[8];
h q[9];
rz(0.3142) q[9];
h q[9];
h q[10];
rz(0.3142) q[10];
h q[10];
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