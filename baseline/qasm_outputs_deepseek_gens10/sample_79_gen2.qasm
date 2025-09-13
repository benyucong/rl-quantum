OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Problem-specific entangling gates with optimal parameters
// Edge (0,3) with weight 5
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];

// Edge (0,10) - mapped to (0,2) with weight 12
cx q[0], q[2];
rz(0.9425) q[2];
cx q[0], q[2];

// Edge (0,5) with weight 20
cx q[0], q[5];
rz(1.5708) q[5];
cx q[0], q[5];

// Edge (1,4) with weight 1
cx q[1], q[4];
rz(0.0785) q[4];
cx q[1], q[4];

// Edge (1,3) with weight 15
cx q[1], q[3];
rz(1.1781) q[3];
cx q[1], q[3];

// Edge (1,7) with weight 15
cx q[1], q[7];
rz(1.1781) q[7];
cx q[1], q[7];

// Edge (2,5) with weight 5
cx q[2], q[5];
rz(0.3927) q[5];
cx q[2], q[5];

// Edge (2,6) with weight 14
cx q[2], q[6];
rz(1.0996) q[6];
cx q[2], q[6];

// Layer 2: Mixer layer with optimal parameters
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];