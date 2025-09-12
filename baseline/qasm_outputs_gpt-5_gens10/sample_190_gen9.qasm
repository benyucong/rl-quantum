OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

cx q[0], q[1];
rz(-0.3213) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(-0.4217) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(-0.2411) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(-0.1613) q[4];
cx q[0], q[4];

cx q[1], q[2];
rz(-0.5013) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(-0.3891) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(-0.4532) q[4];
cx q[1], q[4];

cx q[2], q[3];
rz(-0.2904) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(-0.1926) q[4];
cx q[2], q[4];

cx q[3], q[4];
rz(-0.2229) q[4];
cx q[3], q[4];

h q[0];
rz(0.1571) q[0];
h q[0];
h q[1];
rz(0.1876) q[1];
h q[1];
h q[2];
rz(0.2373) q[2];
h q[2];
h q[3];
rz(0.1178) q[3];
h q[3];
h q[4];
rz(0.0802) q[4];
h q[4];
h q[5];
rz(0.1451) q[5];
h q[5];
h q[6];
rz(0.0984) q[6];
h q[6];
h q[7];
rz(0.1235) q[7];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];