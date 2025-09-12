OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];

// Apply controlled rotations for the min_cut problem
cry(0.5) q[0], q[2]; // Source to sink
cry(0.5) q[1], q[3]; // Source to sink
cry(0.5) q[2], q[1]; // Feedback path
cry(0.5) q[2], q[3]; // Feedback path

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
rz(0.1) q[0];
rz(0.1) q[1];
rz(0.1) q[2];
rz(0.1) q[3];

// Measure the final state
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];