OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initialize superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];

// Apply phase separation based on edge capacities
// Layer 1: Edge interactions
rz(0.7854) q[0];  // π/4 for edge 0-4 (capacity 2)
rz(1.9635) q[0];  // 5π/8 for edge 0-6 (capacity 5)
rz(1.1781) q[1];  // 3π/8 for edge 1-2 (capacity 3)
rz(0.7854) q[1];  // π/4 for edge 1-6 (capacity 2)
rz(1.1781) q[2];  // 3π/8 for edge 2-4 (capacity 3)
rz(0.7854) q[3];  // π/4 for edge 3-5 (capacity 2)
rz(0.7854) q[3];  // π/4 for edge 3-9 (capacity 2)
rz(1.5708) q[4];  // π/2 for edge 4-5 (capacity 4)
rz(1.5708) q[4];  // π/2 for edge 4-7 (capacity 4)
rz(1.5708) q[5];  // π/2 for edge 5-1 (capacity 4)
rz(0.3927) q[5];  // π/8 for edge 5-8 (capacity 1)
rz(1.5708) q[6];  // π/2 for edge 6-2 (capacity 4)
rz(0.7854) q[6];  // π/4 for edge 6-3 (capacity 2)
rz(0.3927) q[6];  // π/8 for edge 6-5 (capacity 1)
rz(1.1781) q[6];  // 3π/8 for edge 6-8 (capacity 3)
rz(1.1781) q[7];  // 3π/8 for edge 7-1 (capacity 3)
rz(0.3927) q[7];  // π/8 for edge 7-3 (capacity 1)
rz(1.1781) q[7];  // 3π/8 for edge 7-5 (capacity 3)
rz(1.9635) q[8];  // 5π/8 for edge 8-2 (capacity 5)
rz(1.1781) q[8];  // 3π/8 for edge 8-7 (capacity 3)
rz(0.3927) q[8];  // π/8 for edge 8-9 (capacity 1)

// Mixer layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];

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
c[9] = measure q[9];