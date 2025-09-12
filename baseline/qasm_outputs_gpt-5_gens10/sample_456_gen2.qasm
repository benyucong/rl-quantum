OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initializing states
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Applying controlled rotations to create entanglement based on the min-cut graph flow
cx q[0], q[1]; // Source to Node 1
rz(0.12) q[1]; 

cx q[0], q[3]; // Source to Node 3
rz(0.15) q[3]; 

cx q[0], q[4]; // Source to Node 4
rz(0.18) q[4];

cx q[0], q[5]; // Source to Sink
rz(0.20) q[5];

cx q[1], q[3]; // Node 1 to Node 3
rz(0.10) q[3];

cx q[1], q[4]; // Node 1 to Node 4
rz(0.14) q[4];

cx q[1], q[5]; // Node 1 to Sink
rz(0.12) q[5];

cx q[3], q[2]; // Node 3 to Node 2
rz(0.16) q[2];

cx q[3], q[4]; // Node 3 to Node 4
rz(0.08) q[4];

cx q[3], q[5]; // Node 3 to Sink
rz(0.11) q[5];

// Layer 3: Finalizing with Hadamard to prepare for measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];