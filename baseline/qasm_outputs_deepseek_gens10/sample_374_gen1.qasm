OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge interactions with capacity-weighted angles
// Layer 1: Edge interactions
rz(0.7854) q[1];  // Edge 0-1 (capacity 2)
rz(2.3562) q[2];  // Edge 0-2 (capacity 6)
rz(1.5708) q[5];  // Edge 0-5 (capacity 4)
rz(1.5708) q[6];  // Edge 0-6 (capacity 4)
rz(1.1781) q[2];  // Edge 1-2 (capacity 3)
rz(1.1781) q[5];  // Edge 1-5 (capacity 3)
rz(1.5708) q[6];  // Edge 1-6 (capacity 4)
rz(0.7854) q[3];  // Edge 2-3 (capacity 2)
rz(0.7854) q[5];  // Edge 2-5 (capacity 2)
rz(0.3927) q[6];  // Edge 2-6 (capacity 1)
rz(1.5708) q[7];  // Edge 2-7 (capacity 4)
rz(1.9635) q[6];  // Edge 3-6 (capacity 5)
rz(1.1781) q[3];  // Edge 4-3 (capacity 3)
rz(2.3562) q[6];  // Edge 4-6 (capacity 6)
rz(0.3927) q[1];  // Edge 5-1 (capacity 1)
rz(0.7854) q[6];  // Edge 5-6 (capacity 2)
rz(0.3927) q[3];  // Edge 6-3 (capacity 1)
rz(0.3927) q[4];  // Edge 6-4 (capacity 1)

// Layer 2: Mixing and optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(1.0472) q[0];
rz(0.7854) q[1];
rz(1.3090) q[2];
rz(0.5236) q[3];
rz(0.3927) q[4];
rz(0.9163) q[5];
rz(1.1781) q[6];
rz(0.6545) q[7];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 3: Final optimization and measurement preparation
rz(0.8727) q[0];
rz(0.6545) q[1];
rz(0.9817) q[2];
rz(0.4363) q[3];
rz(0.3273) q[4];
rz(0.7636) q[5];
rz(0.8727) q[6];
rz(0.5455) q[7];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];