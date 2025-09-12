OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Create entanglements based on min-cut graph
cx q[0], q[1]; // 0 -> 1
cx q[0], q[5]; // 0 -> 5
cx q[1], q[5]; // 1 -> 5
cx q[2], q[4]; // 2 -> 4
cx q[3], q[4]; // 3 -> 4
cx q[4], q[1]; // 4 -> 1
cx q[4], q[3]; // 4 -> 3
cx q[4], q[5]; // 4 -> 5

// Layer 3: Apply rotations to enhance encoding
rz(0.4636) q[0];
rz(0.2318) q[1];
rz(0.1545) q[2];
rz(0.5781) q[3];
rz(0.4000) q[4];
rz(0.1963) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];