OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initialize qubits and apply Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply phase gates and entangling gates based on graph edges
cx q[0], q[1]; // edge: (1, 2)
rx(1.0) q[2]; // rotation for q[2]
h q[1];
cx q[0], q[3]; // edge: (1, 3)
rx(1.0) q[3]; // rotation for q[3]
cz q[1], q[3]; // edge: (2, 3)

// Layer 3: Apply rotations to enhance entanglement
rz(0.5) q[0];
rz(0.5) q[1];
rx(0.5) q[2];
rz(0.5) q[3];

// Layer 4: Final entangling and measurement
cx q[2], q[3];
h q[0];
h q[1];
h q[2];
h q[3];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];