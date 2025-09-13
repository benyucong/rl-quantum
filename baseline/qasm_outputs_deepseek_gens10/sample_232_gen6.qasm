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
rz(0.332) q[3];
rz(0.286) q[4];
rz(0.301) q[5];
rz(0.278) q[6];
rz(0.309) q[7];

// Layer 1: Problem-specific entangling gates
// Edge (0,1)
cx q[0], q[1];
rz(0.127) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.115) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.142) q[3];
cx q[0], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.134) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.121) q[6];
cx q[1], q[6];
// Edge (2,6)
cx q[2], q[6];
rz(0.118) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.138) q[4];
cx q[3], q[4];
// Edge (3,7)
cx q[3], q[7];
rz(0.145) q[7];
cx q[3], q[7];
// Edge (3,5)
cx q[3], q[5];
rz(0.131) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[7];
rz(0.141) q[7];
cx q[4], q[7];

// Layer 2: Mixer and parameterized rotations
rx(0.628) q[0];
rx(0.542) q[1];
rx(0.590) q[2];
rx(0.664) q[3];
rx(0.572) q[4];
rx(0.602) q[5];
rx(0.556) q[6];
rx(0.618) q[7];

// Layer 2: Problem-specific entangling gates
// Edge (0,1)
cx q[0], q[1];
rz(0.095) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.086) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.107) q[3];
cx q[0], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.101) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.091) q[6];
cx q[1], q[6];
// Edge (2,6)
cx q[2], q[6];
rz(0.089) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.104) q[4];
cx q[3], q[4];
// Edge (3,7)
cx q[3], q[7];
rz(0.109) q[7];
cx q[3], q[7];
// Edge (3,5)
cx q[3], q[5];
rz(0.098) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[7];
rz(0.106) q[7];
cx q[4], q[7];

// Layer 3: Final mixer and parameterized rotations
rx(0.471) q[0];
rx(0.407) q[1];
rx(0.443) q[2];
rx(0.498) q[3];
rx(0.429) q[4];
rx(0.452) q[5];
rx(0.417) q[6];
rx(0.464) q[7];

// Layer 3: Final problem-specific entangling gates
// Edge (0,1)
cx q[0], q[1];
rz(0.071) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.065) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.080) q[3];
cx q[0], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.076) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.068) q[6];
cx q[1], q[6];
// Edge (2,6)
cx q[2], q[6];
rz(0.067) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.078) q[4];
cx q[3], q[4];
// Edge (3,7)
cx q[3], q[7];
rz(0.082) q[7];
cx q[3], q[7];
// Edge (3,5)
cx q[3], q[5];
rz(0.074) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[7];
rz(0.079) q[7];
cx q[4], q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];