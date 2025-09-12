OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

cx q[0], q[2]; // 0 to 2
cx q[0], q[5]; // 0 to 5
rz(0.6747) q[2];
cx q[2], q[1]; // 2 to 1
rz(0.6932) q[2];
cx q[2], q[4]; // 2 to 4
rz(0.6747) q[4];
cx q[3], q[2]; // 3 to 2
cx q[3], q[5]; // 3 to 5
rz(0.5163) q[5]; // decrease capacity towards 5


// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

cx q[0], q[2]; // 0 to 2
cx q[0], q[5]; // 0 to 5
rz(0.4) q[2];
cx q[2], q[1]; // 2 to 1
rz(0.4) q[2];
cx q[2], q[4]; // 2 to 4
rz(0.4) q[4];
cx q[3], q[2]; // 3 to 2
cx q[3], q[5]; // 3 to 5
rz(0.4) q[5]; // maintain flow

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];