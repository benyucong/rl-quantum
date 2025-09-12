OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
cx q[0], q[5]; // Connect source to node 5
cx q[0], q[6]; // Connect source to sink
cx q[1], q[3]; // Connect node 1 to node 3
cx q[2], q[4]; // Connect node 2 to node 4

// Layer 2
rx(2.0934) q[1];
rx(1.1224) q[2];
rz(0.1568) q[3];
rz(0.2375) q[4];
cx q[3], q[1]; // Reinforce connection (3,1)
cx q[3], q[5]; // Connect node 3 to node 5

// Layer 3
h q[0];
rz(0.1427) q[0];
h q[0];
h q[1];
rz(0.1632) q[1];
h q[1];
h q[2];
rz(0.1784) q[2];
h q[2];
h q[3];
rz(0.0903) q[3];
h q[3];
h q[4];
rz(0.1216) q[4];
h q[4];
h q[5];
rz(0.1557) q[5];
h q[5];
h q[6];
rz(0.0784) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];