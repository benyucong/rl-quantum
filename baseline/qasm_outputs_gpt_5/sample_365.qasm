OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initializing qubits in superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Applying controlled operations according to the min-cut graph structure
cx q[0], q[3]; // Edge 0->3
rz(-0.2426) q[3];
cx q[0], q[3];

cx q[1], q[3]; // Edge 1->3
rz(-0.1765) q[3];
cx q[1], q[3];

cx q[1], q[5]; // Edge 1->5
rz(-0.1447) q[5];
cx q[1], q[5];

cx q[2], q[6]; // Edge 2->6
rz(-0.1923) q[6];
cx q[2], q[6];

cx q[3], q[8]; // Edge 3->8
rz(-0.2877) q[8];
cx q[3], q[8];

cx q[4], q[7]; // Edge 4->7
rz(-0.1973) q[7];
cx q[4], q[7];

cx q[5], q[1]; // Edge 5->1
rz(-0.1141) q[1];
cx q[5], q[1];

cx q[5], q[4]; // Edge 5->4
rz(-0.1769) q[4];
cx q[5], q[4];

cx q[7], q[2]; // Edge 7->2
rz(-0.1785) q[2];
cx q[7], q[2];

cx q[7], q[6]; // Edge 7->6
rz(-0.1852) q[6];
cx q[7], q[6];

cx q[7], q[8]; // Edge 7->8
rz(-0.2330) q[8];
cx q[7], q[8];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];