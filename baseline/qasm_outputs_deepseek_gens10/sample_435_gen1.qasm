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

// First QAOA layer - Problem unitary
// Edge (0,2)
cx q[0], q[2];
rz(0.214) q[2];
cx q[0], q[2];

// Edge (0,4)
cx q[0], q[4];
rz(0.183) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.197) q[5];
cx q[0], q[5];

// Edge (1,5)
cx q[1], q[5];
rz(0.169) q[5];
cx q[1], q[5];

// Edge (2,5)
cx q[2], q[5];
rz(0.205) q[5];
cx q[2], q[5];

// Edge (2,3)
cx q[2], q[3];
rz(0.192) q[3];
cx q[2], q[3];

// Edge (3,6)
cx q[3], q[6];
rz(0.178) q[6];
cx q[3], q[6];

// First QAOA layer - Mixer unitary
h q[0];
rz(0.423) q[0];
h q[0];

h q[1];
rz(0.387) q[1];
h q[1];

h q[2];
rz(0.435) q[2];
h q[2];

h q[3];
rz(0.401) q[3];
h q[3];

h q[4];
rz(0.376) q[4];
h q[4];

h q[5];
rz(0.418) q[5];
h q[5];

h q[6];
rz(0.392) q[6];
h q[6];

// Second QAOA layer - Problem unitary
// Edge (0,2)
cx q[0], q[2];
rz(0.231) q[2];
cx q[0], q[2];

// Edge (0,4)
cx q[0], q[4];
rz(0.198) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.213) q[5];
cx q[0], q[5];

// Edge (1,5)
cx q[1], q[5];
rz(0.182) q[5];
cx q[1], q[5];

// Edge (2,5)
cx q[2], q[5];
rz(0.221) q[5];
cx q[2], q[5];

// Edge (2,3)
cx q[2], q[3];
rz(0.207) q[3];
cx q[2], q[3];

// Edge (3,6)
cx q[3], q[6];
rz(0.192) q[6];
cx q[3], q[6];

// Second QAOA layer - Mixer unitary
h q[0];
rz(0.456) q[0];
h q[0];

h q[1];
rz(0.418) q[1];
h q[1];

h q[2];
rz(0.469) q[2];
h q[2];

h q[3];
rz(0.432) q[3];
h q[3];

h q[4];
rz(0.405) q[4];
h q[4];

h q[5];
rz(0.451) q[5];
h q[5];

h q[6];
rz(0.423) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];