OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;
// Initialize all qubits to |0>
// Apply Hadamard to left nodes to create superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Apply controlled-phase gates based on edge weights
// Edge (0,7) with weight 4
cp(0.3927) q[0], q[7];
// Edge (0,9) with weight 19
cp(1.865) q[0], q[9];
// Edge (0,12) with weight 17
cp(1.669) q[0], q[12];
// Edge (1,8) with weight 6
cp(0.5890) q[1], q[8];
// Edge (2,9) with weight 5
cp(0.4909) q[2], q[9];
// Edge (2,12) with weight 12
cp(1.1781) q[2], q[12];
// Edge (3,10) with weight 7
cp(0.6872) q[3], q[10];
// Edge (4,11) with weight 2
cp(0.1963) q[4], q[11];
// Edge (4,7) with weight 15
cp(1.4726) q[4], q[7];
// Edge (5,12) with weight 4
cp(0.3927) q[5], q[12];
// Edge (6,13) with weight 9
cp(0.8836) q[6], q[13];
// Edge (6,9) with weight 15
cp(1.4726) q[6], q[9];
// Apply Hadamard to left nodes again
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
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