OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply RZZ gates based on edge weights (normalized)
rz(0.6283) q[0];
rz(0.7854) q[1];
rz(1.0996) q[1];
rz(0.3142) q[2];
rz(1.2566) q[2];
rz(1.3357) q[2];
rz(0.7069) q[3];
rz(1.0210) q[3];
rz(0.8639) q[3];

// Apply controlled-phase gates for bipartite matching constraints
cp(1.5708) q[0], q[4];
cp(1.5708) q[1], q[5];
cp(1.5708) q[2], q[6];
cp(1.5708) q[3], q[7];

// Layer 2: Mixing and optimization
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
rz(0.3927) q[6];
rz(0.3927) q[7];

// Final mixing and measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];