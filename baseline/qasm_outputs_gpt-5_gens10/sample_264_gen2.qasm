OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Apply controlled gates based on the min_cut graph layout
cx q[0], q[2]; // Connects source 0 to 2
cx q[0], q[5]; // Connects source 0 to 5
cx q[0], q[6]; // Connects source 0 to 6
cx q[0], q[7]; // Connects source 0 to 7
cx q[1], q[2]; // Connects node 1 to 2
cx q[1], q[3]; // Connects node 1 to 3
cx q[1], q[4]; // Connects node 1 to 4
cx q[1], q[5]; // Connects node 1 to 5
cx q[1], q[6]; // Connects node 1 to 6
cx q[2], q[6]; // Connects 2 to 6
cx q[3], q[4]; // Connects 3 to 4
cx q[3], q[5]; // Connects 3 to 5
cx q[5], q[1]; // Connects 5 to 1
cx q[5], q[2]; // Connects 5 to 2
cx q[5], q[4]; // Connects 5 to 4
cx q[6], q[2]; // Connects 6 to 2
cx q[6], q[4]; // Connects 6 to 4
cx q[6], q[5]; // Connects 6 to 5

// Layer 3: Finalize state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];