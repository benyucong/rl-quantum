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

cx q[0], q[2]; // Source to Node 2
rz(-0.4003) q[2]; // Capacity between Source and Node 2
cx q[0], q[2];

cx q[0], q[3]; // Source to Node 3
rz(-0.5508) q[3]; // Capacity between Source and Node 3
cx q[0], q[3];

cx q[0], q[4]; // Source to Node 4
rz(-0.3365) q[4]; // Capacity between Source and Node 4
cx q[0], q[4];

cx q[0], q[6]; // Source to Sink
rz(-0.4003) q[6]; // Capacity between Source and Sink
cx q[0], q[6];

cx q[1], q[2]; // Node 1 to Node 2
rz(-0.5508) q[2]; // Capacity between Node 1 and Node 2
cx q[1], q[2];

cx q[1], q[4]; // Node 1 to Node 4
rz(-0.3365) q[4]; // Capacity between Node 1 and Node 4
cx q[1], q[4];

cx q[2], q[6]; // Node 2 to Sink
rz(-0.4003) q[6]; // Capacity between Node 2 and Sink
cx q[2], q[6];

cx q[3], q[5]; // Node 3 to Node 5
rz(-0.5508) q[5]; // Capacity between Node 3 and Node 5
cx q[3], q[5];

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