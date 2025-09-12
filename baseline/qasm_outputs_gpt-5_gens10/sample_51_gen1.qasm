OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Layer 1: Initialization and Preprocessing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[4];
cx q[1], q[6];
cx q[2], q[1];
cx q[2], q[4];
cx q[3], q[5];

// Layer 2: Flow Encoding
rz(0.7854) q[0];
rz(0.4360) q[1];
rz(0.1254) q[2];
rz(0.6231) q[3];
rz(1.4231) q[4];
rz(0.7854) q[5];
rz(0.3256) q[6];
cx q[0], q[1];
cx q[1], q[2];
cx q[0], q[4];
cx q[4], q[6];
cx q[2], q[1];
cx q[2], q[4];

// Layer 3: Measurement Preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.0623) q[0];
rz(0.5253) q[1];
rz(0.8712) q[2];
rz(1.0323) q[3];
rz(0.1930) q[4];
rz(0.8765) q[5];
rz(0.2355) q[6];

// Final Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[0]; // Additional for check
c[8] = measure q[1]; // Additional for check
c[9] = measure q[2]; // Additional for check
c[10] = measure q[4]; // Additional for check
c[11] = measure q[5]; // Additional for check
c[12] = measure q[3]; // Additional for check
c[13] = measure q[6]; // Additional for check