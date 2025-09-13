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

// Edge (0,1) with weight 4
cx q[0], q[1];
rz(0.8) q[1];
cx q[0], q[1];

// Edge (0,4) with weight 19
cx q[0], q[4];
rz(3.8) q[4];
cx q[0], q[4];

// Edge (1,3) with weight 18
cx q[1], q[3];
rz(3.6) q[3];
cx q[1], q[3];

// Edge (1,4) with weight 16
cx q[1], q[4];
rz(3.2) q[4];
cx q[1], q[4];

// Edge (1,5) with weight 11
cx q[1], q[5];
rz(2.2) q[5];
cx q[1], q[5];

// Edge (2,3) with weight 10
cx q[2], q[3];
rz(2.0) q[3];
cx q[2], q[3];

// Edge (2,6) with weight 18
cx q[2], q[6];
rz(3.6) q[6];
cx q[2], q[6];

// Edge (4,5) with weight 4
cx q[4], q[5];
rz(0.8) q[5];
cx q[4], q[5];

// Layer 2: Mixing and optimization
h q[0];
rz(1.2) q[0];
h q[0];
h q[1];
rz(1.5) q[1];
h q[1];
h q[2];
rz(1.1) q[2];
h q[2];
h q[3];
rz(1.4) q[3];
h q[3];
h q[4];
rz(1.6) q[4];
h q[4];
h q[5];
rz(1.3) q[5];
h q[5];
h q[6];
rz(1.0) q[6];
h q[6];
h q[7];
rz(0.9) q[7];
h q[7];

// Layer 3: Final optimization and measurement
h q[0];
rz(0.6) q[0];
h q[0];
h q[1];
rz(0.8) q[1];
h q[1];
h q[2];
rz(0.5) q[2];
h q[2];
h q[3];
rz(0.7) q[3];
h q[3];
h q[4];
rz(0.9) q[4];
h q[4];
h q[5];
rz(0.7) q[5];
h q[5];
h q[6];
rz(0.4) q[6];
h q[6];
h q[7];
rz(0.3) q[7];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];