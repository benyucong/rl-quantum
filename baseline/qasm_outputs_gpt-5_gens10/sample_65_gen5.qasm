OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

rz(0.7854) q[0];
rz(1.0472) q[1];
rz(0.6471) q[2];
rz(0.3491) q[3];
rz(0.9425) q[4];

cx q[0], q[2];
cx q[1], q[3];
cx q[2], q[3];
cx q[2], q[4];
cx q[3], q[1];
cx q[3], q[2];

rz(0.15) q[0];
rz(0.35) q[1];
rz(0.25) q[2];
rz(0.45) q[3];
rz(0.55) q[4];

cx q[2], q[0];
cx q[3], q[1];
cx q[4], q[2];
cx q[1], q[3];

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