OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize qubits to superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First layer of operations based on graph edges
cx q[0], q[2]; // capacity 6 from 0 to 2
cx q[1], q[3]; // capacity 1 from 1 to 3
cx q[1], q[4]; // capacity 4 from 1 to 4
cx q[2], q[4]; // capacity 4 from 2 to 4
cx q[3], q[2]; // capacity 3 from 3 to 2

// Second layer of operations
rz(0.1) q[0];  // parameterized rotation on q[0]
rz(0.2) q[1];  // parameterized rotation on q[1]
rz(0.3) q[2];  // parameterized rotation on q[2]
rz(0.4) q[3];  // parameterized rotation on q[3]
rz(0.5) q[4];  // parameterized rotation on q[4]

// Measure the output qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];