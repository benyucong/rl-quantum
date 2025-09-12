OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1 - Initialization
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2 - Entangling gates based on edges
cx q[0], q[1]; // edge between 0 and 1
cx q[1], q[2]; // edge between 1 and 2
cx q[1], q[3]; // edge between 1 and 3
cx q[1], q[4]; // edge between 1 and 4

// Layer 3 - Apply rotation gates
rz(0.1234) q[0];
rz(0.5678) q[1];
rz(0.8765) q[2];
rz(0.4321) q[3];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];