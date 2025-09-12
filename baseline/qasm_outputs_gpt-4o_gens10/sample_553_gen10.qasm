OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1: Create entanglement based on the graph edges
cx q[0], q[2]; // Edge (0, 2)
cx q[1], q[2]; // Edge (1, 2)
cx q[3], q[4]; // Edge (3, 4)
cx q[4], q[5]; // Edge (4, 5)

// Layer 2: Apply rotation gates to enhance connectivity
rz(0.5) q[0];
rz(0.5) q[1];
rz(0.5) q[2];
rz(0.5) q[3];
rz(0.5) q[4];

// Layer 3: Further entanglement
cx q[0], q[1];
cx q[2], q[3];
cx q[3], q[4];

// Layer 4: Final adjustments
rz(-0.5) q[0];
rz(-0.5) q[1];
rz(-0.5) q[2];
rz(-0.5) q[3];
rz(-0.5) q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];