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

// Apply weighted edges with optimal parameters
// Edge 0-3 (weight 2)
rz(0.314) q[0];
rz(0.314) q[3];
cx q[0], q[3];
rz(-0.157) q[3];
cx q[0], q[3];

// Edge 0-6 (weight 20)
rz(3.142) q[0];
rz(3.142) q[6];
cx q[0], q[6];
rz(-1.571) q[6];
cx q[0], q[6];

// Edge 1-4 (weight 5)
rz(0.785) q[1];
rz(0.785) q[4];
cx q[1], q[4];
rz(-0.393) q[4];
cx q[1], q[4];

// Edge 1-6 (weight 20)
rz(3.142) q[1];
rz(3.142) q[6];
cx q[1], q[6];
rz(-1.571) q[6];
cx q[1], q[6];

// Edge 1-3 (weight 12)
rz(1.885) q[1];
rz(1.885) q[3];
cx q[1], q[3];
rz(-0.942) q[3];
cx q[1], q[3];

// Edge 2-5 (weight 2)
rz(0.314) q[2];
rz(0.314) q[5];
cx q[2], q[5];
rz(-0.157) q[5];
cx q[2], q[5];

// Edge 2-3 (weight 11)
rz(1.727) q[2];
rz(1.727) q[3];
cx q[2], q[3];
rz(-0.864) q[3];
cx q[2], q[3];

// Edge 2-4 (weight 13)
rz(2.042) q[2];
rz(2.042) q[4];
cx q[2], q[4];
rz(-1.021) q[4];
cx q[2], q[4];

// Layer 2: Mixing and optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Final optimization rotations
rx(0.942) q[0];
rx(1.256) q[1];
rx(0.628) q[2];
rx(0.785) q[3];
rx(0.471) q[4];
rx(0.314) q[5];
rx(1.571) q[6];
rx(0.393) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];