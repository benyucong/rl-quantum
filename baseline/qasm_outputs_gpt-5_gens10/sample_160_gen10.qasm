OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2
cx q[0], q[8];
rz(1.4323) q[8];
cx q[0], q[8];

cx q[1], q[9];
rz(1.4234) q[9];
cx q[1], q[9];

cx q[2], q[10];
rz(1.4567) q[10];
cx q[2], q[10];

cx q[3], q[11];
rz(1.4789) q[11];
cx q[3], q[11];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 4
cx q[4], q[8];
rz(1.4901) q[8];
cx q[4], q[8];

cx q[5], q[9];
rz(1.5014) q[9];
cx q[5], q[9];

cx q[6], q[10];
rz(1.5126) q[10];
cx q[6], q[10];

cx q[7], q[11];
rz(1.5238) q[11];
cx q[7], q[11];

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
c[11] = measure q[11];