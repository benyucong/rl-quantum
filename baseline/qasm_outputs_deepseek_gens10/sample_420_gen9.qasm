OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits with Hadamard gates for superposition
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

// Apply phase separation with optimal parameters for graph coloring
// Edge constraints: (0,2), (0,3), (2,1), (2,3), (1,3)
// Using 3 colors, each node represented by 2 qubits (00,01,10)

// Edge (0,2) constraint
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];

// Edge (0,3) constraint
cx q[0], q[8];
rz(0.7854) q[8];
cx q[0], q[8];
cx q[1], q[9];
rz(0.7854) q[9];
cx q[1], q[9];

// Edge (2,1) constraint
cx q[4], q[2];
rz(0.7854) q[2];
cx q[4], q[2];
cx q[5], q[3];
rz(0.7854) q[3];
cx q[5], q[3];

// Edge (2,3) constraint
cx q[4], q[8];
rz(0.7854) q[8];
cx q[4], q[8];
cx q[5], q[9];
rz(0.7854) q[9];
cx q[5], q[9];

// Edge (1,3) constraint
cx q[2], q[8];
rz(0.7854) q[8];
cx q[2], q[8];
cx q[3], q[9];
rz(0.7854) q[9];
cx q[3], q[9];

// Mixing layer
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

// Measurements
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