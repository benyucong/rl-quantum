OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(0.314) q[0];
rz(0.271) q[1];
rz(0.295) q[2];
rz(0.283) q[3];
rz(0.302) q[4];
rz(0.289) q[5];
rz(0.278) q[6];
rz(0.321) q[7];

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,1) weight 3
cx q[0], q[1];
rz(0.047) q[1];
cx q[0], q[1];

// Edge (0,5) weight 14
cx q[0], q[5];
rz(0.219) q[5];
cx q[0], q[5];

// Edge (1,4) weight 15
cx q[1], q[4];
rz(0.235) q[4];
cx q[1], q[4];

// Edge (1,3) weight 11
cx q[1], q[3];
rz(0.172) q[3];
cx q[1], q[3];

// Edge (2,3) weight 10
cx q[2], q[3];
rz(0.157) q[3];
cx q[2], q[3];

// Edge (4,5) weight 6
cx q[4], q[5];
rz(0.094) q[5];
cx q[4], q[5];

// Edge (4,6) weight 20
cx q[4], q[6];
rz(0.314) q[6];
cx q[4], q[6];

// Edge (5,6) weight 16
cx q[5], q[6];
rz(0.251) q[6];
cx q[5], q[6];

// Layer 3: Mixer layer with parameterized rotations
rx(0.628) q[0];
rx(0.597) q[1];
rx(0.611) q[2];
rx(0.603) q[3];
rx(0.617) q[4];
rx(0.609) q[5];
rx(0.599) q[6];
rx(0.631) q[7];

// Layer 4: Final parameterized rotations and measurement preparation
rz(0.267) q[0];
rz(0.231) q[1];
rz(0.251) q[2];
rz(0.241) q[3];
rz(0.257) q[4];
rz(0.246) q[5];
rz(0.236) q[6];
rz(0.273) q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];