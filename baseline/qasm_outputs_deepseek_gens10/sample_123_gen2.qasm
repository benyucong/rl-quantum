OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initial Hadamard on all qubits
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
h q[11];

// Layer 2: Problem-specific phase rotations based on edge weights
// Left nodes: 0-6, Right nodes: 7-11
rz(0.7854) q[0];  // Node 0 phase (avg weight 11.5)
rz(0.7854) q[1];  // Node 1 phase (weight 4)
rz(1.5708) q[2];  // Node 2 phase (avg weight 11)
rz(1.0472) q[3];  // Node 3 phase (weight 10)
rz(1.3089) q[4];  // Node 4 phase (avg weight 11)
rz(1.5708) q[5];  // Node 5 phase (avg weight 19)
rz(0.0) q[6];     // Node 6 phase (no edges)
rz(1.3089) q[7];  // Node 7 phase (avg weight 12)
rz(1.5708) q[8];  // Node 8 phase (avg weight 14)
rz(0.7854) q[9];  // Node 9 phase (avg weight 11)
rz(1.0472) q[10]; // Node 10 phase (weight 10)
rz(0.7854) q[11]; // Node 11 phase (weight 7)

// Layer 3: Mixing and final Hadamard
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
h q[11];

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