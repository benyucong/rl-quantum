OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];  // Node 0
h q[1];  // Node 1
h q[2];  // Node 2
h q[3];  // Node 3
h q[4];  // Node 4
h q[5];  // Node 5
h q[6];  // Node 6
h q[7];  // Node 7

// Apply controlled rotations based on edges
rz(0.523) q[0]; // Edge {0,4}
cx q[0], q[4];

rz(0.785) q[1]; // Edge {1,5}
cx q[1], q[5];
rz(0.785) q[1]; // Edge {1,4}
cx q[1], q[4];

rz(0.321) q[2]; // Edge {2,6}
cx q[2], q[6];
rz(0.907) q[2]; // Edge {2,4}
cx q[2], q[4];
rz(0.654) q[2]; // Edge {2,5}
cx q[2], q[5];

rz(0.543) q[3]; // Edge {3,7}
cx q[3], q[7];
rz(0.109) q[3]; // Edge {3,6}
cx q[3], q[6];
rz(0.875) q[3]; // Edge {3,5}
cx q[3], q[5];

// Layer 2 (Final layer)
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measure final states
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];