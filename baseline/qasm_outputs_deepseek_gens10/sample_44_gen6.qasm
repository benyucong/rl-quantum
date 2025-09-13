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
// Edge (0,5): weight 4
cx q[0], q[5];
rz(0.3927) q[5];
cx q[0], q[5];

// Edge (0,6): weight 16
cx q[0], q[6];
rz(1.5708) q[6];
cx q[0], q[6];

// Edge (1,6): weight 7
cx q[1], q[6];
rz(0.6872) q[6];
cx q[1], q[6];

// Edge (1,8): weight 13
cx q[1], q[8];
rz(1.2757) q[8];
cx q[1], q[8];

// Edge (1,7): weight 11
cx q[1], q[7];
rz(1.0799) q[7];
cx q[1], q[7];

// Edge (2,7): weight 4
cx q[2], q[7];
rz(0.3927) q[7];
cx q[2], q[7];

// Edge (2,5): weight 17
cx q[2], q[5];
rz(1.6676) q[5];
cx q[2], q[5];

// Edge (3,8): weight 7
cx q[3], q[8];
rz(0.6872) q[8];
cx q[3], q[8];

// Edge (3,5): weight 18
cx q[3], q[5];
rz(1.7671) q[5];
cx q[3], q[5];

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

// Layer 4: Final phase encoding with optimal parameters
// Edge (0,5): weight 4
cx q[0], q[5];
rz(0.3927) q[5];
cx q[0], q[5];

// Edge (0,6): weight 16
cx q[0], q[6];
rz(1.5708) q[6];
cx q[0], q[6];

// Edge (1,6): weight 7
cx q[1], q[6];
rz(0.6872) q[6];
cx q[1], q[6];

// Edge (1,8): weight 13
cx q[1], q[8];
rz(1.2757) q[8];
cx q[1], q[8];

// Edge (1,7): weight 11
cx q[1], q[7];
rz(1.0799) q[7];
cx q[1], q[7];

// Edge (2,7): weight 4
cx q[2], q[7];
rz(0.3927) q[7];
cx q[2], q[7];

// Edge (2,5): weight 17
cx q[2], q[5];
rz(1.6676) q[5];
cx q[2], q[5];

// Edge (3,8): weight 7
cx q[3], q[8];
rz(0.6872) q[8];
cx q[3], q[8];

// Edge (3,5): weight 18
cx q[3], q[5];
rz(1.7671) q[5];
cx q[3], q[5];

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