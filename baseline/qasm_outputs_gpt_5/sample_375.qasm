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

cx q[0], q[5]; // Heavy edge from node 0 to 5
cx q[1], q[5]; // Heavy edge from node 1 to 5
cx q[1], q[6]; // Heavy edge from node 1 to 6
cx q[2], q[6]; // Heavy edge from node 2 to 6
cx q[2], q[7]; // Heavy edge from node 2 to 7
cx q[2], q[8]; // Heavy edge from node 2 to 8
cx q[3], q[8]; // Heavy edge from node 3 to 8
cx q[3], q[7]; // Heavy edge from node 3 to 7
cx q[3], q[5]; // Heavy edge from node 3 to 5

// Layer 2
rz(0.4631) q[0];
rz(0.1234) q[1];
rz(0.6723) q[2];
rz(0.3221) q[3];
rz(0.1984) q[4];
rz(0.7541) q[5];
rz(0.5412) q[6];
rz(0.9172) q[7];
rz(0.3854) q[8];

cx q[0], q[5];
cx q[1], q[6];
cx q[2], q[7];
cx q[3], q[8];

// Layer 3 (finalize)
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];