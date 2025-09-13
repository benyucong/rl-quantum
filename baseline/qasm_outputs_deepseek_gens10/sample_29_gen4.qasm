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
// Edge (0,2): capacity 3
cx q[0], q[2];
rz(0.314) q[2];
cx q[0], q[2];

// Edge (0,5): capacity 3
cx q[0], q[5];
rz(0.314) q[5];
cx q[0], q[5];

// Edge (0,8): capacity 5
cx q[0], q[8];
rz(0.523) q[8];
cx q[0], q[8];

// Edge (1,4): capacity 3
cx q[1], q[4];
rz(0.314) q[4];
cx q[1], q[4];

// Edge (1,5): capacity 4
cx q[1], q[5];
rz(0.419) q[5];
cx q[1], q[5];

// Edge (1,7): capacity 2
cx q[1], q[7];
rz(0.209) q[7];
cx q[1], q[7];

// Edge (2,1): capacity 4
cx q[2], q[1];
rz(0.419) q[1];
cx q[2], q[1];

// Edge (2,4): capacity 3
cx q[2], q[4];
rz(0.314) q[4];
cx q[2], q[4];

// Edge (2,5): capacity 5
cx q[2], q[5];
rz(0.523) q[5];
cx q[2], q[5];

// Edge (2,6): capacity 2
cx q[2], q[6];
rz(0.209) q[6];
cx q[2], q[6];

// Edge (2,7): capacity 4
cx q[2], q[7];
rz(0.419) q[7];
cx q[2], q[7];

// Edge (3,4): capacity 4
cx q[3], q[4];
rz(0.419) q[4];
cx q[3], q[4];

// Edge (3,5): capacity 3
cx q[3], q[5];
rz(0.314) q[5];
cx q[3], q[5];

// Edge (3,6): capacity 5
cx q[3], q[6];
rz(0.523) q[6];
cx q[3], q[6];

// Edge (3,7): capacity 5
cx q[3], q[7];
rz(0.523) q[7];
cx q[3], q[7];

// Edge (3,8): capacity 3
cx q[3], q[8];
rz(0.314) q[8];
cx q[3], q[8];

// Edge (4,5): capacity 5
cx q[4], q[5];
rz(0.523) q[5];
cx q[4], q[5];

// Edge (4,6): capacity 2
cx q[4], q[6];
rz(0.209) q[6];
cx q[4], q[6];

// Edge (5,3): capacity 3
cx q[5], q[3];
rz(0.314) q[3];
cx q[5], q[3];

// Edge (5,6): capacity 4
cx q[5], q[6];
rz(0.419) q[6];
cx q[5], q[6];

// Edge (5,7): capacity 2
cx q[5], q[7];
rz(0.209) q[7];
cx q[5], q[7];

// Edge (6,7): capacity 3
cx q[6], q[7];
rz(0.314) q[7];
cx q[6], q[7];

// Edge (7,3): capacity 1
cx q[7], q[3];
rz(0.105) q[3];
cx q[7], q[3];

// Edge (7,6): capacity 2
cx q[7], q[6];
rz(0.209) q[6];
cx q[7], q[6];

// Edge (7,8): capacity 4
cx q[7], q[8];
rz(0.419) q[8];
cx q[7], q[8];

// Layer 2: Mixing and optimization
h q[0];
rz(0.628) q[0];
h q[0];
h q[1];
rz(0.628) q[1];
h q[1];
h q[2];
rz(0.628) q[2];
h q[2];
h q[3];
rz(0.628) q[3];
h q[3];
h q[4];
rz(0.628) q[4];
h q[4];
h q[5];
rz(0.628) q[5];
h q[5];
h q[6];
rz(0.628) q[6];
h q[6];
h q[7];
rz(0.628) q[7];
h q[7];
h q[8];
rz(0.628) q[8];
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