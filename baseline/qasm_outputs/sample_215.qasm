OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1 - Initialization and mixing
for i in [0:11] {
    h q[i];
}

// Layer 2 - Problem unitary (graph coloring constraints)
// Edge 1-2 constraint
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];

// Edge 1-3 constraint
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];
cx q[2], q[8];
rz(0.7854) q[8];
cx q[2], q[8];

// Edge 2-3 constraint
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];
cx q[2], q[7];
rz(0.7854) q[7];
cx q[2], q[7];

// Edge 0-3 constraint
cx q[9], q[6];
rz(0.7854) q[6];
cx q[9], q[6];
cx q[3], q[11];
rz(0.7854) q[11];
cx q[3], q[11];

// Layer 3 - Mixing
for i in [0:11] {
    h q[i];
    rz(0.5236) q[i];
    h q[i];
}

// Layer 4 - Final problem unitary
// Edge 1-2 constraint
cx q[0], q[3];
rz(1.5708) q[3];
cx q[0], q[3];
cx q[1], q[4];
rz(1.5708) q[4];
cx q[1], q[4];

// Edge 1-3 constraint
cx q[0], q[6];
rz(1.5708) q[6];
cx q[0], q[6];
cx q[2], q[8];
rz(1.5708) q[8];
cx q[2], q[8];

// Edge 2-3 constraint
cx q[1], q[6];
rz(1.5708) q[6];
cx q[1], q[6];
cx q[2], q[7];
rz(1.5708) q[7];
cx q[2], q[7];

// Edge 0-3 constraint
cx q[9], q[6];
rz(1.5708) q[6];
cx q[9], q[6];
cx q[3], q[11];
rz(1.5708) q[11];
cx q[3], q[11];

// Measurement
for i in [0:11] {
    c[i] = measure q[i];
}