OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

cx q[0], q[2]; // edge (0->2) capacity 3
cx q[1], q[5]; // edge (1->5) capacity 3
cx q[2], q[5]; // edge (2->5) capacity 4
cx q[4], q[1]; // edge (4->1) capacity 4
cx q[4], q[3]; // edge (4->3) capacity 3
cx q[4], q[5]; // edge (4->5) capacity 6

rz(0.1234) q[0]; // Driver parameters
rz(0.5678) q[1];
rz(0.9101) q[2];
rz(0.2345) q[3];
rz(0.6789) q[4];
rz(0.3456) q[5];

cx q[0], q[2];
cx q[1], q[5];
cx q[2], q[5];
cx q[4], q[1];
cx q[4], q[3];
cx q[4], q[5];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];