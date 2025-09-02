OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Layer 1: Initialize qubits
h q[0]; h q[1]; h q[2]; h q[3];

// Layer 2: Apply controlled rotations based on edges of the graph
// Edges: (0,1), (0,2), (0,3), (1,2), (1,3), (2,3)
cx q[0], q[1];
rz(0.7854) q[1];  // RZ for color differentiation
cx q[0], q[1];

cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];

cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Layer 3: Apply additional rotations to optimize the state
rz(0.5236) q[0];
rz(0.5236) q[1];
rz(0.5236) q[2];
rz(0.5236) q[3];

// Layer 4: Finalize and measure
h q[0]; h q[1]; h q[2]; h q[3];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];