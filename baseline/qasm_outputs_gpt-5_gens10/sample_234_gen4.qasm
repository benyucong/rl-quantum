OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer of operations based on capacities of edges
rx(0.7854) q[0]; // Angle based on edge between 0 and 1
rx(0.6435) q[1]; // Edge from 0 to 2
cx q[0], q[1];
cx q[0], q[2];
rz(0.1) q[1]; // Capacity adjustment for edge 1 to 6
cx q[1], q[6];
cx q[2], q[5]; 
rz(0.2) q[2]; // Capacity adjustment for edge 2 to 5
cx q[2], q[5];

// Second layer of operations
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rx(0.5) q[3]; // Edge from 3 to 4
rx(0.1) q[4]; // Edge from 3 to 7
cx q[3], q[4];
cx q[3], q[7];
rz(-0.1) q[4]; // Capacity adjustment for edge from 4 to 7
cx q[4], q[7];

rx(0.3) q[5]; // Edge from 5 to 1
cx q[5], q[1];
rx(0.4) q[5]; // Edge from 5 to 3
cx q[5], q[3];

rz(0.15) q[6]; // Edge from 6 to 1
cx q[6], q[1];
rz(0.25) q[6]; // Edge from 6 to 5
cx q[6], q[5];
rz(0.2) q[6]; // Edge from 6 to 7
cx q[6], q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];