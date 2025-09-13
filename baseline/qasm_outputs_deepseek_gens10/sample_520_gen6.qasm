OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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

// Edge interactions with optimal parameters
// Edge (0,3) capacity 3
cx q[0], q[3];
rz(0.214) q[3];
cx q[0], q[3];

// Edge (0,4) capacity 1
cx q[0], q[4];
rz(0.071) q[4];
cx q[0], q[4];

// Edge (0,5) capacity 4
cx q[0], q[5];
rz(0.286) q[5];
cx q[0], q[5];

// Edge (1,2) capacity 2
cx q[1], q[2];
rz(0.143) q[2];
cx q[1], q[2];

// Edge (1,5) capacity 3
cx q[1], q[5];
rz(0.214) q[5];
cx q[1], q[5];

// Edge (2,6) capacity 1
cx q[2], q[6];
rz(0.071) q[6];
cx q[2], q[6];

// Edge (3,5) capacity 1
cx q[3], q[5];
rz(0.071) q[5];
cx q[3], q[5];

// Edge (3,9) capacity 2
cx q[3], q[9];
rz(0.143) q[9];
cx q[3], q[9];

// Edge (4,2) capacity 4
cx q[4], q[2];
rz(0.286) q[2];
cx q[4], q[2];

// Edge (4,3) capacity 2
cx q[4], q[3];
rz(0.143) q[3];
cx q[4], q[3];

// Edge (4,7) capacity 1
cx q[4], q[7];
rz(0.071) q[7];
cx q[4], q[7];

// Edge (5,2) capacity 1
cx q[5], q[2];
rz(0.071) q[2];
cx q[5], q[2];

// Edge (6,1) capacity 4
cx q[6], q[1];
rz(0.286) q[1];
cx q[6], q[1];

// Edge (6,2) capacity 5
cx q[6], q[2];
rz(0.357) q[2];
cx q[6], q[2];

// Edge (7,1) capacity 1
cx q[7], q[1];
rz(0.071) q[1];
cx q[7], q[1];

// Edge (7,4) capacity 3
cx q[7], q[4];
rz(0.214) q[4];
cx q[7], q[4];

// Edge (7,5) capacity 4
cx q[7], q[5];
rz(0.286) q[5];
cx q[7], q[5];

// Edge (8,4) capacity 4
cx q[8], q[4];
rz(0.286) q[4];
cx q[8], q[4];

// Edge (8,6) capacity 2
cx q[8], q[6];
rz(0.143) q[6];
cx q[8], q[6];

// Edge (8,7) capacity 6
cx q[8], q[7];
rz(0.429) q[7];
cx q[8], q[7];

// Layer 2: Mixing and optimization
h q[0];
rz(0.152) q[0];
h q[0];
h q[1];
rz(0.152) q[1];
h q[1];
h q[2];
rz(0.152) q[2];
h q[2];
h q[3];
rz(0.152) q[3];
h q[3];
h q[4];
rz(0.152) q[4];
h q[4];
h q[5];
rz(0.152) q[5];
h q[5];
h q[6];
rz(0.152) q[6];
h q[6];
h q[7];
rz(0.152) q[7];
h q[7];
h q[8];
rz(0.152) q[8];
h q[8];
h q[9];
rz(0.152) q[9];
h q[9];

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