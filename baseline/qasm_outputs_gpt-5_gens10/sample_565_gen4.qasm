OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

rz(0.1355) q[5];
cx q[0], q[5];
cz q[1], q[5];

rz(0.1382) q[6];
cx q[1], q[6];
cz q[0], q[6];

rz(0.1313) q[7];
cx q[2], q[7];
cz q[3], q[7];

rz(0.1371) q[8];
cx q[3], q[8];
cz q[2], q[8];

rz(0.1400) q[9];
cx q[4], q[9];
cz q[3], q[9];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

rx(1.2048) q[0];
rz(-0.0051) q[0];
rx(1.2049) q[1];
rz(-0.0023) q[1];
rx(1.2050) q[2];
rz(-0.0072) q[2];
rx(1.2052) q[3];
rz(-0.0036) q[3];
rx(1.2047) q[4];
rz(-0.0061) q[4];
  
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