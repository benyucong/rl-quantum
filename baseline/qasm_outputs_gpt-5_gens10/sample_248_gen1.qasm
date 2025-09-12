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

cx q[0], q[4];
rx(1.0464) q[4];
cx q[0], q[4];

cx q[0], q[5];
rx(1.1256) q[5];
cx q[0], q[5];

cx q[1], q[2];
rx(0.6823) q[2];
cx q[1], q[2];

cx q[1], q[3];
rx(0.7564) q[3];
cx q[1], q[3];

cx q[1], q[4];
rx(0.9431) q[4];
cx q[1], q[4];

cx q[2], q[3];
rx(0.8548) q[3];
cx q[2], q[3];

cx q[2], q[4];
rx(0.6175) q[4];
cx q[2], q[4];

cx q[3], q[5];
rx(0.7752) q[5];
cx q[3], q[5];

cx q[5], q[6];
rx(0.9839) q[6];
cx q[5], q[6];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];