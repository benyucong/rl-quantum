OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// First layer of entanglement based on the min-cut structure
cx q[0], q[6]; // edge from 0 to 6
cx q[0], q[8]; // edge from 0 to 8
cx q[1], q[4]; // edge from 1 to 4
cx q[1], q[5]; // edge from 1 to 5
cx q[1], q[6]; // edge from 1 to 6
cx q[1], q[7]; // edge from 1 to 7
cx q[2], q[8]; // edge from 2 to 8
cx q[3], q[2]; // edge from 3 to 2
cx q[4], q[5]; // edge from 4 to 5
cx q[4], q[7]; // edge from 4 to 7
cx q[6], q[5]; // edge from 6 to 5
cx q[6], q[7]; // edge from 6 to 7
cx q[7], q[3]; // edge from 7 to 3
cx q[7], q[4]; // edge from 7 to 4
cx q[7], q[5]; // edge from 7 to 5

// Second layer of gates
rz(1.231) q[0];
rz(0.345) q[1];
rz(0.567) q[2];
rz(1.432) q[3];
rz(0.123) q[4];
rz(1.678) q[5];
rz(1.890) q[6];
rz(0.456) q[7];
rz(0.789) q[8];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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