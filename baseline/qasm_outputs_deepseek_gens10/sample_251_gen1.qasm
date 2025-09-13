OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard on all qubits
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

// Layer 2: Problem-specific phase encoding with optimal parameters
// Edge (0,5) weight 2
rz(0.3927) q[0];
rz(0.3927) q[5];
cx q[0], q[5];
rz(-0.3927) q[5];
cx q[0], q[5];

// Edge (1,6) weight 9
rz(1.7671) q[1];
rz(1.7671) q[6];
cx q[1], q[6];
rz(-1.7671) q[6];
cx q[1], q[6];

// Edge (1,9) weight 14
rz(2.7489) q[1];
rz(2.7489) q[9];
cx q[1], q[9];
rz(-2.7489) q[9];
cx q[1], q[9];

// Edge (1,8) weight 14
rz(2.7489) q[1];
rz(2.7489) q[8];
cx q[1], q[8];
rz(-2.7489) q[8];
cx q[1], q[8];

// Edge (2,7) weight 2
rz(0.3927) q[2];
rz(0.3927) q[7];
cx q[2], q[7];
rz(-0.3927) q[7];
cx q[2], q[7];

// Edge (2,10) weight 14
rz(2.7489) q[2];
rz(2.7489) q[10];
cx q[2], q[10];
rz(-2.7489) q[10];
cx q[2], q[10];

// Edge (3,8) weight 1
rz(0.1963) q[3];
rz(0.1963) q[8];
cx q[3], q[8];
rz(-0.1963) q[8];
cx q[3], q[8];

// Edge (4,9) weight 9
rz(1.7671) q[4];
rz(1.7671) q[9];
cx q[4], q[9];
rz(-1.7671) q[9];
cx q[4], q[9];

// Edge (4,5) weight 18
rz(3.5343) q[4];
rz(3.5343) q[5];
cx q[4], q[5];
rz(-3.5343) q[5];
cx q[4], q[5];

// Edge (4,7) weight 13
rz(2.5535) q[4];
rz(2.5535) q[7];
cx q[4], q[7];
rz(-2.5535) q[7];
cx q[4], q[7];

// Layer 3: Mixing layer with optimal parameters
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

// Layer 4: Final optimization layer
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];
rz(0.7854) q[9];
rz(0.7854) q[10];

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
c[10] = measure q[10];