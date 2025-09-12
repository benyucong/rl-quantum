OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Initialization
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

// Layer 1: Encoding edges with controlled rotations
cx q[0], q[5]; // capacity: 2
rz(0.7854) q[5]; // effective rotation
cx q[2], q[3]; // capacity: 2
rz(0.9273) q[3];
cx q[3], q[1]; // capacity: 3
rz(0.5236) q[1];
cx q[3], q[2]; // capacity: 1
rz(0.6435) q[2];
cx q[3], q[5]; // capacity: 3
rz(1.0472) q[5];
cx q[4], q[2]; // capacity: 2
rz(0.6545) q[2];

// Layer 2: Interactions and additional control
h q[5];
cx q[3], q[1];
rz(-0.2618) q[1];
h q[1];
cx q[2], q[4];
rz(0.1744) q[4];

// Layer 3: Final adjustments and measurement preparation
h q[3];
cx q[0], q[5];
rz(-0.7854) q[5];
h q[5];
cx q[4], q[2];
rz(-0.6545) q[2];

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