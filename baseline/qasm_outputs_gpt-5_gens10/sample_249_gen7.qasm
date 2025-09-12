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
cx q[0], q[4]; // Edge (0,4)
cx q[0], q[5]; // Edge (0,5)
cx q[1], q[7]; // Edge (1,7)
cx q[1], q[8]; // Edge (1,8)
cx q[2], q[4]; // Edge (2,4)
cx q[2], q[7]; // Edge (2,7)
cx q[3], q[4]; // Edge (3,4)
cx q[3], q[8]; // Edge (3,8)
cx q[4], q[2]; // Reverse Edge (4,2)
cx q[5], q[2]; // Reverse Edge (5,2)
cx q[5], q[6]; // Edge (5,6)
cx q[6], q[2]; // Edge (6,2)
cx q[6], q[4]; // Edge (6,4)
cx q[6], q[8]; // Edge (6,8)
cx q[7], q[8]; // Edge (7,8)
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];