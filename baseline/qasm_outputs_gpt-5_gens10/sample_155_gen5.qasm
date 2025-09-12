OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 2
cx q[0], q[6]; // Source connection to node 6
rz(0.7854) q[6]; // Optimize phase for node 6
cx q[0], q[8]; // Source connection to sink node 8
rz(0.6158) q[8]; // Optimize phase for sink 8

cx q[1], q[3]; // Node 1 to 3
rz(0.4692) q[3]; // Optimize phase for node 3
cx q[1], q[5]; // Node 1 to 5
rz(0.2244) q[5]; // Optimize phase for node 5

cx q[2], q[7]; // Node 2 to 7
rz(0.5938) q[7]; // Optimize phase for node 7
cx q[2], q[8]; // Node 2 to sink
rz(0.5839) q[8]; // Optimize phase for sink

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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