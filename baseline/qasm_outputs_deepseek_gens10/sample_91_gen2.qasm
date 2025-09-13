OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Initial Hadamard layer
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

// Layer 1 - Edge constraints with optimal parameters
// Edge (0,2) capacity 3
cx q[0], q[2];
rz(-0.214) q[2];
cx q[0], q[2];

// Edge (0,4) capacity 2
cx q[0], q[4];
rz(-0.143) q[4];
cx q[0], q[4];

// Edge (0,8) capacity 3
cx q[0], q[8];
rz(-0.214) q[8];
cx q[0], q[8];

// Edge (1,2) capacity 1
cx q[1], q[2];
rz(-0.071) q[2];
cx q[1], q[2];

// Edge (1,5) capacity 2
cx q[1], q[5];
rz(-0.143) q[5];
cx q[1], q[5];

// Edge (1,6) capacity 3
cx q[1], q[6];
rz(-0.214) q[6];
cx q[1], q[6];

// Edge (2,7) capacity 2
cx q[2], q[7];
rz(-0.143) q[7];
cx q[2], q[7];

// Edge (2,10) capacity 3
cx q[2], q[10];
rz(-0.214) q[10];
cx q[2], q[10];

// Edge (3,8) capacity 3
cx q[3], q[8];
rz(-0.214) q[8];
cx q[3], q[8];

// Edge (3,10) capacity 1
cx q[3], q[10];
rz(-0.071) q[10];
cx q[3], q[10];

// Edge (4,5) capacity 1
cx q[4], q[5];
rz(-0.071) q[5];
cx q[4], q[5];

// Edge (4,6) capacity 2
cx q[4], q[6];
rz(-0.143) q[6];
cx q[4], q[6];

// Edge (4,8) capacity 1
cx q[4], q[8];
rz(-0.071) q[8];
cx q[4], q[8];

// Edge (6,4) capacity 3
cx q[6], q[4];
rz(-0.214) q[4];
cx q[6], q[4];

// Edge (7,1) capacity 1
cx q[7], q[1];
rz(-0.071) q[1];
cx q[7], q[1];

// Edge (7,5) capacity 3
cx q[7], q[5];
rz(-0.214) q[5];
cx q[7], q[5];

// Edge (8,5) capacity 2
cx q[8], q[5];
rz(-0.143) q[5];
cx q[8], q[5];

// Edge (8,7) capacity 2
cx q[8], q[7];
rz(-0.143) q[7];
cx q[8], q[7];

// Edge (9,4) capacity 1
cx q[9], q[4];
rz(-0.071) q[4];
cx q[9], q[4];

// Layer 2 - Mixing layer
h q[0];
rz(0.428) q[0];
h q[0];
h q[1];
rz(0.428) q[1];
h q[1];
h q[2];
rz(0.428) q[2];
h q[2];
h q[3];
rz(0.428) q[3];
h q[3];
h q[4];
rz(0.428) q[4];
h q[4];
h q[5];
rz(0.428) q[5];
h q[5];
h q[6];
rz(0.428) q[6];
h q[6];
h q[7];
rz(0.428) q[7];
h q[7];
h q[8];
rz(0.428) q[8];
h q[8];
h q[9];
rz(0.428) q[9];
h q[9];
h q[10];
rz(0.428) q[10];
h q[10];

// Layer 3 - Final edge constraints with optimal parameters
// Repeat edge constraints with optimized parameters
cx q[0], q[2];
rz(-0.321) q[2];
cx q[0], q[2];
cx q[0], q[4];
rz(-0.214) q[4];
cx q[0], q[4];
cx q[0], q[8];
rz(-0.321) q[8];
cx q[0], q[8];
cx q[1], q[2];
rz(-0.107) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(-0.214) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(-0.321) q[6];
cx q[1], q[6];
cx q[2], q[7];
rz(-0.214) q[7];
cx q[2], q[7];
cx q[2], q[10];
rz(-0.321) q[10];
cx q[2], q[10];
cx q[3], q[8];
rz(-0.321) q[8];
cx q[3], q[8];
cx q[3], q[10];
rz(-0.107) q[10];
cx q[3], q[10];
cx q[4], q[5];
rz(-0.107) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(-0.214) q[6];
cx q[4], q[6];
cx q[4], q[8];
rz(-0.107) q[8];
cx q[4], q[8];
cx q[6], q[4];
rz(-0.321) q[4];
cx q[6], q[4];
cx q[7], q[1];
rz(-0.107) q[1];
cx q[7], q[1];
cx q[7], q[5];
rz(-0.321) q[5];
cx q[7], q[5];
cx q[8], q[5];
rz(-0.214) q[5];
cx q[8], q[5];
cx q[8], q[7];
rz(-0.214) q[7];
cx q[8], q[7];
cx q[9], q[4];
rz(-0.107) q[4];
cx q[9], q[4];

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