OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

cx q[0], q[2];  // Source to node 2
rz(1.0472) q[2];
cx q[0], q[2];

cx q[1], q[3];  // Node 1 to node 3
rz(1.0472) q[3];
cx q[1], q[3];

cx q[1], q[4];  // Node 1 to node 4
rz(1.0472) q[4];
cx q[1], q[4];

cx q[2], q[4];  // Node 2 to node 4
rz(1.0472) q[4];
cx q[2], q[4];

cx q[2], q[5];  // Node 2 to node 5
rz(1.0472) q[5];
cx q[2], q[5];

cx q[2], q[6];  // Node 2 to sink
rz(1.0472) q[6];
cx q[2], q[6];

cx q[3], q[2];  // Node 3 back to node 2
rz(1.0472) q[2];
cx q[3], q[2];

cx q[4], q[6];  // Node 4 to sink
rz(1.0472) q[6];
cx q[4], q[6];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];