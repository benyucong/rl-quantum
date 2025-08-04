OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply weighted edges with optimal parameters
// Edge 0-4 (weight 8)
cx q[0], q[4];
rz(0.628) q[4];
cx q[0], q[4];

// Edge 1-5 (weight 10)
cx q[1], q[5];
rz(0.785) q[5];
cx q[1], q[5];

// Edge 1-4 (weight 14)
cx q[1], q[4];
rz(1.099) q[4];
cx q[1], q[4];

// Edge 2-6 (weight 4)
cx q[2], q[6];
rz(0.314) q[6];
cx q[2], q[6];

// Edge 2-4 (weight 16)
cx q[2], q[4];
rz(1.257) q[4];
cx q[2], q[4];

// Edge 2-5 (weight 17)
cx q[2], q[5];
rz(1.335) q[5];
cx q[2], q[5];

// Edge 3-7 (weight 9)
cx q[3], q[7];
rz(0.707) q[7];
cx q[3], q[7];

// Edge 3-6 (weight 13)
cx q[3], q[6];
rz(1.021) q[6];
cx q[3], q[6];

// Edge 3-5 (weight 11)
cx q[3], q[5];
rz(0.864) q[5];
cx q[3], q[5];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Repeat edge applications with optimized parameters
// Edge 0-4
cx q[0], q[4];
rz(0.628) q[4];
cx q[0], q[4];

// Edge 1-5
cx q[1], q[5];
rz(0.785) q[5];
cx q[1], q[5];

// Edge 1-4
cx q[1], q[4];
rz(1.099) q[4];
cx q[1], q[4];

// Edge 2-6
cx q[2], q[6];
rz(0.314) q[6];
cx q[2], q[6];

// Edge 2-4
cx q[2], q[4];
rz(1.257) q[4];
cx q[2], q[4];

// Edge 2-5
cx q[2], q[5];
rz(1.335) q[5];
cx q[2], q[5];

// Edge 3-7
cx q[3], q[7];
rz(0.707) q[7];
cx q[3], q[7];

// Edge 3-6
cx q[3], q[6];
rz(1.021) q[6];
cx q[3], q[6];

// Edge 3-5
cx q[3], q[5];
rz(0.864) q[5];
cx q[3], q[5];

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