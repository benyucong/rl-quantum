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

rx(1.2033) q[0];
rx(1.6137) q[1];
rx(0.8912) q[2];
rx(0.4531) q[3];
rx(1.7154) q[4];
rx(0.8745) q[5];

cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[4];
cx q[0], q[5];
rz(0.3856) q[0];

cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[5];
rz(0.2215) q[1];

cx q[2], q[3];
cx q[2], q[4];
cx q[2], q[5];
rz(0.1483) q[2];

cx q[3], q[4];
cx q[3], q[5];
rz(0.0772) q[3];
cx q[4], q[5];
rz(0.0534) q[4];

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