OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply controlled rotations based on the max-flow graph
// Edges: (0 -> 2) [capacity 5], (0 -> 3) [capacity 1], (1 -> 2) [capacity 1], (1 -> 3) [capacity 6]
crz(1.57) q[0], q[2]; // Encode capacity from 0 to 2
crz(0.52) q[0], q[3]; // Encode capacity from 0 to 3
crz(0.52) q[1], q[2]; // Encode capacity from 1 to 2
crz(1.57) q[1], q[3]; // Encode capacity from 1 to 3

// Measure output qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];