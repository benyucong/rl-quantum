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
h q[8];

// Edge cost phase encoding
rz(0.125) q[0];  // Edge (0,1) weight 8
rz(0.0625) q[1]; // Edge (0,3) weight 16
rz(0.0625) q[2]; // Edge (0,5) weight 16
rz(0.05) q[3];   // Edge (1,6) weight 20
rz(0.1111) q[4]; // Edge (2,3) weight 9
rz(0.3333) q[5]; // Edge (4,5) weight 3
rz(0.0588) q[6]; // Edge (4,6) weight 17
rz(0.05) q[7];   // Edge (5,7) weight 20
rz(1.0) q[8];    // Edge (6,7) weight 1

// Layer 2: Mixing and constraint enforcement
// Mixing operations
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];
rx(0.7854) q[8];

// Constraint: perfect matching (each vertex appears exactly once)
// Vertex 0 constraint
cx q[0], q[1];
cx q[0], q[2];
rz(0.5236) q[1];
rz(0.5236) q[2];
cx q[0], q[2];
cx q[0], q[1];

// Vertex 1 constraint
cx q[0], q[3];
rz(0.5236) q[3];
cx q[0], q[3];

// Vertex 2 constraint
cx q[4], q[8];
rz(0.5236) q[8];
cx q[4], q[8];

// Vertex 3 constraint
cx q[1], q[4];
rz(0.5236) q[4];
cx q[1], q[4];

// Vertex 4 constraint
cx q[5], q[6];
rz(0.5236) q[6];
cx q[5], q[6];

// Vertex 5 constraint
cx q[2], q[5];
cx q[2], q[7];
rz(0.5236) q[5];
rz(0.5236) q[7];
cx q[2], q[7];
cx q[2], q[5];

// Vertex 6 constraint
cx q[3], q[6];
cx q[3], q[8];
rz(0.5236) q[6];
rz(0.5236) q[8];
cx q[3], q[8];
cx q[3], q[6];

// Vertex 7 constraint
cx q[7], q[8];
rz(0.5236) q[8];
cx q[7], q[8];

// Layer 3: Final optimization and measurement
// Final cost optimization
rz(0.2) q[0];
rz(0.1) q[1];
rz(0.1) q[2];
rz(0.08) q[3];
rz(0.2222) q[4];
rz(0.6667) q[5];
rz(0.1176) q[6];
rz(0.08) q[7];
rz(1.6) q[8];

// Final mixing
rx(0.3927) q[0];
rx(0.3927) q[1];
rx(0.3927) q[2];
rx(0.3927) q[3];
rx(0.3927) q[4];
rx(0.3927) q[5];
rx(0.3927) q[6];
rx(0.3927) q[7];
rx(0.3927) q[8];

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