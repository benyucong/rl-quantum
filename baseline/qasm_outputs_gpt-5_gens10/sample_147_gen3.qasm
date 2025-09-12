OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initializing Hadamard gates and controlled rotations based on edge weights
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(1.19) q[0]; // corresponds to edge (0, 4)
rz(1.3) q[1];  // corresponds to edge (1, 3)
rz(1.24) q[4]; // corresponds to edge (4, 5)
rz(0.8) q[5];  // corresponds to edge (1, 5)
rz(1.5) q[2];  // corresponds to edge (2, 3)
rz(1.2) q[2];  // corresponds to edge (2, 6)

// Layer 2: Apply CX gates to entangle qubits
cx q[0], q[1];
cx q[1], q[3];
cx q[1], q[4];
cx q[0], q[4];
cx q[2], q[3];
cx q[4], q[5];
cx q[1], q[5];

// Layer 3: Apply inverse RZ and measurement
rz(-1.2) q[0];
rz(-1.19) q[0];
rz(-1.3) q[1];
rz(-1.24) q[4];
rz(-0.8) q[5];
rz(-1.5) q[2];
rz(-1.2) q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];