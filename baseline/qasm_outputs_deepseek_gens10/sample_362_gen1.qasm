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

// Layer 1: Problem-specific entangling gates
// Edge (0,3) with weight 5
rz(0.3927) q[0];
rz(0.3927) q[3];
cx q[0], q[3];
rz(-0.3927) q[3];
cx q[0], q[3];

// Edge (0,4) with weight 15
rz(1.1781) q[0];
rz(1.1781) q[4];
cx q[0], q[4];
rz(-1.1781) q[4];
cx q[0], q[4];

// Edge (0,5) with weight 13
rz(1.0210) q[0];
rz(1.0210) q[5];
cx q[0], q[5];
rz(-1.0210) q[5];
cx q[0], q[5];

// Edge (1,4) with weight 10
rz(0.7854) q[1];
rz(0.7854) q[4];
cx q[1], q[4];
rz(-0.7854) q[4];
cx q[1], q[4];

// Edge (2,5) with weight 6
rz(0.4712) q[2];
rz(0.4712) q[5];
cx q[2], q[5];
rz(-0.4712) q[5];
cx q[2], q[5];

// Edge (2,4) with weight 13
rz(1.0210) q[2];
rz(1.0210) q[4];
cx q[2], q[4];
rz(-1.0210) q[4];
cx q[2], q[4];

// Edge (2,3) with weight 15
rz(1.1781) q[2];
rz(1.1781) q[3];
cx q[2], q[3];
rz(-1.1781) q[3];
cx q[2], q[3];

// Edge (2,7) with weight 18
rz(1.4137) q[2];
rz(1.4137) q[7];
cx q[2], q[7];
rz(-1.4137) q[7];
cx q[2], q[7];

// Layer 2: Mixer layer
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];

// Layer 3: Final optimization layer
rz(0.6283) q[0];
rz(0.6283) q[1];
rz(0.6283) q[2];
rz(0.6283) q[3];
rz(0.6283) q[4];
rz(0.6283) q[5];
rz(0.6283) q[6];
rz(0.6283) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];