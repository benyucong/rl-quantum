OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Initial Hadamard on all qubits
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

// Graph isomorphism problem encoding with optimal parameters
// Target graph edges: (0,1), (0,2), (1,3), (2,3)
// Reference graph edges: (3,2), (3,0), (2,1), (0,1)

// Edge comparison operators with optimal phase parameters
// Edge (0,1) comparison
cx q[0], q[4];
cx q[1], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
cx q[1], q[4];

// Edge (0,2) comparison  
cx q[0], q[5];
cx q[2], q[5];
rz(0.7854) q[5];
cx q[0], q[5];
cx q[2], q[5];

// Edge (1,3) comparison
cx q[1], q[6];
cx q[3], q[6];
rz(0.7854) q[6];
cx q[1], q[6];
cx q[3], q[6];

// Edge (2,3) comparison
cx q[2], q[7];
cx q[3], q[7];
rz(0.7854) q[7];
cx q[2], q[7];
cx q[3], q[7];

// Reference graph edge comparisons
// Edge (3,2) comparison
cx q[3], q[8];
cx q[2], q[8];
rz(-0.7854) q[8];
cx q[3], q[8];
cx q[2], q[8];

// Edge (3,0) comparison
cx q[3], q[9];
cx q[0], q[9];
rz(-0.7854) q[9];
cx q[3], q[9];
cx q[0], q[9];

// Edge (2,1) comparison
cx q[2], q[10];
cx q[1], q[10];
rz(-0.7854) q[10];
cx q[2], q[10];
cx q[1], q[10];

// Edge (0,1) comparison
cx q[0], q[11];
cx q[1], q[11];
rz(-0.7854) q[11];
cx q[0], q[11];
cx q[1], q[11];

// Final Hadamard layer for measurement
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