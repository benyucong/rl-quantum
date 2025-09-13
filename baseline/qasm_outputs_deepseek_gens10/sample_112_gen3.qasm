OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem unitary for vertex cover
// Edge (0,2)
cx q[0], q[2];
rz(0.314) q[2];
cx q[0], q[2];
// Edge (1,2)
cx q[1], q[2];
rz(0.412) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.285) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.367) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.398) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.229) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.451) q[4];
cx q[2], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.192) q[6];
cx q[5], q[6];

// Layer 1: Mixer unitary
rx(1.047) q[0];
rx(1.047) q[1];
rx(1.047) q[2];
rx(1.047) q[3];
rx(1.047) q[4];
rx(1.047) q[5];
rx(1.047) q[6];

// Layer 2: Problem unitary
cx q[0], q[2];
rz(0.628) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.824) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.570) q[3];
cx q[1], q[3];
cx q[1], q[5];
rz(0.734) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(0.796) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.458) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.902) q[4];
cx q[2], q[4];
cx q[5], q[6];
rz(0.384) q[6];
cx q[5], q[6];

// Layer 2: Mixer unitary
rx(2.094) q[0];
rx(2.094) q[1];
rx(2.094) q[2];
rx(2.094) q[3];
rx(2.094) q[4];
rx(2.094) q[5];
rx(2.094) q[6];

// Layer 3: Problem unitary
cx q[0], q[2];
rz(0.942) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(1.236) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.855) q[3];
cx q[1], q[3];
cx q[1], q[5];
rz(1.101) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(1.194) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.687) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(1.353) q[4];
cx q[2], q[4];
cx q[5], q[6];
rz(0.576) q[6];
cx q[5], q[6];

// Layer 3: Mixer unitary
rx(3.141) q[0];
rx(3.141) q[1];
rx(3.141) q[2];
rx(3.141) q[3];
rx(3.141) q[4];
rx(3.141) q[5];
rx(3.141) q[6];

// Layer 4: Problem unitary
cx q[0], q[2];
rz(1.256) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(1.648) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(1.140) q[3];
cx q[1], q[3];
cx q[1], q[5];
rz(1.468) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(1.592) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.916) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(1.804) q[4];
cx q[2], q[4];
cx q[5], q[6];
rz(0.768) q[6];
cx q[5], q[6];

// Layer 4: Mixer unitary
rx(4.188) q[0];
rx(4.188) q[1];
rx(4.188) q[2];
rx(4.188) q[3];
rx(4.188) q[4];
rx(4.188) q[5];
rx(4.188) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];