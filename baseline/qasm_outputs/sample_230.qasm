OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1 - Initialization and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1 - Problem unitary (cost function)
// Edge 0-3 (weight 4)
cx q[0], q[3];
rz(0.08) q[3];
cx q[0], q[3];
// Edge 0-4 (weight 19)
cx q[0], q[4];
rz(0.38) q[4];
cx q[0], q[4];
// Edge 0-6 (weight 20)
cx q[0], q[6];
rz(0.40) q[6];
cx q[0], q[6];
// Edge 0-7 (weight 14)
cx q[0], q[7];
rz(0.28) q[7];
cx q[0], q[7];
// Edge 1-4 (weight 2)
cx q[1], q[4];
rz(0.04) q[4];
cx q[1], q[4];
// Edge 1-3 (weight 11)
cx q[1], q[3];
rz(0.22) q[3];
cx q[1], q[3];
// Edge 1-6 (weight 13)
cx q[1], q[6];
rz(0.26) q[6];
cx q[1], q[6];
// Edge 2-5 (weight 3)
cx q[2], q[5];
rz(0.06) q[5];
cx q[2], q[5];

// Layer 2 - Mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2 - Problem unitary (cost function)
// Edge 0-3 (weight 4)
cx q[0], q[3];
rz(0.08) q[3];
cx q[0], q[3];
// Edge 0-4 (weight 19)
cx q[0], q[4];
rz(0.38) q[4];
cx q[0], q[4];
// Edge 0-6 (weight 20)
cx q[0], q[6];
rz(0.40) q[6];
cx q[0], q[6];
// Edge 0-7 (weight 14)
cx q[0], q[7];
rz(0.28) q[7];
cx q[0], q[7];
// Edge 1-4 (weight 2)
cx q[1], q[4];
rz(0.04) q[4];
cx q[1], q[4];
// Edge 1-3 (weight 11)
cx q[1], q[3];
rz(0.22) q[3];
cx q[1], q[3];
// Edge 1-6 (weight 13)
cx q[1], q[6];
rz(0.26) q[6];
cx q[1], q[6];
// Edge 2-5 (weight 3)
cx q[2], q[5];
rz(0.06) q[5];
cx q[2], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];