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
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,3) with weight 5
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];

// Edge (0,4) with weight 15
cx q[0], q[4];
rz(1.1781) q[4];
cx q[0], q[4];

// Edge (0,5) with weight 13
cx q[0], q[5];
rz(1.0210) q[5];
cx q[0], q[5];

// Edge (1,4) with weight 10
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];

// Edge (2,5) with weight 6
cx q[2], q[5];
rz(0.4712) q[5];
cx q[2], q[5];

// Edge (2,4) with weight 13
cx q[2], q[4];
rz(1.0210) q[4];
cx q[2], q[4];

// Edge (2,3) with weight 15
cx q[2], q[3];
rz(1.1781) q[3];
cx q[2], q[3];

// Edge (2,7) with weight 18
cx q[2], q[7];
rz(1.4137) q[7];
cx q[2], q[7];

// Layer 3: Final parameterized rotations and measurement
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
rz(0.3927) q[6];
rz(0.3927) q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];