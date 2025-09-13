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

// Graph isomorphism oracle for K4 graphs
// The two graphs are both complete graphs K4, so they are isomorphic
// This oracle marks the solution state with a phase flip

// Control qubits for permutation checking
cx q[0], q[4];
cx q[1], q[5];
cx q[2], q[6];
cx q[3], q[7];

// Check edge preservation for all edges
// Edge (0,1) mapping
ccx q[4], q[5], q[8];
// Edge (0,2) mapping  
ccx q[4], q[6], q[9];
// Edge (0,3) mapping
ccx q[4], q[7], q[10];
// Edge (1,2) mapping
ccx q[5], q[6], q[11];
// Edge (1,3) mapping
ccx q[5], q[7], q[12];
// Edge (2,3) mapping
ccx q[6], q[7], q[13];

// Multi-controlled phase flip for valid isomorphism
cccx q[8], q[9], q[10], q[14];
cccx q[11], q[12], q[13], q[15];
cz q[14], q[15];

// Uncompute
cccx q[11], q[12], q[13], q[15];
cccx q[8], q[9], q[10], q[14];
ccx q[6], q[7], q[13];
ccx q[5], q[7], q[12];
ccx q[5], q[6], q[11];
ccx q[4], q[7], q[10];
ccx q[4], q[6], q[9];
ccx q[4], q[5], q[8];
cx q[3], q[7];
cx q[2], q[6];
cx q[1], q[5];
cx q[0], q[4];

// Final measurement
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