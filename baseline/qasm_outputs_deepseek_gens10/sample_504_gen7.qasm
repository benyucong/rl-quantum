OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Initialize with Hadamard gates for superposition
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

// Apply QAOA mixing layer with optimal parameters for community detection
// Edge interactions (0-1)
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-1.5708) q[1];
cx q[0], q[1];

// Edge interactions (1-2)
rz(0.7854) q[1];
rz(0.7854) q[2];
cx q[1], q[2];
rz(-1.5708) q[2];
cx q[1], q[2];

// Edge interactions (1-3)
rz(0.7854) q[1];
rz(0.7854) q[3];
cx q[1], q[3];
rz(-1.5708) q[3];
cx q[1], q[3];

// Edge interactions (2-3)
rz(0.7854) q[2];
rz(0.7854) q[3];
cx q[2], q[3];
rz(-1.5708) q[3];
cx q[2], q[3];

// Edge interactions (2-6)
rz(0.7854) q[2];
rz(0.7854) q[6];
cx q[2], q[6];
rz(-1.5708) q[6];
cx q[2], q[6];

// Edge interactions (3-4)
rz(0.7854) q[3];
rz(0.7854) q[4];
cx q[3], q[4];
rz(-1.5708) q[4];
cx q[3], q[4];

// Edge interactions (4-5)
rz(0.7854) q[4];
rz(0.7854) q[5];
cx q[4], q[5];
rz(-1.5708) q[5];
cx q[4], q[5];

// Edge interactions (4-6)
rz(0.7854) q[4];
rz(0.7854) q[6];
cx q[4], q[6];
rz(-1.5708) q[6];
cx q[4], q[6];

// Edge interactions (5-6)
rz(0.7854) q[5];
rz(0.7854) q[6];
cx q[5], q[6];
rz(-1.5708) q[6];
cx q[5], q[6];

// Edge interactions (5-7)
rz(0.7854) q[5];
rz(0.7854) q[7];
cx q[5], q[7];
rz(-1.5708) q[7];
cx q[5], q[7];

// Edge interactions (6-7)
rz(0.7854) q[6];
rz(0.7854) q[7];
cx q[6], q[7];
rz(-1.5708) q[7];
cx q[6], q[7];

// Apply mixing Hamiltonian
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];
rx(1.5708) q[9];
rx(1.5708) q[10];
rx(1.5708) q[11];
rx(1.5708) q[12];
rx(1.5708) q[13];
rx(1.5708) q[14];
rx(1.5708) q[15];

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