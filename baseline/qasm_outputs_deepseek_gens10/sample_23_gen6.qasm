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

// Encode edge weights with RZ gates
rz(0.7854) q[0];  // Edge 0-4 (weight 8)
rz(0.9817) q[1];  // Edge 1-5 (weight 10)
rz(1.3734) q[1];  // Edge 1-4 (weight 14)
rz(0.3927) q[2];  // Edge 2-6 (weight 4)
rz(1.5708) q[2];  // Edge 2-4 (weight 16)
rz(1.7017) q[2];  // Edge 2-5 (weight 17)
rz(0.8836) q[3];  // Edge 3-7 (weight 9)
rz(1.2763) q[3];  // Edge 3-6 (weight 13)
rz(1.0996) q[3];  // Edge 3-5 (weight 11)

// Entangling operations for bipartite matching
cx q[0], q[4];
cx q[1], q[5];
cx q[1], q[4];
cx q[2], q[6];
cx q[2], q[4];
cx q[2], q[5];
cx q[3], q[7];
cx q[3], q[6];
cx q[3], q[5];

// Layer 2: Mixing and optimization
rz(0.5236) q[0];
rz(0.6545) q[1];
rz(0.7854) q[2];
rz(0.6109) q[3];
rz(0.4363) q[4];
rz(0.6981) q[5];
rz(0.6109) q[6];
rz(0.3491) q[7];

// Final Hadamard for measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

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