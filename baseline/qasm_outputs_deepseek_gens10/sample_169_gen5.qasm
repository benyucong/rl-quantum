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

// Layer 1: Problem-specific entangling gates
// Edge (0,4) weight 10
rz(0.314) q[0];
rz(0.314) q[4];
cx q[0], q[4];
rz(-0.157) q[4];
cx q[0], q[4];

// Edge (0,7) weight 20
rz(0.628) q[0];
rz(0.628) q[7];
cx q[0], q[7];
rz(-0.314) q[7];
cx q[0], q[7];

// Edge (1,5) weight 10
rz(0.314) q[1];
rz(0.314) q[5];
cx q[1], q[5];
rz(-0.157) q[5];
cx q[1], q[5];

// Edge (1,4) weight 20
rz(0.628) q[1];
rz(0.628) q[4];
cx q[1], q[4];
rz(-0.314) q[4];
cx q[1], q[4];

// Edge (1,7) weight 14
rz(0.440) q[1];
rz(0.440) q[7];
cx q[1], q[7];
rz(-0.220) q[7];
cx q[1], q[7];

// Edge (2,6) weight 1
rz(0.031) q[2];
rz(0.031) q[6];
cx q[2], q[6];
rz(-0.016) q[6];
cx q[2], q[6];

// Edge (2,7) weight 18
rz(0.565) q[2];
rz(0.565) q[7];
cx q[2], q[7];
rz(-0.283) q[7];
cx q[2], q[7];

// Edge (2,4) weight 14
rz(0.440) q[2];
rz(0.440) q[4];
cx q[2], q[4];
rz(-0.220) q[4];
cx q[2], q[4];

// Edge (3,7) weight 5
rz(0.157) q[3];
rz(0.157) q[7];
cx q[3], q[7];
rz(-0.079) q[7];
cx q[3], q[7];

// Layer 2: Mixing layer
rx(1.047) q[0];
rx(1.047) q[1];
rx(1.047) q[2];
rx(1.047) q[3];
rx(1.047) q[4];
rx(1.047) q[5];
rx(1.047) q[6];
rx(1.047) q[7];
rx(1.047) q[8];

// Layer 2: Problem-specific entangling gates
// Edge (0,4) weight 10
rz(0.314) q[0];
rz(0.314) q[4];
cx q[0], q[4];
rz(-0.157) q[4];
cx q[0], q[4];

// Edge (0,7) weight 20
rz(0.628) q[0];
rz(0.628) q[7];
cx q[0], q[7];
rz(-0.314) q[7];
cx q[0], q[7];

// Edge (1,5) weight 10
rz(0.314) q[1];
rz(0.314) q[5];
cx q[1], q[5];
rz(-0.157) q[5];
cx q[1], q[5];

// Edge (1,4) weight 20
rz(0.628) q[1];
rz(0.628) q[4];
cx q[1], q[4];
rz(-0.314) q[4];
cx q[1], q[4];

// Edge (1,7) weight 14
rz(0.440) q[1];
rz(0.440) q[7];
cx q[1], q[7];
rz(-0.220) q[7];
cx q[1], q[7];

// Edge (2,6) weight 1
rz(0.031) q[2];
rz(0.031) q[6];
cx q[2], q[6];
rz(-0.016) q[6];
cx q[2], q[6];

// Edge (2,7) weight 18
rz(0.565) q[2];
rz(0.565) q[7];
cx q[2], q[7];
rz(-0.283) q[7];
cx q[2], q[7];

// Edge (2,4) weight 14
rz(0.440) q[2];
rz(0.440) q[4];
cx q[2], q[4];
rz(-0.220) q[4];
cx q[2], q[4];

// Edge (3,7) weight 5
rz(0.157) q[3];
rz(0.157) q[7];
cx q[3], q[7];
rz(-0.079) q[7];
cx q[3], q[7];

// Layer 3: Final mixing layer
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];
rx(0.785) q[7];
rx(0.785) q[8];

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