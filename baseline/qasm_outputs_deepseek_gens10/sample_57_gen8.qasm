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
// Edge 0-5 (weight 9)
rz(0.1414) q[0];
rz(0.1414) q[5];
cx q[0], q[5];
rz(-0.1414) q[5];
cx q[0], q[5];

// Edge 0-6 (weight 16)
rz(0.2513) q[0];
rz(0.2513) q[6];
cx q[0], q[6];
rz(-0.2513) q[6];
cx q[0], q[6];

// Edge 1-6 (weight 10)
rz(0.1571) q[1];
rz(0.1571) q[6];
cx q[1], q[6];
rz(-0.1571) q[6];
cx q[1], q[6];

// Edge 1-7 (weight 15)
rz(0.2356) q[1];
rz(0.2356) q[7];
cx q[1], q[7];
rz(-0.2356) q[7];
cx q[1], q[7];

// Edge 2-7 (weight 9)
rz(0.1414) q[2];
rz(0.1414) q[7];
cx q[2], q[7];
rz(-0.1414) q[7];
cx q[2], q[7];

// Edge 3-8 (weight 3)
rz(0.0471) q[3];
rz(0.0471) q[8];
cx q[3], q[8];
rz(-0.0471) q[8];
cx q[3], q[8];

// Edge 3-7 (weight 12)
rz(0.1885) q[3];
rz(0.1885) q[7];
cx q[3], q[7];
rz(-0.1885) q[7];
cx q[3], q[7];

// Edge 4-5 (weight 15)
rz(0.2356) q[4];
rz(0.2356) q[5];
cx q[4], q[5];
rz(-0.2356) q[5];
cx q[4], q[5];

// Edge 4-6 (weight 14)
rz(0.2199) q[4];
rz(0.2199) q[6];
cx q[4], q[6];
rz(-0.2199) q[6];
cx q[4], q[6];

// Layer 2: Mixing and optimization
h q[0];
rz(0.6283) q[0];
h q[0];
h q[1];
rz(0.6283) q[1];
h q[1];
h q[2];
rz(0.6283) q[2];
h q[2];
h q[3];
rz(0.6283) q[3];
h q[3];
h q[4];
rz(0.6283) q[4];
h q[4];
h q[5];
rz(0.6283) q[5];
h q[5];
h q[6];
rz(0.6283) q[6];
h q[6];
h q[7];
rz(0.6283) q[7];
h q[7];
h q[8];
rz(0.6283) q[8];
h q[8];

// Layer 3: Final optimization and measurement
rz(0.3142) q[0];
rz(0.3142) q[1];
rz(0.3142) q[2];
rz(0.3142) q[3];
rz(0.3142) q[4];
rz(0.3142) q[5];
rz(0.3142) q[6];
rz(0.3142) q[7];
rz(0.3142) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];