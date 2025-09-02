OPENQASM 3.0;
include "stdgates.inc";
bit[2] c;
qubit[2] q;

// Initialize qubits
h q[0];
h q[1];

// First layer of entangling gates
cx q[0], q[1];

// Second layer of operations (rotation around the Z-axis)
rz(0.5) q[0];
rz(-0.5) q[1];

// Final entangling gate
cx q[1], q[0];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];