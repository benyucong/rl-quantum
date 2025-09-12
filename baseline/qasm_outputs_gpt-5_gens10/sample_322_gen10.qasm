OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initialize qubits with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled-X gates based on the max_flow network
cx q[0], q[5]; // edge (0, 5)
cx q[2], q[3]; // edge (2, 3)
cx q[3], q[1]; // edge (3, 1)
cx q[3], q[2]; // edge (3, 2)
cx q[3], q[5]; // edge (3, 5)
cx q[4], q[2]; // edge (4, 2)

// Layer 3: Rotate and entangle
rz(0.1) q[0];
rz(0.2) q[1];
rz(0.3) q[2];
rz(0.4) q[3];
rz(0.5) q[4];
rz(0.6) q[5];

// Layer 4: Final entangling gates
cx q[0], q[5];
cx q[2], q[3];
cx q[3], q[1];
cx q[3], q[2];
cx q[3], q[5];
cx q[4], q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];