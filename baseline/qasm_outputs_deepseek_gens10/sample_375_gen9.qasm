OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

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

// Edge interactions with optimal parameters
// Edge 0-5 (weight 8)
rz(0.314) q[0];
rz(0.314) q[5];
cx q[0], q[5];
rz(-0.157) q[5];
cx q[0], q[5];

// Edge 1-6 (weight 1)
rz(0.039) q[1];
rz(0.039) q[6];
cx q[1], q[6];
rz(-0.020) q[6];
cx q[1], q[6];

// Edge 1-5 (weight 15)
rz(0.589) q[1];
rz(0.589) q[5];
cx q[1], q[5];
rz(-0.294) q[5];
cx q[1], q[5];

// Edge 2-7 (weight 7)
rz(0.275) q[2];
rz(0.275) q[7];
cx q[2], q[7];
rz(-0.137) q[7];
cx q[2], q[7];

// Edge 2-8 (weight 14)
rz(0.549) q[2];
rz(0.549) q[8];
cx q[2], q[8];
rz(-0.275) q[8];
cx q[2], q[8];

// Edge 2-6 (weight 17)
rz(0.667) q[2];
rz(0.667) q[6];
cx q[2], q[6];
rz(-0.333) q[6];
cx q[2], q[6];

// Edge 3-8 (weight 1)
rz(0.039) q[3];
rz(0.039) q[8];
cx q[3], q[8];
rz(-0.020) q[8];
cx q[3], q[8];

// Edge 3-7 (weight 19)
rz(0.745) q[3];
rz(0.745) q[7];
cx q[3], q[7];
rz(-0.373) q[7];
cx q[3], q[7];

// Edge 3-5 (weight 11)
rz(0.431) q[3];
rz(0.431) q[5];
cx q[3], q[5];
rz(-0.216) q[5];
cx q[3], q[5];

// Layer 2: Mixing and optimization
h q[0];
rz(0.785) q[0];
h q[0];
h q[1];
rz(0.785) q[1];
h q[1];
h q[2];
rz(0.785) q[2];
h q[2];
h q[3];
rz(0.785) q[3];
h q[3];
h q[4];
rz(0.785) q[4];
h q[4];
h q[5];
rz(0.785) q[5];
h q[5];
h q[6];
rz(0.785) q[6];
h q[6];
h q[7];
rz(0.785) q[7];
h q[7];
h q[8];
rz(0.785) q[8];
h q[8];

// Layer 3: Final optimization and measurement
rz(0.392) q[0];
rz(0.392) q[1];
rz(0.392) q[2];
rz(0.392) q[3];
rz(0.392) q[4];
rz(0.392) q[5];
rz(0.392) q[6];
rz(0.392) q[7];
rz(0.392) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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