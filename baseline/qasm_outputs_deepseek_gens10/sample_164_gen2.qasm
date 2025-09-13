OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Initial Hadamard layer for superposition
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
// Graph 1: edges (3,2), (3,0), (2,1), (0,1)
// Graph 2: edges (0,1), (0,2), (1,3), (2,3)

// Phase oracle implementation
// Check edge (0,1) in both graphs
cx q[0], q[12];
cx q[1], q[12];
rz(0.7854) q[12];
cx q[1], q[12];
cx q[0], q[12];

// Check edge (0,2) in graph 2 vs (3,0) in graph 1
cx q[0], q[13];
cx q[2], q[13];
rz(0.7854) q[13];
cx q[2], q[13];
cx q[0], q[13];

// Check edge (1,3) in graph 2 vs (2,1) in graph 1
cx q[1], q[14];
cx q[3], q[14];
rz(0.7854) q[14];
cx q[3], q[14];
cx q[1], q[14];

// Check edge (2,3) in graph 2 vs (3,2) in graph 1
cx q[2], q[15];
cx q[3], q[15];
rz(0.7854) q[15];
cx q[3], q[15];
cx q[2], q[15];

// Diffusion operator
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
h q[11];
cx q[10], q[11];
cx q[9], q[11];
cx q[8], q[11];
cx q[7], q[11];
cx q[6], q[11];
cx q[5], q[11];
cx q[4], q[11];
cx q[3], q[11];
cx q[2], q[11];
cx q[1], q[11];
cx q[0], q[11];
h q[11];
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