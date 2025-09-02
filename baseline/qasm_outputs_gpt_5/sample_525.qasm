OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Encode the path from 0 to all other nodes
cx q[0], q[1];
rz(-0.2447) q[1]; // weight 10
cx q[1], q[2];
rz(-0.1116) q[2]; // weight 7
cx q[1], q[3];
rz(-0.9603) q[3]; // weight 43
cx q[1], q[4];
rz(-0.8924) q[4]; // weight 42

// Layer 2: Further connections
cx q[2], q[3];
rz(-0.1245) q[3]; // weight 5
cx q[2], q[4];
rz(-0.6575) q[4]; // weight 45
cx q[3], q[4];
rz(-0.0869) q[4]; // weight 7

// Layer 3: Connect to the ending node
cx q[4], q[5];
rz(-0.0520) q[5]; // weight 8

// Measure all qubits
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