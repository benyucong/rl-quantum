OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
cx q[0], q[1];  // source to node 1
cx q[0], q[6];  // source to sink
cx q[1], q[4];  // node 1 to node 4
cx q[1], q[6];  // node 1 to sink
cx q[2], q[4];  // node 2 to node 4
cx q[3], q[2];  // node 3 to node 2
cx q[3], q[5];  // node 3 to node 5
cx q[3], q[6];  // node 3 to sink
cx q[4], q[2];  // node 4 to node 2

// Layer 2
rz(0.1) q[0];
rz(0.2) q[1];
rz(0.1) q[2];
rz(0.1) q[3];
rz(0.1) q[4];
rz(0.2) q[5];
rz(0.1) q[6];
cx q[1], q[4];
cx q[2], q[4];

// Layer 3
h q[6];
cx q[0], q[1];  // source to node 1
cx q[3], q[6];  // node 3 to sink
cx q[2], q[3];  // node 2 to node 3
cx q[3], q[5];  // node 3 to node 5
rz(-0.1) q[2];
rz(-0.1) q[3];
h q[0];
h q[1];
h q[2];

// Measure
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