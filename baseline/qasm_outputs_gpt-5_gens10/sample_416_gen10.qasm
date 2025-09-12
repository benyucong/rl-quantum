OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Apply RZ and RX rotations for each qubit
rz(0.5) q[0];
rx(0.3) q[0];
rz(0.2) q[1];
rx(0.4) q[1];
rz(0.3) q[2];
rx(0.6) q[2];
rz(0.4) q[3];
rx(0.1) q[3];
rz(0.5) q[4];
rx(0.2) q[4];
rz(0.3) q[5];
rx(0.7) q[5];

// Create entanglements based on the graph structure
cx q[0], q[1]; // from source 0 to 1
cx q[0], q[4]; // from source 0 to 4
cx q[1], q[5]; // from node 1 to sink 5
cx q[2], q[1]; // from node 2 to node 1
cx q[2], q[4]; // from node 2 to node 4
cx q[2], q[5]; // from node 2 to sink 5
cx q[3], q[4]; // from node 3 to node 4
cx q[3], q[5]; // from node 3 to sink 5
cx q[4], q[3]; // from node 4 to node 3

// Layer 2: Another set of rotations
rz(0.3) q[0];
rx(0.4) q[0];
rz(0.1) q[1];
rx(0.5) q[1];
rz(0.2) q[2];
rx(0.3) q[2];
rz(0.4) q[3];
rx(0.6) q[3];
rz(0.3) q[4];
rx(0.2) q[4];
rz(0.5) q[5];
rx(0.3) q[5];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];