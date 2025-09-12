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

rx(1.0472) q[0];
rz(0.0175) q[0];
rx(1.1541) q[1];
rz(0.0123) q[1];
rx(1.2089) q[2];
rz(0.0216) q[2];
rx(1.0034) q[3];
rz(-0.0142) q[3];
rx(1.1580) q[4];
rz(0.0093) q[4];
rx(0.8900) q[5];
rz(0.0048) q[5];

cx q[0], q[1];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[2], q[0];

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