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

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,4) with weight 10
rz(0.7854) q[0];
rz(0.7854) q[4];
cx q[0], q[4];
rz(-0.7854) q[4];
cx q[0], q[4];

// Edge (0,7) with weight 20
rz(1.5708) q[0];
rz(1.5708) q[7];
cx q[0], q[7];
rz(-1.5708) q[7];
cx q[0], q[7];

// Edge (1,5) with weight 10
rz(0.7854) q[1];
rz(0.7854) q[5];
cx q[1], q[5];
rz(-0.7854) q[5];
cx q[1], q[5];

// Edge (1,4) with weight 20
rz(1.5708) q[1];
rz(1.5708) q[4];
cx q[1], q[4];
rz(-1.5708) q[4];
cx q[1], q[4];

// Edge (1,7) with weight 14
rz(1.0996) q[1];
rz(1.0996) q[7];
cx q[1], q[7];
rz(-1.0996) q[7];
cx q[1], q[7];

// Edge (2,6) with weight 1
rz(0.0785) q[2];
rz(0.0785) q[6];
cx q[2], q[6];
rz(-0.0785) q[6];
cx q[2], q[6];

// Edge (2,7) with weight 18
rz(1.4137) q[2];
rz(1.4137) q[7];
cx q[2], q[7];
rz(-1.4137) q[7];
cx q[2], q[7];

// Edge (2,4) with weight 14
rz(1.0996) q[2];
rz(1.0996) q[4];
cx q[2], q[4];
rz(-1.0996) q[4];
cx q[2], q[4];

// Edge (3,7) with weight 5
rz(0.3927) q[3];
rz(0.3927) q[7];
cx q[3], q[7];
rz(-0.3927) q[7];
cx q[3], q[7];

// Layer 3: Final mixing and measurement preparation
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