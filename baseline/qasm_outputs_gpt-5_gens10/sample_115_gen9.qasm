OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

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
h q[11];

cx q[4], q[0];
rx(1.45) q[0];
rx(1.45) q[4];

cx q[6], q[1];
rx(1.55) q[1];
rx(1.55) q[6];

cx q[4], q[2];
rx(1.51) q[2];
rx(1.51) q[4];

cx q[5], q[3];
rx(1.49) q[3];
rx(1.49) q[5];

cx q[7], q[5];
rx(1.53) q[5];
rx(1.53) q[7];

cx q[8], q[6];
rx(1.52) q[6];
rx(1.52) q[8];

cx q[9], q[7];
rx(1.50) q[7];
rx(1.50) q[9];

cx q[10], q[8];
rx(1.54) q[8];
rx(1.54) q[10];

cx q[11], q[9];
rx(1.48) q[9];
rx(1.48) q[11];

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