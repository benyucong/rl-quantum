OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;
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

cx q[0], q[4]; // source to intermediate
cx q[1], q[4]; // source to intermediate
cx q[2], q[3]; // flow through edge
cx q[2], q[4]; // flow to sink through edge
cx q[2], q[5]; // flow to sink directly
cx q[3], q[2]; // reverse flow

rz(0.98) q[4]; // apply rotation to distribute flow
rz(0.75) q[5]; // apply rotation to sink
 
cx q[4], q[5]; // edge from intermediate to sink
cx q[2], q[5]; // direct flow to sink

h q[2];
h q[4];
h q[5];

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