OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits in state |0>
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply a series of controlled rotations based on the matching weights
// First layer
rz(0.3879) q[0];
rz(0.9162) q[1];
rz(1.1002) q[2];
rz(0.5015) q[3];
rz(0.9783) q[4];
rz(0.7879) q[5];
rz(0.6108) q[6];
rz(0.9035) q[7];

// Entangle first layer qubits
cx q[0], q[3];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[4];
cx q[2], q[5];
cx q[2], q[4];
cx q[2], q[3];
cx q[2], q[7];

// Second layer
rz(0.2347) q[0];
rz(0.4839) q[1];
rz(0.6123) q[2];
rz(0.2756) q[3];
rz(0.4398) q[4];
rz(0.3653) q[5];
rz(0.5275) q[6];
rz(0.7201) q[7];

// Entangle second layer qubits
cx q[0], q[1];
cx q[1], q[2];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[7];

// Final layer
rz(0.2891) q[0];
rz(0.3604) q[1];
rz(0.8073) q[2];
rz(0.6120) q[3];
rz(0.4900) q[4];
rz(0.8721) q[5];
rz(0.1698) q[6];
rz(0.6823) q[7];

// Entangle final layer qubits
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[5];
cx q[2], q[7];

// Measure qbits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];