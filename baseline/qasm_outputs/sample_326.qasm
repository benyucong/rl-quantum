OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Layer 1 - Initialization and mixing
for i in [0:15] {
    h q[i];
}

// Layer 2 - Problem unitary (graph constraints)
// Node 0 constraints (connected to all others)
rz(0.7854) q[0];
rz(0.7854) q[4];
rz(0.7854) q[8];
rz(0.7854) q[12];
cx q[0], q[1];
rz(-0.7854) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(-0.7854) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(-0.7854) q[3];
cx q[0], q[3];

// Node 1 constraints
cx q[1], q[2];
rz(-0.7854) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(-0.7854) q[3];
cx q[1], q[3];

// Node 2 constraints
cx q[2], q[3];
rz(-0.7854) q[3];
cx q[2], q[3];

// Layer 3 - Mixing
for i in [0:15] {
    h q[i];
    rz(0.3927) q[i];
    h q[i];
}

// Layer 4 - Final phase separation
// Node 0 constraints
rz(1.5708) q[0];
rz(1.5708) q[4];
rz(1.5708) q[8];
rz(1.5708) q[12];
cx q[0], q[1];
rz(-1.5708) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(-1.5708) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(-1.5708) q[3];
cx q[0], q[3];

// Node 1 constraints
cx q[1], q[2];
rz(-1.5708) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(-1.5708) q[3];
cx q[1], q[3];

// Node 2 constraints
cx q[2], q[3];
rz(-1.5708) q[3];
cx q[2], q[3];

// Measurement
for i in [0:15] {
    c[i] = measure q[i];
}