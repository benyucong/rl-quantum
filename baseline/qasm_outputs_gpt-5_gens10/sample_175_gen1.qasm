OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
cx q[0], q[1]; // source to node 1
cx q[0], q[4]; // source to node 4
cx q[0], q[6]; // source to node 6
cx q[2], q[1]; // intermediate to node 1
cx q[2], q[3]; // intermediate to node 3
cx q[2], q[5]; // intermediate to node 5
cx q[2], q[6]; // intermediate to node 6

// Layer 2
rz(0.5) q[0];
rz(0.3) q[1];
rz(0.1) q[2];
rz(0.4) q[3];
rz(0.2) q[4];
rz(0.6) q[5];
rz(0.8) q[6];
rz(0.7) q[7];
cx q[3], q[1]; // node 3 to node 1
cx q[3], q[2]; // node 3 to node 2
cx q[5], q[4]; // node 5 to node 4
cx q[5], q[7]; // node 5 to sink node (7)
cx q[6], q[4]; // node 6 to node 4
cx q[6], q[7]; // node 6 to sink node (7)

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(0.2) q[0];
rz(0.1) q[1];
rz(0.3) q[2];
rz(0.5) q[3];
rz(0.4) q[4];
rz(0.6) q[5];
rz(0.8) q[6];
rz(0.9) q[7];

// Layer 4
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
measure q[4] -> c[4];
measure q[5] -> c[5];
measure q[6] -> c[6];
measure q[7] -> c[7];