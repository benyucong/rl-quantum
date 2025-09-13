OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard on all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Problem-specific phase encoding
// Edge (0,1) weight 3
cx q[0], q[7];
rz(0.6) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.6) q[7];
cx q[1], q[7];

// Edge (0,3) weight 15
cx q[0], q[7];
rz(3.0) q[7];
cx q[0], q[7];
cx q[3], q[7];
rz(3.0) q[7];
cx q[3], q[7];

// Edge (1,3) weight 15
cx q[1], q[7];
rz(3.0) q[7];
cx q[1], q[7];
cx q[3], q[7];
rz(3.0) q[7];
cx q[3], q[7];

// Edge (2,3) weight 1
cx q[2], q[7];
rz(0.2) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.2) q[7];
cx q[3], q[7];

// Edge (2,4) weight 11
cx q[2], q[7];
rz(2.2) q[7];
cx q[2], q[7];
cx q[4], q[7];
rz(2.2) q[7];
cx q[4], q[7];

// Edge (3,5) weight 20
cx q[3], q[7];
rz(4.0) q[7];
cx q[3], q[7];
cx q[5], q[7];
rz(4.0) q[7];
cx q[5], q[7];

// Edge (4,5) weight 6
cx q[4], q[7];
rz(1.2) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(1.2) q[7];
cx q[5], q[7];

// Edge (5,6) weight 16
cx q[5], q[7];
rz(3.2) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(3.2) q[7];
cx q[6], q[7];

// Layer 3: Mixing layer
h q[0];
rz(0.8) q[0];
h q[0];
h q[1];
rz(0.8) q[1];
h q[1];
h q[2];
rz(0.8) q[2];
h q[2];
h q[3];
rz(0.8) q[3];
h q[3];
h q[4];
rz(0.8) q[4];
h q[4];
h q[5];
rz(0.8) q[5];
h q[5];
h q[6];
rz(0.8) q[6];
h q[6];
h q[7];
rz(0.8) q[7];
h q[7];

// Layer 4: Final phase optimization
// Repeat problem phase with optimized parameters
cx q[0], q[7];
rz(0.5) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.5) q[7];
cx q[1], q[7];
cx q[3], q[7];
rz(2.8) q[7];
cx q[3], q[7];
cx q[5], q[7];
rz(3.5) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(3.0) q[7];
cx q[6], q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];