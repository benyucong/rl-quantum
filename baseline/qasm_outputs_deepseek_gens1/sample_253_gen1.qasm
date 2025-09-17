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

// Layer 2: Problem-specific phase separation
// Edge (0,1) with weight 10
cx q[0], q[8];
rz(0.5) q[8];
cx q[0], q[8];
cx q[1], q[8];
rz(0.5) q[8];
cx q[1], q[8];

// Edge (1,2) with weight 12
cx q[1], q[8];
rz(0.6) q[8];
cx q[1], q[8];
cx q[2], q[8];
rz(0.6) q[8];
cx q[2], q[8];

// Edge (1,7) with weight 18
cx q[1], q[8];
rz(0.9) q[8];
cx q[1], q[8];
cx q[7], q[8];
rz(0.9) q[8];
cx q[7], q[8];

// Edge (2,3) with weight 7
cx q[2], q[8];
rz(0.35) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(0.35) q[8];
cx q[3], q[8];

// Edge (2,5) with weight 18
cx q[2], q[8];
rz(0.9) q[8];
cx q[2], q[8];
cx q[5], q[8];
rz(0.9) q[8];
cx q[5], q[8];

// Edge (3,5) with weight 12
cx q[3], q[8];
rz(0.6) q[8];
cx q[3], q[8];
cx q[5], q[8];
rz(0.6) q[8];
cx q[5], q[8];

// Edge (3,4) with weight 15
cx q[3], q[8];
rz(0.75) q[8];
cx q[3], q[8];
cx q[4], q[8];
rz(0.75) q[8];
cx q[4], q[8];

// Edge (4,5) with weight 4
cx q[4], q[8];
rz(0.2) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(0.2) q[8];
cx q[5], q[8];

// Edge (6,7) with weight 10
cx q[6], q[8];
rz(0.5) q[8];
cx q[6], q[8];
cx q[7], q[8];
rz(0.5) q[8];
cx q[7], q[8];

// Layer 3: Mixing layer
rx(1.2) q[0];
rx(1.2) q[1];
rx(1.2) q[2];
rx(1.2) q[3];
rx(1.2) q[4];
rx(1.2) q[5];
rx(1.2) q[6];
rx(1.2) q[7];
rz(0.8) q[8];

// Layer 4: Final parameterized rotations
rz(0.45) q[0];
rz(0.52) q[1];
rz(0.38) q[2];
rz(0.41) q[3];
rz(0.35) q[4];
rz(0.48) q[5];
rz(0.32) q[6];
rz(0.44) q[7];
rz(0.25) q[8];

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