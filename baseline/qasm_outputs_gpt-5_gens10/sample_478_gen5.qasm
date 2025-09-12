OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Prepare the state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply entangling gates based on the min_cut graph
cx q[0], q[1]; // Connect source to node 1
cx q[0], q[5]; // Connect source to sink
cx q[1], q[5]; // Connect node 1 to sink
cx q[2], q[4]; // Connect node 2 to node 4
cx q[3], q[4]; // Connect node 3 to node 4
cx q[4], q[1]; // Connect node 4 to node 1
cx q[4], q[3]; // Connect node 4 to node 3
cx q[4], q[5]; // Connect node 4 to sink

// Layer 3: Final layer of rotations for optimal measurement
rz(0.5) q[0];
rz(0.3) q[1];
rz(0.2) q[2];
rz(0.4) q[3];
rz(0.1) q[4];
rz(0.6) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];