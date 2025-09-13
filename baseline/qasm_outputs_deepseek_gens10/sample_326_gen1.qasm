OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Layer 1: Initial Hadamard and parameterized rotations
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
h q[12];
h q[13];
h q[14];
h q[15];

rz(0.314) q[0];
rz(0.628) q[1];
rz(0.942) q[2];
rz(1.256) q[3];
rz(1.570) q[4];
rz(1.884) q[5];
rz(2.198) q[6];
rz(2.512) q[7];
rz(2.826) q[8];
rz(3.140) q[9];
rz(3.454) q[10];
rz(3.768) q[11];
rz(4.082) q[12];
rz(4.396) q[13];
rz(4.710) q[14];
rz(5.024) q[15];

// Layer 2: Mixer and cost Hamiltonian terms
// Edge (0,1) constraint
cx q[0], q[4];
rz(0.785) q[4];
cx q[0], q[4];
cx q[1], q[5];
rz(0.785) q[5];
cx q[1], q[5];

// Edge (0,2) constraint
cx q[0], q[8];
rz(0.785) q[8];
cx q[0], q[8];
cx q[2], q[9];
rz(0.785) q[9];
cx q[2], q[9];

// Edge (0,3) constraint
cx q[0], q[12];
rz(0.785) q[12];
cx q[0], q[12];
cx q[3], q[13];
rz(0.785) q[13];
cx q[3], q[13];

// Edge (1,2) constraint
cx q[1], q[6];
rz(0.785) q[6];
cx q[1], q[6];
cx q[2], q[7];
rz(0.785) q[7];
cx q[2], q[7];

// Edge (1,3) constraint
cx q[1], q[10];
rz(0.785) q[10];
cx q[1], q[10];
cx q[3], q[11];
rz(0.785) q[11];
cx q[3], q[11];

// Edge (2,3) constraint
cx q[2], q[14];
rz(0.785) q[14];
cx q[2], q[14];
cx q[3], q[15];
rz(0.785) q[15];
cx q[3], q[15];

// Layer 3: Additional mixing and optimization
rz(0.392) q[0];
rz(0.392) q[1];
rz(0.392) q[2];
rz(0.392) q[3];
rz(0.392) q[4];
rz(0.392) q[5];
rz(0.392) q[6];
rz(0.392) q[7];
rz(0.392) q[8];
rz(0.392) q[9];
rz(0.392) q[10];
rz(0.392) q[11];
rz(0.392) q[12];
rz(0.392) q[13];
rz(0.392) q[14];
rz(0.392) q[15];

// Layer 4: Final rotations and measurement preparation
rz(0.196) q[0];
rz(0.196) q[1];
rz(0.196) q[2];
rz(0.196) q[3];
rz(0.196) q[4];
rz(0.196) q[5];
rz(0.196) q[6];
rz(0.196) q[7];
rz(0.196) q[8];
rz(0.196) q[9];
rz(0.196) q[10];
rz(0.196) q[11];
rz(0.196) q[12];
rz(0.196) q[13];
rz(0.196) q[14];
rz(0.196) q[15];

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
c[12] = measure q[12];
c[13] = measure q[13];
c[14] = measure q[14];
c[15] = measure q[15];