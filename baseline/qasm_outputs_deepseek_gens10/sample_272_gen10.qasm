OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,4) with weight 2
rz(0.3927) q[0];
rz(0.3927) q[4];
cx q[0], q[4];
rz(-0.3927) q[4];
cx q[0], q[4];

// Edge (0,6) with weight 13
rz(2.5525) q[0];
rz(2.5525) q[6];
cx q[0], q[6];
rz(-2.5525) q[6];
cx q[0], q[6];

// Edge (1,5) with weight 1
rz(0.1963) q[1];
rz(0.1963) q[5];
cx q[1], q[5];
rz(-0.1963) q[5];
cx q[1], q[5];

// Edge (1,8) with weight 17
rz(3.3379) q[1];
rz(3.3379) q[8];
cx q[1], q[8];
rz(-3.3379) q[8];
cx q[1], q[8];

// Edge (2,6) with weight 8
rz(1.5708) q[2];
rz(1.5708) q[6];
cx q[2], q[6];
rz(-1.5708) q[6];
cx q[2], q[6];

// Edge (2,7) with weight 12
rz(2.3562) q[2];
rz(2.3562) q[7];
cx q[2], q[7];
rz(-2.3562) q[7];
cx q[2], q[7];

// Edge (2,4) with weight 12
rz(2.3562) q[2];
rz(2.3562) q[4];
cx q[2], q[4];
rz(-2.3562) q[4];
cx q[2], q[4];

// Edge (3,7) with weight 10
rz(1.9635) q[3];
rz(1.9635) q[7];
cx q[3], q[7];
rz(-1.9635) q[7];
cx q[3], q[7];

// Edge (3,6) with weight 15
rz(2.9452) q[3];
rz(2.9452) q[6];
cx q[3], q[6];
rz(-2.9452) q[6];
cx q[3], q[6];

// Layer 3: Final mixing and measurement preparation
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