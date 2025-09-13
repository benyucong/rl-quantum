OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Initial Hadamard on all qubits to create superposition
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

// Graph isomorphism oracle for the given graphs
// Target graph edges: (0,1), (0,2), (1,3), (2,3)
// Reference graph edges: (3,2), (3,0), (2,1), (0,1)

// Implement controlled-phase gates for edge constraints
// Edge (0,1) constraint
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];

// Edge (0,2) constraint  
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Edge (1,3) constraint
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];
cx q[3], q[6];
rz(0.7854) q[6];
cx q[3], q[6];

// Edge (2,3) constraint
cx q[2], q[7];
rz(0.7854) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.7854) q[7];
cx q[3], q[7];

// Diffusion operator (inversion about the mean)
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
x q[0];
x q[1];
x q[2];
x q[3];
x q[4];
x q[5];
x q[6];
x q[7];
x q[8];
x q[9];
x q[10];
x q[11];
x q[12];
x q[13];
x q[14];
x q[15];
h q[15];
cx q[0], q[15];
cx q[1], q[15];
cx q[2], q[15];
cx q[3], q[15];
cx q[4], q[15];
cx q[5], q[15];
cx q[6], q[15];
cx q[7], q[15];
cx q[8], q[15];
cx q[9], q[15];
cx q[10], q[15];
cx q[11], q[15];
cx q[12], q[15];
cx q[13], q[15];
cx q[14], q[15];
h q[15];
x q[0];
x q[1];
x q[2];
x q[3];
x q[4];
x q[5];
x q[6];
x q[7];
x q[8];
x q[9];
x q[10];
x q[11];
x q[12];
x q[13];
x q[14];
x q[15];
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