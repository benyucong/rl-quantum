OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1
rx(1.2345) q[0];
ry(0.9876) q[1];
rx(1.1234) q[2];
ry(0.6543) q[3];
rx(1.5678) q[4];

// Layer 2
cz q[0], q[1];
cz q[1], q[2];
cz q[0], q[3];
cz q[1], q[4];

// Layer 3
rx(0.3456) q[0];
ry(0.7890) q[1];
rz(0.1234) q[2];
rx(0.4567) q[3];
rz(0.6789) q[4];

// Layer 4
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];