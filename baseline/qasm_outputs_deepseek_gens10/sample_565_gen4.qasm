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
rz(0.7854) q[0];  // Weight 4
rz(2.7489) q[0];  // Weight 14
rz(0.7854) q[1];  // Weight 4
rz(2.7489) q[1];  // Weight 14
rz(0.7854) q[2];  // Weight 4
rz(2.5835) q[2];  // Weight 13
rz(0.7854) q[3];  // Weight 4
rz(2.1598) q[3];  // Weight 11
rz(1.3744) q[4];  // Weight 7
rz(2.9452) q[4];  // Weight 15

// Layer 3: Entangling operations for bipartite matching constraints
// Left node constraints (each left node can match at most one right node)
cx q[0], q[5];
rz(-0.5236) q[5];
cx q[0], q[5];
cx q[0], q[10];
rz(-0.5236) q[10];
cx q[0], q[10];

cx q[1], q[6];
rz(-0.5236) q[6];
cx q[1], q[6];
cx q[1], q[5];
rz(-0.5236) q[5];
cx q[1], q[5];

cx q[2], q[7];
rz(-0.5236) q[7];
cx q[2], q[7];
cx q[2], q[10];
rz(-0.5236) q[10];
cx q[2], q[10];

cx q[3], q[8];
rz(-0.5236) q[8];
cx q[3], q[8];
cx q[3], q[10];
rz(-0.5236) q[10];
cx q[3], q[10];

cx q[4], q[9];
rz(-0.5236) q[9];
cx q[4], q[9];
cx q[4], q[5];
rz(-0.5236) q[5];
cx q[4], q[5];

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