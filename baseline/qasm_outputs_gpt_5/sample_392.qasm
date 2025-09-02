OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

cx q[0], q[3];
rz(-0.5) q[3];
cx q[0], q[3];

cx q[0], q[6];
rz(-0.611) q[6];
cx q[0], q[6];

cx q[0], q[7];
rz(-0.511) q[7];
cx q[0], q[7];

cx q[1], q[3];
rz(-0.4) q[3];
cx q[1], q[3];

cx q[1], q[5];
rz(-0.35) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(-0.25) q[6];
cx q[1], q[6];

cx q[1], q[8];
rz(-0.3) q[8];
cx q[1], q[8];

cx q[2], q[3];
rz(-0.3) q[3];
cx q[2], q[3];

cx q[2], q[6];
rz(-0.15) q[6];
cx q[2], q[6];

cx q[4], q[8];
rz(-0.4) q[8];
cx q[4], q[8];

sel c[0], measure q[0];
sel c[1], measure q[1];
sel c[2], measure q[2];
sel c[3], measure q[3];
sel c[4], measure q[4];
sel c[5], measure q[5];
sel c[6], measure q[6];
sel c[7], measure q[7];
sel c[8], measure q[8];