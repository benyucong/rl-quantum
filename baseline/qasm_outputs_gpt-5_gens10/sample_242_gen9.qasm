OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

rx(1.12) q[0];
rx(1.23) q[1];
rx(0.75) q[2];
rx(0.9) q[3];
rx(1.47) q[4];
rx(0.56) q[5];

cx q[0], q[1];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[5];
cx q[3], q[4];

ry(0.25) q[0];
ry(0.57) q[1];
ry(0.43) q[2];
ry(0.67) q[3];
ry(0.29) q[4];
ry(0.84) q[5];

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