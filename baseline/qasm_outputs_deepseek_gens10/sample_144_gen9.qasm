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
rz(0.628) q[1];
rz(0.942) q[2];
rz(1.256) q[3];
rz(1.570) q[4];
rz(1.884) q[5];
rz(2.198) q[6];
rz(2.512) q[7];

// Layer 2: Problem-specific entangling gates
// Edge (0,1) weight 3
cx q[0], q[1];
rz(0.094) q[1];
cx q[0], q[1];

// Edge (0,3) weight 15
cx q[0], q[3];
rz(0.471) q[3];
cx q[0], q[3];

// Edge (0,5) weight 15
cx q[0], q[5];
rz(0.471) q[5];
cx q[0], q[5];

// Edge (1,5) weight 13
cx q[1], q[5];
rz(0.408) q[5];
cx q[1], q[5];

// Edge (2,3) weight 5
cx q[2], q[3];
rz(0.157) q[3];
cx q[2], q[3];

// Edge (3,4) weight 16
cx q[3], q[4];
rz(0.502) q[4];
cx q[3], q[4];

// Edge (3,6) weight 18
cx q[3], q[6];
rz(0.565) q[6];
cx q[3], q[6];

// Edge (4,5) weight 10
cx q[4], q[5];
rz(0.314) q[5];
cx q[4], q[5];

// Layer 3: Mixer layer with parameterized rotations
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];
rx(0.785) q[7];
rz(0.392) q[0];
rz(0.392) q[1];
rz(0.392) q[2];
rz(0.392) q[3];
rz(0.392) q[4];
rz(0.392) q[5];
rz(0.392) q[6];
rz(0.392) q[7];

// Layer 4: Final parameterized rotations and measurement
rz(0.196) q[0];
rz(0.196) q[1];
rz(0.196) q[2];
rz(0.196) q[3];
rz(0.196) q[4];
rz(0.196) q[5];
rz(0.196) q[6];
rz(0.196) q[7];
rx(0.392) q[0];
rx(0.392) q[1];
rx(0.392) q[2];
rx(0.392) q[3];
rx(0.392) q[4];
rx(0.392) q[5];
rx(0.392) q[6];
rx(0.392) q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];