OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Problem unitary (edges)
// Edge (0,1)
cx q[0], q[1];
rz(0.214) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.198) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.205) q[4];
cx q[0], q[4];
// Edge (1,3)
cx q[1], q[3];
rz(0.192) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.207) q[4];
cx q[1], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.221) q[2];
cx q[1], q[2];
// Edge (2,5)
cx q[2], q[5];
rz(0.235) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.189) q[4];
cx q[3], q[4];

// Layer 1: Mixer unitary
rx(1.482) q[0];
rx(1.476) q[1];
rx(1.491) q[2];
rx(1.468) q[3];
rx(1.474) q[4];
rx(1.503) q[5];

// Layer 2: Problem unitary (edges)
// Edge (0,1)
cx q[0], q[1];
rz(0.328) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.312) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.319) q[4];
cx q[0], q[4];
// Edge (1,3)
cx q[1], q[3];
rz(0.306) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.321) q[4];
cx q[1], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.335) q[2];
cx q[1], q[2];
// Edge (2,5)
cx q[2], q[5];
rz(0.349) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.303) q[4];
cx q[3], q[4];

// Layer 2: Mixer unitary
rx(1.326) q[0];
rx(1.320) q[1];
rx(1.335) q[2];
rx(1.312) q[3];
rx(1.318) q[4];
rx(1.347) q[5];

// Layer 3: Problem unitary (edges)
// Edge (0,1)
cx q[0], q[1];
rz(0.442) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.426) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.433) q[4];
cx q[0], q[4];
// Edge (1,3)
cx q[1], q[3];
rz(0.420) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.435) q[4];
cx q[1], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.449) q[2];
cx q[1], q[2];
// Edge (2,5)
cx q[2], q[5];
rz(0.463) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.417) q[4];
cx q[3], q[4];

// Layer 3: Mixer unitary
rx(1.170) q[0];
rx(1.164) q[1];
rx(1.179) q[2];
rx(1.156) q[3];
rx(1.162) q[4];
rx(1.191) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];