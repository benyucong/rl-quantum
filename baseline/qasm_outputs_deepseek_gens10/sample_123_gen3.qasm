OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

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
h q[9];
h q[10];
h q[11];

// Layer 2: Problem-specific phase encoding with optimal parameters
// Edge (0,7) weight 5
cx q[0], q[7];
rz(0.3927) q[7];
cx q[0], q[7];

// Edge (0,9) weight 18
cx q[0], q[9];
rz(1.4137) q[9];
cx q[0], q[9];

// Edge (1,8) weight 4
cx q[1], q[8];
rz(0.3142) q[8];
cx q[1], q[8];

// Edge (2,9) weight 4
cx q[2], q[9];
rz(0.3142) q[9];
cx q[2], q[9];

// Edge (2,8) weight 18
cx q[2], q[8];
rz(1.4137) q[8];
cx q[2], q[8];

// Edge (3,10) weight 10
cx q[3], q[10];
rz(0.7854) q[10];
cx q[3], q[10];

// Edge (4,11) weight 7
cx q[4], q[11];
rz(0.5498) q[11];
cx q[4], q[11];

// Edge (4,8) weight 15
cx q[4], q[8];
rz(1.1781) q[8];
cx q[4], q[8];

// Edge (5,8) weight 19
cx q[5], q[8];
rz(1.4923) q[8];
cx q[5], q[8];

// Edge (5,7) weight 19
cx q[5], q[7];
rz(1.4923) q[7];
cx q[5], q[7];

// Layer 3: Mixing layer with optimal parameters
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];
rx(1.0472) q[8];
rx(1.0472) q[9];
rx(1.0472) q[10];
rx(1.0472) q[11];

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
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];