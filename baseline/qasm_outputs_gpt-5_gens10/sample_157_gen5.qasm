OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initialization and Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2: Controlled-X and rotation gates based on capacities
cx q[0], q[3]; // source to edge
cx q[0], q[4]; // source to edge
cx q[0], q[6]; // source to edge

rz(-0.1843) q[3]; // weight modification for edge capacities
cx q[1], q[3]; // edge from node 1 to 3
rz(-0.1843) q[4]; // weight modification for edge capacities
cx q[1], q[5]; // edge from node 1 to 5

cx q[2], q[5]; // edge from node 2 to 5
cx q[2], q[6]; // edge from node 2 to sink

cx q[3], q[2]; // edge from node 3 to 2
cx q[5], q[3]; // edge from node 5 to 3

// Layer 3: Final rotations and Hadamard gates before measurement
rz(0.1923) q[3];
rz(0.1923) q[4];
rz(0.1923) q[5];
rz(0.1923) q[6];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];