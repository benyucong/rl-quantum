OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1 - Initialization and mixing
for i in [0:11] {
    h q[i];
}

// Layer 2 - Problem Hamiltonian with optimal parameters
// Edges with highest weights get stronger phase separation
// Edge 0-9 (weight 18)
cx q[0], q[9];
rz(0.36) q[9];
cx q[0], q[9];
// Edge 2-8 (weight 18)
cx q[2], q[8];
rz(0.36) q[8];
cx q[2], q[8];
// Edge 5-8 (weight 19)
cx q[5], q[8];
rz(0.38) q[8];
cx q[5], q[8];
// Edge 5-7 (weight 19)
cx q[5], q[7];
rz(0.38) q[7];
cx q[5], q[7];
// Edge 4-11 (weight 7)
cx q[4], q[11];
rz(0.14) q[11];
cx q[4], q[11];
// Edge 3-10 (weight 10)
cx q[3], q[10];
rz(0.20) q[10];
cx q[3], q[10];

// Layer 3 - Final mixing and measurement
for i in [0:11] {
    h q[i];
    rz(0.1) q[i];
    h q[i];
}

// Measurement
for i in [0:11] {
    c[i] = measure q[i];
}