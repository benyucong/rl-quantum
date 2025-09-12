OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];

cx q[0], q[4];
rz(-0.0451) q[4];
cx q[0], q[4];

cx q[1], q[2];
rz(-0.0389) q[2];
cx q[1], q[2];

cx q[2], q[3];
rz(-0.0345) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(-0.0221) q[4];
cx q[2], q[4];

cx q[2], q[5];
rz(-0.0208) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(-0.0287) q[6];
cx q[2], q[6];

cx q[3], q[4];
rz(-0.0126) q[4];
cx q[3], q[4];

cx q[3], q[5];
rz(-0.0194) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(-0.0149) q[6];
cx q[3], q[6];

h q[0];
rz(0.0657) q[0];
h q[0];
h q[1];
rz(0.0745) q[1];
h q[1];
h q[2];
rz(0.0801) q[2];
h q[2];
h q[3];
rz(0.0796) q[3];
h q[3];
h q[4];
rz(0.0788) q[4];
h q[4];
h q[5];
rz(0.0777) q[5];
h q[5];
h q[6];
rz(0.0765) q[6];
h q[6];
h q[7];
rz(0.0723) q[7];
h q[7];
h q[8];
rz(0.0711) q[8];
h q[8];
h q[9];
rz(0.0708) q[9];
h q[9];
h q[10];
rz(0.0692) q[10];
h q[10];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];