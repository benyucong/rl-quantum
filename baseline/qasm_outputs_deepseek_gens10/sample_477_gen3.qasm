OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

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

// Layer 1: Problem-specific phase separation
// Edge (0,1) with weight 10
cx q[0], q[1];
rz(0.6283) q[1];
cx q[0], q[1];

// Edge (0,7) with weight 12
cx q[0], q[7];
rz(0.7540) q[7];
cx q[0], q[7];

// Edge (2,3) with weight 10
cx q[2], q[3];
rz(0.6283) q[3];
cx q[2], q[3];

// Edge (2,6) with weight 13
cx q[2], q[6];
rz(0.8168) q[6];
cx q[2], q[6];

// Edge (2,4) with weight 13
cx q[2], q[4];
rz(0.8168) q[4];
cx q[2], q[4];

// Edge (4,5) with weight 1
cx q[4], q[5];
rz(0.0628) q[5];
cx q[4], q[5];

// Edge (5,7) with weight 17
cx q[5], q[7];
rz(1.0681) q[7];
cx q[5], q[7];

// Edge (6,7) with weight 7
cx q[6], q[7];
rz(0.4398) q[7];
cx q[6], q[7];

// Edge (6,8) with weight 19
cx q[6], q[8];
rz(1.1940) q[8];
cx q[6], q[8];

// Layer 2: Mixing layer
rx(1.2566) q[0];
rx(1.2566) q[1];
rx(1.2566) q[2];
rx(1.2566) q[3];
rx(1.2566) q[4];
rx(1.2566) q[5];
rx(1.2566) q[6];
rx(1.2566) q[7];
rx(1.2566) q[8];

// Layer 2: Problem-specific phase separation
// Edge (0,1) with weight 10
cx q[0], q[1];
rz(0.6283) q[1];
cx q[0], q[1];

// Edge (0,7) with weight 12
cx q[0], q[7];
rz(0.7540) q[7];
cx q[0], q[7];

// Edge (2,3) with weight 10
cx q[2], q[3];
rz(0.6283) q[3];
cx q[2], q[3];

// Edge (2,6) with weight 13
cx q[2], q[6];
rz(0.8168) q[6];
cx q[2], q[6];

// Edge (2,4) with weight 13
cx q[2], q[4];
rz(0.8168) q[4];
cx q[2], q[4];

// Edge (4,5) with weight 1
cx q[4], q[5];
rz(0.0628) q[5];
cx q[4], q[5];

// Edge (5,7) with weight 17
cx q[5], q[7];
rz(1.0681) q[7];
cx q[5], q[7];

// Edge (6,7) with weight 7
cx q[6], q[7];
rz(0.4398) q[7];
cx q[6], q[7];

// Edge (6,8) with weight 19
cx q[6], q[8];
rz(1.1940) q[8];
cx q[6], q[8];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];