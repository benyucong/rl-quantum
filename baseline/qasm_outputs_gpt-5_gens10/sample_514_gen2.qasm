OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Prepare the qubits in an initial state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled rotations based on edges
// Edges are (0, 1), (1, 2), (2, 3), (2, 5), (2, 4)
cx q[0], q[1]; // edge 0-1
rz(0.5236) q[1]; // rotation for edge 0-1
cx q[0], q[1]; // reapply controlled rotation

cx q[1], q[2]; // edge 1-2
rz(0.5236) q[2]; // rotation for edge 1-2
cx q[1], q[2]; // reapply controlled rotation

cx q[2], q[3]; // edge 2-3
rz(0.5236) q[3]; // rotation for edge 2-3
cx q[2], q[3]; // reapply controlled rotation

cx q[2], q[5]; // edge 2-5
rz(0.5236) q[5]; // rotation for edge 2-5
cx q[2], q[5]; // reapply controlled rotation

cx q[2], q[4]; // edge 2-4
rz(0.5236) q[4]; // rotation for edge 2-4
cx q[2], q[4]; // reapply controlled rotation

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];