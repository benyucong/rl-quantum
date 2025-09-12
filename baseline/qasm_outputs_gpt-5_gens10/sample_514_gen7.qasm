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

rx(1.2345) q[0];
ry(0.5678) q[1];
rz(0.9101) q[2];
rx(0.3456) q[3];
ry(1.2345) q[4];
rz(1.6789) q[5];

cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[2], q[5];
cx q[2], q[4];

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