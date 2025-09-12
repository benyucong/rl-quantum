OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits to the |+> state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply a layer of controlled rotations based on the matching graph
// The edges with different weights will determine the rotation angles
// The considered edges from the problem are:
// (0, 3), (0, 4), (0, 5), (1, 4), (1, 6), (2, 3), (2, 4), (2, 5)

rz(0.7527) q[0]; // angle derived from weight 8 (0, 3)
cx q[0], q[3];

rz(1.0048) q[0]; // angle derived from weight 17 (0, 4)
cx q[0], q[4];

rz(0.9514) q[0]; // angle derived from weight 15 (0, 5)
cx q[0], q[5];

rz(0.4939) q[1]; // angle derived from weight 5 (1, 4)
cx q[1], q[4];

rz(0.7452) q[1]; // angle derived from weight 11 (1, 6)
cx q[1], q[6];

rz(0.7578) q[2]; // angle derived from weight 17 (2, 3)
cx q[2], q[3];

rz(1.0048) q[2]; // angle derived from weight 17 (2, 4)
cx q[2], q[4];

rz(0.9514) q[2]; // angle derived from weight 6 (2, 5)
cx q[2], q[5];

// Measure the output from all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];