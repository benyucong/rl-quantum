OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1 - Initialization and mixing
for i in [0:4] {
    h q[i];
}
for i in [5:12] {
    h q[i];
}

// Layer 1 - Problem unitary (cost Hamiltonian)
// Edge 0-5 (weight 9)
cx q[0], q[5];
rz(9 * 0.7854) q[5];
cx q[0], q[5];

// Edge 0-12 (weight 12)
cx q[0], q[12];
rz(12 * 0.7854) q[12];
cx q[0], q[12];

// Edge 1-6 (weight 6)
cx q[1], q[6];
rz(6 * 0.7854) q[6];
cx q[1], q[6];

// Edge 1-11 (weight 18)
cx q[1], q[11];
rz(18 * 0.7854) q[11];
cx q[1], q[11];

// Edge 2-7 (weight 7)
cx q[2], q[7];
rz(7 * 0.7854) q[7];
cx q[2], q[7];

// Edge 2-10 (weight 11)
cx q[2], q[10];
rz(11 * 0.7854) q[10];
cx q[2], q[10];

// Edge 3-8 (weight 8)
cx q[3], q[8];
rz(8 * 0.7854) q[8];
cx q[3], q[8];

// Edge 4-9 (weight 8)
cx q[4], q[9];
rz(8 * 0.7854) q[9];
cx q[4], q[9];

// Edge 4-8 (weight 11)
cx q[4], q[8];
rz(11 * 0.7854) q[8];
cx q[4], q[8];

// Edge 4-6 (weight 17)
cx q[4], q[6];
rz(17 * 0.7854) q[6];
cx q[4], q[6];

// Layer 2 - Mixing
for i in [0:4] {
    h q[i];
    rz(0.7854) q[i];
    h q[i];
}
for i in [5:12] {
    h q[i];
    rz(0.7854) q[i];
    h q[i];
}

// Layer 2 - Problem unitary (cost Hamiltonian)
// Edge 0-5 (weight 9)
cx q[0], q[5];
rz(9 * 0.3927) q[5];
cx q[0], q[5];

// Edge 0-12 (weight 12)
cx q[0], q[12];
rz(12 * 0.3927) q[12];
cx q[0], q[12];

// Edge 1-6 (weight 6)
cx q[1], q[6];
rz(6 * 0.3927) q[6];
cx q[1], q[6];

// Edge 1-11 (weight 18)
cx q[1], q[11];
rz(18 * 0.3927) q[11];
cx q[1], q[11];

// Edge 2-7 (weight 7)
cx q[2], q[7];
rz(7 * 0.3927) q[7];
cx q[2], q[7];

// Edge 2-10 (weight 11)
cx q[2], q[10];
rz(11 * 0.3927) q[10];
cx q[2], q[10];

// Edge 3-8 (weight 8)
cx q[3], q[8];
rz(8 * 0.3927) q[8];
cx q[3], q[8];

// Edge 4-9 (weight 8)
cx q[4], q[9];
rz(8 * 0.3927) q[9];
cx q[4], q[9];

// Edge 4-8 (weight 11)
cx q[4], q[8];
rz(11 * 0.3927) q[8];
cx q[4], q[8];

// Edge 4-6 (weight 17)
cx q[4], q[6];
rz(17 * 0.3927) q[6];
cx q[4], q[6];

// Measurement
for i in [0:12] {
    c[i] = measure q[i];
}