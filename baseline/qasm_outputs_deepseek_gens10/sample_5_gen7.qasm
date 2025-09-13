OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

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

// Layer 2: Problem-specific phase encoding
// Edge (0,1) with weight 2
cx q[0], q[8];
rz(0.3927) q[8];
cx q[0], q[8];
cx q[1], q[8];
rz(0.3927) q[8];
cx q[1], q[8];

// Edge (0,3) with weight 12
cx q[0], q[8];
rz(2.3562) q[8];
cx q[0], q[8];
cx q[3], q[8];
rz(2.3562) q[8];
cx q[3], q[8];

// Edge (1,6) with weight 11
cx q[1], q[8];
rz(2.1598) q[8];
cx q[1], q[8];
cx q[6], q[8];
rz(2.1598) q[8];
cx q[6], q[8];

// Edge (1,4) with weight 13
cx q[1], q[8];
rz(2.5525) q[8];
cx q[1], q[8];
cx q[4], q[8];
rz(2.5525) q[8];
cx q[4], q[8];

// Edge (2,3) with weight 2
cx q[2], q[8];
rz(0.3927) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(0.3927) q[8];
cx q[3], q[8];

// Edge (2,7) with weight 16
cx q[2], q[8];
rz(3.1416) q[8];
cx q[2], q[8];
cx q[7], q[8];
rz(3.1416) q[8];
cx q[7], q[8];

// Edge (2,5) with weight 20
cx q[2], q[8];
rz(3.9270) q[8];
cx q[2], q[8];
cx q[5], q[8];
rz(3.9270) q[8];
cx q[5], q[8];

// Edge (4,5) with weight 1
cx q[4], q[8];
rz(0.1963) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(0.1963) q[8];
cx q[5], q[8];

// Edge (6,7) with weight 3
cx q[6], q[8];
rz(0.5890) q[8];
cx q[6], q[8];
cx q[7], q[8];
rz(0.5890) q[8];
cx q[7], q[8];

// Layer 3: Mixing and final Hadamard
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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