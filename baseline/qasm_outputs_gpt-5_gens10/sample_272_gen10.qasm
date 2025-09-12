OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

h q[0];
h q[1];
h q[2];
h q[3];

rx(1.2345) q[0];
rx(0.5678) q[1];
ry(0.1234) q[2];
ry(0.9876) q[3];

cx q[0], q[4];
cx q[1], q[5];
cx q[2], q[6];
cx q[3], q[7];

rx(0.4567) q[4];
rz(0.2345) q[5];
rx(0.5678) q[6];
rz(0.8765) q[7];

cx q[4], q[0];
cx q[5], q[1];
cx q[6], q[2];
cx q[7], q[3];

h q[0];
h q[1];
h q[2];
h q[3];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];