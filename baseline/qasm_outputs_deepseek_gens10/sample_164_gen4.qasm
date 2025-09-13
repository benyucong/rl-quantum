OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Initial Hadamard layer to create superposition
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

// Graph isomorphism oracle implementation
// Encode graph structure using controlled operations
// First graph edges: (0,1), (0,2), (1,3), (2,3)
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[3];
cx q[2], q[3];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];

// Second graph edges: (3,2), (3,0), (2,1), (0,1)
cx q[3], q[2];
cx q[3], q[0];
cx q[2], q[1];
cx q[0], q[1];
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];

// Inverse operations to complete the oracle
cx q[0], q[1];
cx q[2], q[1];
cx q[3], q[0];
cx q[3], q[2];
rz(-0.7854) q[0];
rz(-0.7854) q[1];
rz(-0.7854) q[2];

cx q[2], q[3];
cx q[1], q[3];
cx q[0], q[2];
cx q[0], q[1];
rz(-0.7854) q[1];
rz(-0.7854) q[2];
rz(-0.7854) q[3];

// Final Hadamard layer for interference
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