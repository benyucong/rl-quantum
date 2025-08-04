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

// Layer 1 - Problem unitary (max bipartite matching)
// Edge 0-3 (weight 5)
cx q[0], q[3];
rz(0.3927) q[3];  // ~5/40 * pi
cx q[0], q[3];

// Edge 0-10 (weight 12) - mapped to q[4]
cx q[0], q[4];
rz(0.9425) q[4];  // ~12/40 * pi
cx q[0], q[4];

// Edge 0-5 (weight 20) - mapped to q[5]
cx q[0], q[5];
rz(1.5708) q[5];  // ~20/40 * pi
cx q[0], q[5];

// Edge 1-4 (weight 1)
cx q[1], q[4];
rz(0.0785) q[4];  // ~1/40 * pi
cx q[1], q[4];

// Edge 1-3 (weight 15)
cx q[1], q[3];
rz(1.1781) q[3];  // ~15/40 * pi
cx q[1], q[3];

// Edge 1-7 (weight 15) - mapped to q[7]
cx q[1], q[7];
rz(1.1781) q[7];  // ~15/40 * pi
cx q[1], q[7];

// Edge 2-5 (weight 5)
cx q[2], q[5];
rz(0.3927) q[5];  // ~5/40 * pi
cx q[2], q[5];

// Edge 2-6 (weight 14) - mapped to q[6]
cx q[2], q[6];
rz(1.0996) q[6];  // ~14/40 * pi
cx q[2], q[6];

// Layer 2 - Mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2 - Problem unitary (repeated with optimized angles)
// Edge 0-3
cx q[0], q[3];
rz(0.7854) q[3];  // Increased mixing
cx q[0], q[3];

// Edge 0-10
cx q[0], q[4];
rz(1.5708) q[4];
cx q[0], q[4];

// Edge 0-5
cx q[0], q[5];
rz(2.3562) q[5];
cx q[0], q[5];

// Edge 1-4
cx q[1], q[4];
rz(0.1571) q[4];
cx q[1], q[4];

// Edge 1-3
cx q[1], q[3];
rz(2.3562) q[3];
cx q[1], q[3];

// Edge 1-7
cx q[1], q[7];
rz(2.3562) q[7];
cx q[1], q[7];

// Edge 2-5
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(2.1991) q[6];
cx q[2], q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];