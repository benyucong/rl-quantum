OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and problem-specific unitaries
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Edge (0,5)
cx q[0], q[8];
rz(0.2145) q[8];
cx q[0], q[8];
cx q[5], q[8];
rz(0.2145) q[8];
cx q[5], q[8];

// Edge (0,7)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
cx q[7], q[8];
rz(0.1987) q[8];
cx q[7], q[8];

// Edge (1,5)
cx q[1], q[8];
rz(0.2251) q[8];
cx q[1], q[8];
cx q[5], q[8];
rz(0.2251) q[8];
cx q[5], q[8];

// Edge (1,7)
cx q[1], q[8];
rz(0.2039) q[8];
cx q[1], q[8];
cx q[7], q[8];
rz(0.2039) q[8];
cx q[7], q[8];

// Edge (2,5)
cx q[2], q[8];
rz(0.2317) q[8];
cx q[2], q[8];
cx q[5], q[8];
rz(0.2317) q[8];
cx q[5], q[8];

// Edge (3,7)
cx q[3], q[8];
rz(0.2083) q[8];
cx q[3], q[8];
cx q[7], q[8];
rz(0.2083) q[8];
cx q[7], q[8];

// Edge (4,6)
cx q[4], q[8];
rz(0.1925) q[8];
cx q[4], q[8];
cx q[6], q[8];
rz(0.1925) q[8];
cx q[6], q[8];

// Edge (5,6)
cx q[5], q[8];
rz(0.2198) q[8];
cx q[5], q[8];
cx q[6], q[8];
rz(0.2198) q[8];
cx q[6], q[8];

// Edge (5,7)
cx q[5], q[8];
rz(0.2067) q[8];
cx q[5], q[8];
cx q[7], q[8];
rz(0.2067) q[8];
cx q[7], q[8];

// Layer 2: Mixing and final rotations
h q[0];
rz(0.4278) q[0];
h q[0];
h q[1];
rz(0.4512) q[1];
h q[1];
h q[2];
rz(0.4634) q[2];
h q[2];
h q[3];
rz(0.4166) q[3];
h q[3];
h q[4];
rz(0.3850) q[4];
h q[4];
h q[5];
rz(0.8723) q[5];
h q[5];
h q[6];
rz(0.8246) q[6];
h q[6];
h q[7];
rz(0.8176) q[7];
h q[7];
rz(0) q[8];

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