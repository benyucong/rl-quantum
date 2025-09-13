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

// Layer 2: Problem-specific phase encoding with optimal parameters
// Edge (0,6): weight 2
rz(0.314) q[0];
rz(0.314) q[6];
cx q[0], q[6];
rz(-0.628) q[6];
cx q[0], q[6];

// Edge (0,7): weight 11
rz(1.727) q[0];
rz(1.727) q[7];
cx q[0], q[7];
rz(-3.454) q[7];
cx q[0], q[7];

// Edge (1,7): weight 8
rz(1.256) q[1];
rz(1.256) q[7];
cx q[1], q[7];
rz(-2.512) q[7];
cx q[1], q[7];

// Edge (2,8): weight 1
rz(0.157) q[2];
rz(0.157) q[8];
cx q[2], q[8];
rz(-0.314) q[8];
cx q[2], q[8];

// Edge (2,7): weight 18
rz(2.827) q[2];
rz(2.827) q[7];
cx q[2], q[7];
rz(-5.654) q[7];
cx q[2], q[7];

// Edge (3,6): weight 11
rz(1.727) q[3];
rz(1.727) q[6];
cx q[3], q[6];
rz(-3.454) q[6];
cx q[3], q[6];

// Edge (3,7): weight 15
rz(2.356) q[3];
rz(2.356) q[7];
cx q[3], q[7];
rz(-4.712) q[7];
cx q[3], q[7];

// Edge (5,7): weight 17
rz(2.670) q[5];
rz(2.670) q[7];
cx q[5], q[7];
rz(-5.340) q[7];
cx q[5], q[7];

// Layer 3: Mixing layer with optimal parameters
rx(1.047) q[0];
rx(1.047) q[1];
rx(1.047) q[2];
rx(1.047) q[3];
rx(1.047) q[4];
rx(1.047) q[5];
rx(1.047) q[6];
rx(1.047) q[7];
rx(1.047) q[8];

// Layer 4: Final phase layer with optimal parameters
rz(0.785) q[0];
rz(0.785) q[1];
rz(0.785) q[2];
rz(0.785) q[3];
rz(0.785) q[4];
rz(0.785) q[5];
rz(0.785) q[6];
rz(0.785) q[7];
rz(0.785) q[8];

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