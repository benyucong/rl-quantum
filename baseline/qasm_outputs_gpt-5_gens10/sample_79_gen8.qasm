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

// First layer of entangling gates based on the edges weights
cx q[0], q[3]; // 0-3 (weight 5)
rz(0.2876) q[3];
cx q[0], q[3];

cx q[0], q[5]; // 0-5 (weight 20)
rz(0.5824) q[5];
cx q[0], q[5];

cx q[0], q[10]; // 0-10 (weight 12)
rz(0.4921) q[10];
cx q[0], q[10];

cx q[1], q[4]; // 1-4 (weight 1)
rz(0.1234) q[4];
cx q[1], q[4];

cx q[1], q[3]; // 1-3 (weight 15)
rz(0.4562) q[3];
cx q[1], q[3];

cx q[1], q[7]; // 1-7 (weight 15)
rz(0.3784) q[7];
cx q[1], q[7];

cx q[2], q[5]; // 2-5 (weight 5)
rz(0.1579) q[5];
cx q[2], q[5];

cx q[2], q[6]; // 2-6 (weight 14)
rz(0.4522) q[6];
cx q[2], q[6];

// Second layer of entangling gates
cx q[3], q[0];
rz(0.4896) q[0];
cx q[3], q[0];

cx q[5], q[0];
rz(0.3961) q[0];
cx q[5], q[0];

cx q[10], q[0];
rz(0.2123) q[0];
cx q[10], q[0];

cx q[4], q[1];
rz(0.1234) q[1];
cx q[4], q[1];

cx q[3], q[1];
rz(0.2876) q[1];
cx q[3], q[1];

cx q[7], q[1];
rz(0.3945) q[1];
cx q[7], q[1];

cx q[5], q[2];
rz(0.2384) q[2];
cx q[5], q[2];

cx q[6], q[2];
rz(0.2875) q[2];
cx q[6], q[2];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];