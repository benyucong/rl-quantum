OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Initial Hadamard gates
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
h q[12];

// Layer 1: Problem-specific entangling gates with optimal parameters
// Edge (0,1)
cx q[0], q[7];
rz(0.2147) q[7];
cx q[0], q[7];
// Edge (0,3)
cx q[0], q[8];
rz(0.1983) q[8];
cx q[0], q[8];
// Edge (0,4)
cx q[0], q[9];
rz(0.2251) q[9];
cx q[0], q[9];
// Edge (1,3)
cx q[1], q[10];
rz(0.1928) q[10];
cx q[1], q[10];
// Edge (1,4)
cx q[1], q[11];
rz(0.2196) q[11];
cx q[1], q[11];
// Edge (1,6)
cx q[1], q[12];
rz(0.2432) q[12];
cx q[1], q[12];
// Edge (2,3)
cx q[2], q[8];
rz(0.1854) q[8];
cx q[2], q[8];
// Edge (2,5)
cx q[2], q[9];
rz(0.2319) q[9];
cx q[2], q[9];
// Edge (2,6)
cx q[2], q[12];
rz(0.2387) q[12];
cx q[2], q[12];
// Edge (3,5)
cx q[3], q[9];
rz(0.2284) q[9];
cx q[3], q[9];
// Edge (3,6)
cx q[3], q[12];
rz(0.2352) q[12];
cx q[3], q[12];
// Edge (4,5)
cx q[4], q[9];
rz(0.2346) q[9];
cx q[4], q[9];
// Edge (5,6)
cx q[5], q[12];
rz(0.2418) q[12];
cx q[5], q[12];

// Layer 2: Mixer layer
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];
rx(1.0472) q[8];
rx(1.0472) q[9];
rx(1.0472) q[10];
rx(1.0472) q[11];
rx(1.0472) q[12];

// Layer 3: Second problem layer with optimized parameters
// Edge (0,1)
cx q[0], q[7];
rz(0.3218) q[7];
cx q[0], q[7];
// Edge (0,3)
cx q[0], q[8];
rz(0.2974) q[8];
cx q[0], q[8];
// Edge (0,4)
cx q[0], q[9];
rz(0.3376) q[9];
cx q[0], q[9];
// Edge (1,3)
cx q[1], q[10];
rz(0.2892) q[10];
cx q[1], q[10];
// Edge (1,4)
cx q[1], q[11];
rz(0.3294) q[11];
cx q[1], q[11];
// Edge (1,6)
cx q[1], q[12];
rz(0.3648) q[12];
cx q[1], q[12];
// Edge (2,3)
cx q[2], q[8];
rz(0.2781) q[8];
cx q[2], q[8];
// Edge (2,5)
cx q[2], q[9];
rz(0.3478) q[9];
cx q[2], q[9];
// Edge (2,6)
cx q[2], q[12];
rz(0.3580) q[12];
cx q[2], q[12];
// Edge (3,5)
cx q[3], q[9];
rz(0.3426) q[9];
cx q[3], q[9];
// Edge (3,6)
cx q[3], q[12];
rz(0.3528) q[12];
cx q[3], q[12];
// Edge (4,5)
cx q[4], q[9];
rz(0.3519) q[9];
cx q[4], q[9];
// Edge (5,6)
cx q[5], q[12];
rz(0.3627) q[12];
cx q[5], q[12];

// Layer 4: Final mixer layer
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
rx(0.7854) q[12];

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
c[11] = measure q[11];
c[12] = measure q[12];