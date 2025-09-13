OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;
// Initialize all qubits to |0>
// Apply Hadamard to left nodes to create superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Apply controlled rotations based on edge weights
// Edge (0,9) weight=2
crz(0.3927) q[0], q[9];
// Edge (1,10) weight=5
crz(0.9817) q[1], q[10];
// Edge (1,13) weight=15
crz(2.9452) q[1], q[13];
// Edge (2,11) weight=8
crz(1.5708) q[2], q[11];
// Edge (3,12) weight=6
crz(1.1781) q[3], q[12];
// Edge (4,13) weight=7
crz(1.3744) q[4], q[13];
// Edge (4,9) weight=16
crz(3.1416) q[4], q[9];
// Edge (7,9) weight=12
crz(2.3562) q[7], q[9];
// Edge (7,13) weight=16
crz(3.1416) q[7], q[13];
// Edge (8,12) weight=14
crz(2.7489) q[8], q[12];
// Measure all qubits
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
c[13] = measure q[13];