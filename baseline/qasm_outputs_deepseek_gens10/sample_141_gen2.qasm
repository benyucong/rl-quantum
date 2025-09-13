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

// Layer 1 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.214) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.312) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.278) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.345) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.189) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.156) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.167) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
rx(1.428) q[0];
rx(1.312) q[1];
rx(1.567) q[2];
rx(1.489) q[3];
rx(1.521) q[4];
rx(1.403) q[5];
rx(1.276) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.198) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.287) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.254) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.321) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.173) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.142) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.153) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
rx(1.367) q[0];
rx(1.245) q[1];
rx(1.512) q[2];
rx(1.432) q[3];
rx(1.478) q[4];
rx(1.356) q[5];
rx(1.218) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.183) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.265) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.231) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.298) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.158) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.129) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.139) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
rx(1.309) q[0];
rx(1.189) q[1];
rx(1.462) q[2];
rx(1.378) q[3];
rx(1.437) q[4];
rx(1.312) q[5];
rx(1.164) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];