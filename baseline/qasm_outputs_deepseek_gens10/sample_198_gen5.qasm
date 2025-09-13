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
// Edge (0,3)
cx q[0], q[3];
rz(0.214) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.198) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.183) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.226) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.205) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.192) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.189) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.217) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.176) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.181) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.208) q[6];
cx q[5], q[6];

// First Mixer Hamiltonian
h q[0];
rz(0.342) q[0];
h q[0];
h q[1];
rz(0.328) q[1];
h q[1];
h q[2];
rz(0.315) q[2];
h q[2];
h q[3];
rz(0.367) q[3];
h q[3];
h q[4];
rz(0.298) q[4];
h q[4];
h q[5];
rz(0.354) q[5];
h q[5];
h q[6];
rz(0.336) q[6];
h q[6];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.428) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.396) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.366) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.452) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.410) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.384) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.378) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.434) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.352) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.362) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.416) q[6];
cx q[5], q[6];

// Second Mixer Hamiltonian
h q[0];
rz(0.684) q[0];
h q[0];
h q[1];
rz(0.656) q[1];
h q[1];
h q[2];
rz(0.630) q[2];
h q[2];
h q[3];
rz(0.734) q[3];
h q[3];
h q[4];
rz(0.596) q[4];
h q[4];
h q[5];
rz(0.708) q[5];
h q[5];
h q[6];
rz(0.672) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];