OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initial Hadamard and parameterized rotations
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
h q[10];
h q[11];
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];
rx(0.7854) q[8];
rx(0.7854) q[9];
rx(0.7854) q[10];
rx(0.7854) q[11];

// Layer 2: Edge interactions (weighted ZZ rotations)
// Edge 0-8 (weight 5)
cx q[0], q[8];
rz(0.1563) q[8];
cx q[0], q[8];

// Edge 0-12 (weight 16)
cx q[0], q[4];
rz(0.5000) q[4];
cx q[0], q[4];

// Edge 1-9 (weight 6)
cx q[1], q[9];
rz(0.1875) q[9];
cx q[1], q[9];

// Edge 2-10 (weight 6)
cx q[2], q[10];
rz(0.1875) q[10];
cx q[2], q[10];

// Edge 3-11 (weight 7)
cx q[3], q[11];
rz(0.2188) q[11];
cx q[3], q[11];

// Edge 3-14 (weight 20)
cx q[3], q[7];
rz(0.6250) q[7];
cx q[3], q[7];

// Edge 3-12 (weight 18)
cx q[3], q[4];
rz(0.5625) q[4];
cx q[3], q[4];

// Edge 4-12 (weight 5)
cx q[4], q[4];
rz(0.1563) q[4];
cx q[4], q[4];

// Edge 5-13 (weight 4)
cx q[5], q[5];
rz(0.1250) q[5];
cx q[5], q[5];

// Edge 5-10 (weight 17)
cx q[5], q[10];
rz(0.5313) q[10];
cx q[5], q[10];

// Edge 6-14 (weight 8)
cx q[6], q[7];
rz(0.2500) q[7];
cx q[6], q[7];

// Edge 7-9 (weight 20)
cx q[7], q[9];
rz(0.6250) q[9];
cx q[7], q[9];

// Layer 3: Mixing layer (RX rotations)
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];
rx(1.5708) q[9];
rx(1.5708) q[10];
rx(1.5708) q[11];

// Layer 4: Final parameterized rotations and measurements
rx(0.3927) q[0];
rx(0.3927) q[1];
rx(0.3927) q[2];
rx(0.3927) q[3];
rx(0.3927) q[4];
rx(0.3927) q[5];
rx(0.3927) q[6];
rx(0.3927) q[7];
rx(0.3927) q[8];
rx(0.3927) q[9];
rx(0.3927) q[10];
rx(0.3927) q[11];

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
c[10] = measure q[10];
c[11] = measure q[11];