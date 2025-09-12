OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];

// Layer 2
rx(2.4457) q[0];
ry(1.1249) q[1];
rz(0.6987) q[2];
rx(0.8724) q[3];
cx q[0], q[3];
cx q[1], q[2];

// Layer 3
rz(-0.6729) q[2];
ry(1.9183) q[1];
rx(2.5036) q[0];
cx q[2], q[4];
cx q[3], q[5];

// Layer 4
h q[4];
h q[5];
h q[6];
h q[7];
rx(-1.2845) q[6];
rz(1.2598) q[5];
rx(0.7642) q[4];
cx q[6], q[7];
cx q[5], q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];