OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1 - Initialization and mixing
for i in [0:12] {
    h q[i];
}

// Layer 2 - Problem Hamiltonian (weighted edges)
// Edge 0-5 (weight 6)
cx q[0], q[5];
rz(6 * 0.785) q[5];
cx q[0], q[5];
// Edge 0-8 (weight 18)
cx q[0], q[8];
rz(18 * 0.785) q[8];
cx q[0], q[8];
// Edge 1-6 (weight 6)
cx q[1], q[6];
rz(6 * 0.785) q[6];
cx q[1], q[6];
// Edge 2-7 (weight 5)
cx q[2], q[7];
rz(5 * 0.785) q[7];
cx q[2], q[7];
// Edge 2-12 (weight 19)
cx q[2], q[12];
rz(19 * 0.785) q[12];
cx q[2], q[12];
// Edge 3-8 (weight 7)
cx q[3], q[8];
rz(7 * 0.785) q[8];
cx q[3], q[8];
// Edge 3-5 (weight 13)
cx q[3], q[5];
rz(13 * 0.785) q[5];
cx q[3], q[5];
// Edge 4-9 (weight 1)
cx q[4], q[9];
rz(1 * 0.785) q[9];
cx q[4], q[9];
// Edge 4-5 (weight 14)
cx q[4], q[5];
rz(14 * 0.785) q[5];
cx q[4], q[5];
// Edge 4-8 (weight 12)
cx q[4], q[8];
rz(12 * 0.785) q[8];
cx q[4], q[8];

// Layer 3 - Final mixing and measurement
for i in [0:12] {
    h q[i];
    rz(0.785) q[i];
    h q[i];
}

// Measurement
for i in [0:12] {
    c[i] = measure q[i];
}