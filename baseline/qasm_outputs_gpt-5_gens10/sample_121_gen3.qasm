OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Prepare qubits with Hadamard gates for superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Encoding the connections based on the edges of the graph
cx q[0], q[1]; // 0 -- 1
cx q[0], q[2]; // 0 -- 2
cx q[0], q[3]; // 0 -- 3
cx q[1], q[2]; // 1 -- 2
cx q[1], q[3]; // 1 -- 3
cx q[2], q[3]; // 2 -- 3
cx q[3], q[4]; // 3 -- 4
cx q[3], q[5]; // 3 -- 5

// Layer 3: Final rotations to maximize probability of correct outcomes
rz(1.5708) q[0]; // π/2 rotation for q[0]
rz(1.5708) q[1]; // π/2 rotation for q[1]
rz(1.5708) q[2]; // π/2 rotation for q[2]
rz(1.5708) q[3]; // π/2 rotation for q[3]
rz(1.5708) q[4]; // π/2 rotation for q[4]
rz(1.5708) q[5]; // π/2 rotation for q[5]

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];