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
rz(0.7854) q[0];  // Node 0 bias
rz(0.7854) q[1];  // Node 1 bias
rz(0.7854) q[2];  // Node 2 bias
rz(0.7854) q[3];  // Node 3 bias
rz(0.7854) q[4];  // Node 4 bias

// Edge interactions (ZZ rotations with optimal weights)
// Edge 0-5 (weight 1)
cx q[0], q[5];
rz(0.3927) q[5];
cx q[0], q[5];

// Edge 0-6 (weight 13)
cx q[0], q[6];
rz(0.3927) q[6];
cx q[0], q[6];

// Edge 0-9 (weight 14)
cx q[0], q[9];
rz(0.3927) q[9];
cx q[0], q[9];

// Edge 1-6 (weight 1)
cx q[1], q[6];
rz(0.3927) q[6];
cx q[1], q[6];

// Edge 2-7 (weight 5)
cx q[2], q[7];
rz(0.3927) q[7];
cx q[2], q[7];

// Edge 3-8 (weight 5)
cx q[3], q[8];
rz(0.3927) q[8];
cx q[3], q[8];

// Edge 3-5 (weight 12)
cx q[3], q[5];
rz(0.3927) q[5];
cx q[3], q[5];

// Edge 4-9 (weight 5)
cx q[4], q[9];
rz(0.3927) q[9];
cx q[4], q[9];

// Edge 4-7 (weight 17)
cx q[4], q[7];
rz(0.3927) q[7];
cx q[4], q[7];

// Edge 4-5 (weight 13)
cx q[4], q[5];
rz(0.3927) q[5];
cx q[4], q[5];

// Layer 3: Final mixing and measurement preparation
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