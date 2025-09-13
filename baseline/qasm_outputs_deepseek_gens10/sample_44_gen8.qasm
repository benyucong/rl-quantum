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

// Layer 2: Problem-specific mixing with optimized parameters
// Edge (0,5) - weight 4
rz(0.314) q[0];
rz(0.314) q[5];
cx q[0], q[5];
rz(0.628) q[5];
cx q[0], q[5];

// Edge (0,6) - weight 16
rz(1.256) q[0];
rz(1.256) q[6];
cx q[0], q[6];
rz(2.512) q[6];
cx q[0], q[6];

// Edge (1,6) - weight 7
rz(0.549) q[1];
rz(0.549) q[6];
cx q[1], q[6];
rz(1.099) q[6];
cx q[1], q[6];

// Edge (1,8) - weight 13
rz(1.021) q[1];
rz(1.021) q[8];
cx q[1], q[8];
rz(2.042) q[8];
cx q[1], q[8];

// Edge (1,7) - weight 11
rz(0.863) q[1];
rz(0.863) q[7];
cx q[1], q[7];
rz(1.727) q[7];
cx q[1], q[7];

// Edge (2,7) - weight 4
rz(0.314) q[2];
rz(0.314) q[7];
cx q[2], q[7];
rz(0.628) q[7];
cx q[2], q[7];

// Edge (2,5) - weight 17
rz(1.335) q[2];
rz(1.335) q[5];
cx q[2], q[5];
rz(2.670) q[5];
cx q[2], q[5];

// Edge (3,8) - weight 7
rz(0.549) q[3];
rz(0.549) q[8];
cx q[3], q[8];
rz(1.099) q[8];
cx q[3], q[8];

// Edge (3,5) - weight 18
rz(1.413) q[3];
rz(1.413) q[5];
cx q[3], q[5];
rz(2.827) q[5];
cx q[3], q[5];

// Layer 3: Additional mixing with optimized parameters
rz(0.785) q[0];
rz(0.785) q[1];
rz(0.785) q[2];
rz(0.785) q[3];
rz(0.785) q[4];
rz(0.785) q[5];
rz(0.785) q[6];
rz(0.785) q[7];
rz(0.785) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
rz(1.571) q[0];
rz(1.571) q[1];
rz(1.571) q[2];
rz(1.571) q[3];
rz(1.571) q[4];
rz(1.571) q[5];
rz(1.571) q[6];
rz(1.571) q[7];
rz(1.571) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 4: Final optimization layer
rz(0.392) q[0];
rz(0.392) q[1];
rz(0.392) q[2];
rz(0.392) q[3];
rz(0.392) q[4];
rz(0.392) q[5];
rz(0.392) q[6];
rz(0.392) q[7];
rz(0.392) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
rz(0.196) q[0];
rz(0.196) q[1];
rz(0.196) q[2];
rz(0.196) q[3];
rz(0.196) q[4];
rz(0.196) q[5];
rz(0.196) q[6];
rz(0.196) q[7];
rz(0.196) q[8];
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