OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0]; // Prepare the source qubit
h q[1]; // Prepare the second node qubit
h q[2]; // Prepare the third node qubit
h q[3]; // Prepare the fourth node qubit
h q[4]; // Prepare the fifth node qubit
h q[5]; // Prepare the sixth node qubit
h q[6]; // Prepare the seventh node qubit
h q[7]; // Prepare the eighth node qubit
h q[8]; // Prepare the sink qubit

// Layer 2 - entangle based on edges
cx q[0], q[3]; // source to node 4
cx q[0], q[8]; // source to sink
cx q[1], q[3]; // inter-node edge
cx q[1], q[6]; // inter-node edge
cx q[2], q[5]; // inter-node edge
cx q[3], q[1]; // reversed edge
cx q[3], q[5]; // connection
cx q[6], q[4]; // outgoing connection
cx q[7], q[1]; // connection from node 8
cx q[7], q[5]; // connection to node 6

// Layer 3 - apply phase rotations based on capacities
rz(0.5) q[3]; // Capacity influence on node 4
rz(0.5) q[5]; // Capacity influence on node 6
rz(0.5) q[6]; // Capacity influence on node 5
rz(0.5) q[8]; // Capacity influence on sink

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];