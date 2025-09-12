OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
h q[0];       // Apply Hadamard to start with superposition
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Encode the connections based on capacities
rx(1.5708) q[0];
cx q[0], q[2]; // Connect 0 to 2
rz(-1.045) q[2];
cx q[0], q[5]; // Connect 0 to 5
rz(-0.785) q[5];

cx q[2], q[1]; // Connect 2 to 1
rz(-0.148) q[1];
cx q[2], q[4]; // Connect 2 to 4
rz(-1.047) q[4];

cx q[3], q[2]; // Connect 3 to 2
rz(-0.785) q[2];
cx q[3], q[5]; // Connect 3 to 5
rz(-0.524) q[5];

cx q[4], q[1]; // Connect 4 to 1
rz(-0.261) q[1];
cx q[4], q[3]; // Connect 4 to 3
rz(-0.524) q[3];
cx q[4], q[5]; // Connect 4 to 5
rz(-0.394) q[5];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

h q[0];
rz(0.305) q[0];
h q[0];
h q[1];
rz(0.15) q[1];
h q[1];
h q[2];
rz(0.25) q[2];
h q[2];
h q[3];
rz(0.20) q[3];
h q[3];
h q[4];
rz(0.15) q[4];
h q[4];
h q[5];
rz(0.30) q[5];
h q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];