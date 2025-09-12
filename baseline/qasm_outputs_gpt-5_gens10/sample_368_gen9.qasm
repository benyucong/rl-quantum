OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Prepare the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2: Create entanglement based on the k-clique edges
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[6];
cx q[2], q[3];
cx q[2], q[4];
cx q[2], q[5];
cx q[3], q[4];

// Layer 3: Rotate around the Z-axis to put the qubits in the desired states
rz(0.7854) q[0]; // ~pi/4
rz(0.7854) q[1]; // ~pi/4
rz(0.7854) q[2]; // ~pi/4
rz(0.7854) q[3]; // ~pi/4
rz(0.7854) q[4]; // ~pi/4
rz(0.7854) q[5]; // ~pi/4
rz(0.7854) q[6]; // ~pi/4

// Measurement step
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];