OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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

// Layer 2: Problem-specific phase rotations based on edge weights
// Left partition: qubits 0-4, Right partition: qubits 5-9
rz(0.7854) q[0];  // Weight 1 edge (0-5)
rz(2.3562) q[0];  // Weight 13 edge (0-6)
rz(2.3562) q[0];  // Weight 14 edge (0-9)
rz(0.7854) q[1];  // Weight 1 edge (1-6)
rz(0.7854) q[2];  // Weight 5 edge (2-7)
rz(0.7854) q[3];  // Weight 5 edge (3-8)
rz(2.3562) q[3];  // Weight 12 edge (3-5)
rz(0.7854) q[4];  // Weight 5 edge (4-9)
rz(2.3562) q[4];  // Weight 17 edge (4-7)
rz(2.3562) q[4];  // Weight 13 edge (4-5)

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