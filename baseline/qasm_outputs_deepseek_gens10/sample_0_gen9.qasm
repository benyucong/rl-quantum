OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Initial Hadamard layer for superposition
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
h q[11];
h q[12];
h q[13];
h q[14];
h q[15];

// Graph isomorphism oracle for K4 complete graph
// Edge (0,1)
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];

// Edge (0,2)
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];
cx q[2], q[7];
rz(0.7854) q[7];
cx q[2], q[7];

// Edge (0,3)
cx q[0], q[8];
rz(0.7854) q[8];
cx q[0], q[8];
cx q[3], q[9];
rz(0.7854) q[9];
cx q[3], q[9];

// Edge (1,2)
cx q[1], q[10];
rz(0.7854) q[10];
cx q[1], q[10];
cx q[2], q[11];
rz(0.7854) q[11];
cx q[2], q[11];

// Edge (1,3)
cx q[1], q[12];
rz(0.7854) q[12];
cx q[1], q[12];
cx q[3], q[13];
rz(0.7854) q[13];
cx q[3], q[13];

// Edge (2,3)
cx q[2], q[14];
rz(0.7854) q[14];
cx q[2], q[14];
cx q[3], q[15];
rz(0.7854) q[15];
cx q[3], q[15];

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
c[11] = measure q[11];
c[12] = measure q[12];
c[13] = measure q[13];
c[14] = measure q[14];
c[15] = measure q[15];