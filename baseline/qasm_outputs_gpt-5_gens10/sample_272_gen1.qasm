OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
rx(1.234) q[4];
rx(1.567) q[5];
rx(2.345) q[6];
rx(0.876) q[7];
rx(1.456) q[8];

// Layer 2 (entangling)
cx q[0], q[4];
cx q[0], q[6];
cx q[1], q[5];
cx q[1], q[8];
cx q[2], q[4];
cx q[2], q[6];
cx q[2], q[7];
cx q[3], q[7];
cx q[3], q[6];

// Layer 3 (rotation)
rz(0.123) q[0];
rz(0.456) q[1];
rz(0.789) q[2];
rz(0.012) q[3];
rz(0.345) q[4];
rz(0.678) q[5];
rz(0.910) q[6];
rz(0.111) q[7];
rz(0.222) q[8];

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