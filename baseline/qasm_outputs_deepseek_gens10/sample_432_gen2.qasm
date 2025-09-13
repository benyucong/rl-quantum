OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// First QAOA layer - Cost Hamiltonian
// Edge (0,6)
cx q[0], q[6];
rz(0.214) q[6];
cx q[0], q[6];

// Edge (1,2)
cx q[1], q[2];
rz(0.183) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.197) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.205) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.169) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.192) q[4];
cx q[2], q[4];

// Edge (2,6)
cx q[2], q[6];
rz(0.221) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.178) q[5];
cx q[3], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.186) q[6];
cx q[5], q[6];

// First Mixer layer
h q[0];
rz(0.432) q[0];
h q[0];

h q[1];
rz(0.398) q[1];
h q[1];

h q[2];
rz(0.415) q[2];
h q[2];

h q[3];
rz(0.407) q[3];
h q[3];

h q[4];
rz(0.423) q[4];
h q[4];

h q[5];
rz(0.411) q[5];
h q[5];

h q[6];
rz(0.429) q[6];
h q[6];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,6)
cx q[0], q[6];
rz(0.228) q[6];
cx q[0], q[6];

// Edge (1,2)
cx q[1], q[2];
rz(0.195) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.211) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.219) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.181) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.204) q[4];
cx q[2], q[4];

// Edge (2,6)
cx q[2], q[6];
rz(0.235) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.189) q[5];
cx q[3], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.198) q[6];
cx q[5], q[6];

// Second Mixer layer
h q[0];
rz(0.461) q[0];
h q[0];

h q[1];
rz(0.425) q[1];
h q[1];

h q[2];
rz(0.443) q[2];
h q[2];

h q[3];
rz(0.435) q[3];
h q[3];

h q[4];
rz(0.451) q[4];
h q[4];

h q[5];
rz(0.439) q[5];
h q[5];

h q[6];
rz(0.458) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];