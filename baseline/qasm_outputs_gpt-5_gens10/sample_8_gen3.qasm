OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;

h q[0];
h q[1];
h q[2];

cx q[0], q[1];
rx(1.0472) q[0];
rz(0.7854) q[0];
cx q[1], q[2];
rz(0.7854) q[1];

h q[0];
rx(0.7854) q[1];
h q[1];

cx q[0], q[2];
rz(0.3464) q[2];
cx q[1], q[2];
rz(1.2043) q[2];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];