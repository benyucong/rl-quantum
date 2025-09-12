OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

rx(1.2345) q[0];
rx(0.5678) q[1];
rx(1.0345) q[2];
rx(0.8765) q[3];
rx(0.2345) q[4];

cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[2];
cz q[2], q[4];
cx q[3], q[4];

rx(1.1111) q[0];
rx(0.3444) q[1];
rx(1.5555) q[2];
rx(0.8888) q[3];
rx(0.1222) q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];