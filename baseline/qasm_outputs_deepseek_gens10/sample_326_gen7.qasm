OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Layer 1: Initial Hadamard gates on all qubits
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

// Layer 2: Problem-specific constraints (edge conflicts)
// Edge (0,1)
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];
cx q[3], q[7];
rz(0.7854) q[7];
cx q[3], q[7];

// Edge (0,2)
cx q[0], q[8];
rz(0.7854) q[8];
cx q[0], q[8];
cx q[1], q[9];
rz(0.7854) q[9];
cx q[1], q[9];
cx q[2], q[10];
rz(0.7854) q[10];
cx q[2], q[10];
cx q[3], q[11];
rz(0.7854) q[11];
cx q[3], q[11];

// Edge (0,3)
cx q[0], q[12];
rz(0.7854) q[12];
cx q[0], q[12];
cx q[1], q[13];
rz(0.7854) q[13];
cx q[1], q[13];
cx q[2], q[14];
rz(0.7854) q[14];
cx q[2], q[14];
cx q[3], q[15];
rz(0.7854) q[15];
cx q[3], q[15];

// Edge (1,2)
cx q[4], q[8];
rz(0.7854) q[8];
cx q[4], q[8];
cx q[5], q[9];
rz(0.7854) q[9];
cx q[5], q[9];
cx q[6], q[10];
rz(0.7854) q[10];
cx q[6], q[10];
cx q[7], q[11];
rz(0.7854) q[11];
cx q[7], q[11];

// Edge (1,3)
cx q[4], q[12];
rz(0.7854) q[12];
cx q[4], q[12];
cx q[5], q[13];
rz(0.7854) q[13];
cx q[5], q[13];
cx q[6], q[14];
rz(0.7854) q[14];
cx q[6], q[14];
cx q[7], q[15];
rz(0.7854) q[15];
cx q[7], q[15];

// Edge (2,3)
cx q[8], q[12];
rz(0.7854) q[12];
cx q[8], q[12];
cx q[9], q[13];
rz(0.7854) q[13];
cx q[9], q[13];
cx q[10], q[14];
rz(0.7854) q[14];
cx q[10], q[14];
cx q[11], q[15];
rz(0.7854) q[15];
cx q[11], q[15];

// Layer 3: Mixing layer
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];
rx(1.5708) q[9];
rx(1.5708) q[10];
rx(1.5708) q[11];
rx(1.5708) q[12];
rx(1.5708) q[13];
rx(1.5708) q[14];
rx(1.5708) q[15];

// Layer 4: Final optimization
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
rz(0.3927) q[6];
rz(0.3927) q[7];
rz(0.3927) q[8];
rz(0.3927) q[9];
rz(0.3927) q[10];
rz(0.3927) q[11];
rz(0.3927) q[12];
rz(0.3927) q[13];
rz(0.3927) q[14];
rz(0.3927) q[15];

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