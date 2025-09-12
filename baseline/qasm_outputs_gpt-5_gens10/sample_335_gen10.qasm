OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Apply controlled operations based on edges
ccx q[0], q[1], q[3]; // control from 0 to 3
ccx q[1], q[2], q[4]; // control from 1 to 4
ccx q[1], q[7], q[5]; // control from 1 to 5
ccx q[2], q[4], q[6]; // control from 2 to 6
ccx q[4], q[5], q[7]; // control from 4 to 7

// Layer 3: Apply rotations for optimization
rz(0.6142) q[0];
rz(0.9213) q[1];
rz(1.3456) q[2];
rz(0.4765) q[3];
rz(0.3221) q[4];
rz(1.7890) q[5];
rz(0.1111) q[6];
rz(0.5555) q[7];

// Measure the final state
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];