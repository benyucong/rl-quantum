OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

cx q[0], q[1];
rz(0.2186) q[1];
cx q[0], q[1];

cx q[1], q[2];
rz(0.2351) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.2590) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.1874) q[4];
cx q[1], q[4];

cx q[2], q[3];
rz(0.3452) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.2763) q[4];
cx q[2], q[4];

cx q[3], q[4];
rz(0.1953) q[4];
cx q[3], q[4];

cx q[4], q[5];
rz(0.1595) q[5];
cx q[4], q[5];

h q[0];
rz(0.3452) q[0];
h q[0];

h q[1];
rz(0.2763) q[1];
h q[1];

h q[2];
rz(0.2654) q[2];
h q[2];

h q[3];
rz(0.1975) q[3];
h q[3];

h q[4];
rz(0.3152) q[4];
h q[4];

h q[5];
rz(0.4071) q[5];
h q[5];

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
c[11] = measure q[11];
c[12] = measure q[12];
c[13] = measure q[13];
c[14] = measure q[14];
c[15] = measure q[15];