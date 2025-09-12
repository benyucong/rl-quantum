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

rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

cx q[0], q[2]; // Source to node
cx q[1], q[3]; // Node to node
cx q[1], q[4]; // Node to node
cx q[2], q[4]; // Node to node
cx q[2], q[5]; // Node to node
cx q[2], q[6]; // Node to sink
cx q[3], q[2]; // Node to node
cx q[4], q[1]; // Node to node
cx q[4], q[3]; // Node to node
cx q[4], q[6]; // Node to sink
cx q[5], q[1]; // Node to node
cx q[5], q[2]; // Node to node
cx q[5], q[6]; // Node to sink

rz(0.3491) q[0];
rz(0.3491) q[1];
rz(0.3491) q[2];
rz(0.3491) q[3];
rz(0.3491) q[4];
rz(0.3491) q[5];
rz(0.3491) q[6];

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