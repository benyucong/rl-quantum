OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Apply parameterized rotations
ry(1.2) q[0];
ry(0.8) q[1];
ry(1.5) q[2];
ry(1.0) q[3];
ry(0.6) q[4];
ry(0.9) q[5];
ry(1.3) q[6];

// Layer 2: Entangling gates based on edges
cx q[0], q[3]; // edge (0, 3)
cx q[0], q[5]; // edge (0, 5)
cx q[0], q[6]; // edge (0, 6)
cx q[1], q[5]; // edge (1, 5)
cx q[2], q[3]; // edge (2, 3)
cx q[4], q[5]; // edge (4, 5)
cx q[4], q[6]; // edge (4, 6)

// Layer 3: Apply final rotations
rz(0.5) q[0];
rz(0.3) q[1];
rz(-0.7) q[2];
rz(0.4) q[3];
rz(-0.2) q[4];
rz(0.1) q[5];
rz(-0.6) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];