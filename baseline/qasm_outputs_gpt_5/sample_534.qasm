OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

rx(1.2146) q[0];
ry(0.9731) q[1];
rz(0.5893) q[2];
rx(1.7453) q[3];
ry(1.0954) q[4];

cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];