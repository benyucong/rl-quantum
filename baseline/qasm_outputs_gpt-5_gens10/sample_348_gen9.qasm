OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[0], q[5]; // Edge from source to sink
cx q[1], q[3]; // Edge from 1 to 3
cx q[2], q[3]; // Edge from 2 to 3
cx q[3], q[5]; // Edge from 3 to sink
cx q[4], q[2]; // Edge from 4 to 2

// Layer 2
rx(2.0241) q[0];
rz(0.3472) q[0];
rx(1.7542) q[1];
rz(1.9115) q[1];
rx(1.2236) q[2];
rz(0.5439) q[2];
rx(0.9780) q[3];
rz(0.7503) q[3];
rx(0.4377) q[4];
rz(0.1130) q[4];
rx(1.9854) q[5];
rz(1.4306) q[5];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[0], q[5]; // Reapply source to sink
cx q[1], q[3]; // Reapply 1 to 3
cx q[2], q[3]; // Reapply 2 to 3
cx q[3], q[5]; // Reapply 3 to sink
cx q[4], q[2]; // Reapply 4 to 2

// Measurement
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