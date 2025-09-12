OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1: Apply controlled rotations based on capacities
rx(0.6155) q[0];
cx q[0], q[2]; // Representing edge with capacity 6 from source to 2
rz(-0.2231) q[2]; // Decision based on capacity

rx(0.7755) q[1];
cx q[1], q[3]; // Edge with capacity 1 from 1 to 3
rz(-0.2231) q[3]; // Effect of edge
cx q[1], q[4]; // Edge with capacity 4 from 1 to 4
rz(-0.8416) q[4]; // Effect of edge

rx(0.5460) q[2];
cx q[2], q[4]; // Edge with capacity 4 from 2 to 4
rz(-0.8416) q[4]; // Effect of edge

rx(0.5295) q[3];
cx q[3], q[2]; // Edge with capacity 3 from 3 to 2
rz(-0.2231) q[2]; // Effect of edge

// Layer 2: Final rotations to refine state
h q[0];
rz(0.1767) q[0];
h q[0];

h q[1];
rz(0.1767) q[1];
h q[1];

h q[2];
rz(0.1767) q[2];
h q[2];

h q[3];
rz(0.1767) q[3];
h q[3];

h q[4];
rz(0.1767) q[4];
h q[4];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];