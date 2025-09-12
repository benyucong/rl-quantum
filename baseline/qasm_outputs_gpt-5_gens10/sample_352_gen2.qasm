OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1
h q[0]; // Prepare superposition for source
h q[1]; // Prepare superposition for source
h q[2]; // Prepare superposition for source
h q[4]; // Prepare nodes for connection

// Encoding edges with controlled gates for flows
cx q[0], q[4]; // Edge from 0 to 4
cx q[1], q[4]; // Edge from 1 to 4
cx q[2], q[3]; // Edge from 2 to 3
cx q[2], q[4]; // Edge from 2 to 4
cx q[2], q[5]; // Edge from 2 to 5
cx q[3], q[2]; // Edge from 3 to 2
cx q[4], q[5]; // Edge from 4 to 5

// Layer 2
h q[0];
h q[1];
h q[2];
h q[4];
rz(-0.5) q[4]; // Apply rotation to adjust amplitudes

h q[0];
h q[1];
h q[2];
h q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];