OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1
h q[0]; // Prepare Source Node
h q[1]; // Prepare Node 1
h q[2]; // Prepare Node 2
h q[3]; // Prepare Sink Node
cx q[0], q[1]; // Connect Source to Node 1
cx q[0], q[3]; // Connect Source to Sink
cx q[1], q[2]; // Connect Node 1 to Node 2
cx q[1], q[3]; // Connect Node 1 to Sink

// Layer 2
rz(1.0472) q[0]; // Rotate Source
rz(0.5236) q[1]; // Rotate Node 1
rz(0.7854) q[2]; // Rotate Node 2
rz(1.5708) q[3]; // Rotate Sink
cx q[0], q[1]; // Apply entanglement
cx q[1], q[2]; // Apply entanglement
cx q[2], q[3]; // Apply entanglement

// Layer 3
rz(0.7854) q[0]; // Final Rotate Source
rz(0.5236) q[1]; // Final Rotate Node 1
rz(1.0472) q[2]; // Final Rotate Node 2
rz(0) q[3]; // Final Rotate Sink
h q[0]; // Measure rotation
h q[1]; // Measure rotation
h q[2]; // Measure rotation
h q[3]; // Measure rotation

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