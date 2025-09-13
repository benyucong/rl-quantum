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
// Edge (0,1) weight 10
cx q[0], q[8];
rz(0.314) q[8];
cx q[0], q[8];
cx q[1], q[8];
rz(0.314) q[8];
cx q[1], q[8];

// Edge (1,2) weight 12
cx q[1], q[8];
rz(0.377) q[8];
cx q[1], q[8];
cx q[2], q[8];
rz(0.377) q[8];
cx q[2], q[8];

// Edge (1,7) weight 18
cx q[1], q[8];
rz(0.565) q[8];
cx q[1], q[8];
cx q[7], q[8];
rz(0.565) q[8];
cx q[7], q[8];

// Edge (2,3) weight 7
cx q[2], q[8];
rz(0.220) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(0.220) q[8];
cx q[3], q[8];

// Edge (2,5) weight 18
cx q[2], q[8];
rz(0.565) q[8];
cx q[2], q[8];
cx q[5], q[8];
rz(0.565) q[8];
cx q[5], q[8];

// Edge (3,5) weight 12
cx q[3], q[8];
rz(0.377) q[8];
cx q[3], q[8];
cx q[5], q[8];
rz(0.377) q[8];
cx q[5], q[8];

// Edge (3,4) weight 15
cx q[3], q[8];
rz(0.471) q[8];
cx q[3], q[8];
cx q[4], q[8];
rz(0.471) q[8];
cx q[4], q[8];

// Edge (4,5) weight 4
cx q[4], q[8];
rz(0.126) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(0.126) q[8];
cx q[5], q[8];

// Edge (6,7) weight 10
cx q[6], q[8];
rz(0.314) q[8];
cx q[6], q[8];
cx q[7], q[8];
rz(0.314) q[8];
cx q[7], q[8];

// Layer 3: Mixing layer
rx(1.047) q[0];
rx(1.047) q[1];
rx(1.047) q[2];
rx(1.047) q[3];
rx(1.047) q[4];
rx(1.047) q[5];
rx(1.047) q[6];
rx(1.047) q[7];
rz(0.785) q[8];

// Layer 4: Final Hadamard layer
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