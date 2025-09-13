OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

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

// Layer 2: Problem-specific phase rotations
rz(0.7854) q[0];
rz(1.0210) q[1];
rz(1.1781) q[2];
rz(0.3927) q[3];
rz(0.5236) q[4];
rz(1.1781) q[5];
rz(1.9635) q[6];
rz(0.6981) q[7];
rz(0.0) q[8];

// Layer 3: Entangling operations for graph edges
// Edge 0-1 (weight 10)
cx q[0], q[1];
rz(0.3142) q[1];
cx q[0], q[1];

// Edge 0-6 (weight 13)
cx q[0], q[6];
rz(0.4084) q[6];
cx q[0], q[6];

// Edge 0-5 (weight 15)
cx q[0], q[5];
rz(0.4712) q[5];
cx q[0], q[5];

// Edge 1-2 (weight 15)
cx q[1], q[2];
rz(0.4712) q[2];
cx q[1], q[2];

// Edge 2-3 (weight 5)
cx q[2], q[3];
rz(0.1571) q[3];
cx q[2], q[3];

// Edge 2-7 (weight 18)
cx q[2], q[7];
rz(0.5655) q[7];
cx q[2], q[7];

// Edge 4-5 (weight 3)
cx q[4], q[5];
rz(0.0942) q[5];
cx q[4], q[5];

// Edge 4-7 (weight 11)
cx q[4], q[7];
rz(0.3456) q[7];
cx q[4], q[7];

// Edge 6-7 (weight 4)
cx q[6], q[7];
rz(0.1257) q[7];
cx q[6], q[7];

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