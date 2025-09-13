OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

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
h q[12];

// Layer 2: Problem-specific phase rotations based on edge weights
rz(0.3927) q[0];  // Weight 5
rz(0.1571) q[1];  // Weight 2
rz(0.3142) q[2];  // Weight 4
rz(0.8639) q[2];  // Weight 11
rz(0.7854) q[3];  // Weight 10
rz(1.5708) q[3];  // Weight 20
rz(0.5498) q[4];  // Weight 7
rz(1.3336) q[4];  // Weight 17
rz(0.3927) q[5];  // Weight 5
rz(1.0996) q[6];  // Weight 14
rz(1.3336) q[6];  // Weight 17

// Layer 3: Entangling operations for bipartite matching constraints
// Left nodes constraints
cx q[0], q[7];
cx q[1], q[8];
cx q[2], q[9];
cx q[2], q[12];
cx q[3], q[10];
cx q[3], q[11];
cx q[4], q[11];
cx q[4], q[10];
cx q[5], q[12];
cx q[6], q[8];
cx q[6], q[9];

// Right nodes constraints
cx q[7], q[0];
cx q[8], q[1];
cx q[9], q[2];
cx q[12], q[2];
cx q[10], q[3];
cx q[11], q[3];
cx q[11], q[4];
cx q[10], q[4];
cx q[12], q[5];
cx q[8], q[6];
cx q[9], q[6];

// Layer 4: Final mixing and measurement preparation
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
h q[12];

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
c[12] = measure q[12];