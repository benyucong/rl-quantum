OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize all qubits to |+⟩ state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First layer of entangling gates based on the edges in the graph
cx q[0], q[1];  // Edge (0, 1)
cx q[0], q[3];  // Edge (0, 3)
cx q[1], q[2];  // Edge (1, 2)
cx q[1], q[3];  // Edge (1, 3)
cx q[4], q[6];  // Edge (4, 6)
cx q[5], q[6];  // Edge (5, 6)

// Second layer of entangling gates to enhance connectivity
cx q[0], q[3];
cx q[1], q[3];
cx q[4], q[5];

// Rotate qubits to adjust phase
rz(0.5) q[0];
rz(0.5) q[1];
rz(0.5) q[2];
rz(0.5) q[3];
rz(0.5) q[4];
rz(0.5) q[5];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];