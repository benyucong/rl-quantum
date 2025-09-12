OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Entanglement operations based on edges
cx q[0], q[1]; // from source node 0 to 1
cx q[0], q[2]; // from source node 0 to 2
cx q[0], q[5]; // from source node 0 to 5
cx q[0], q[6]; // from source node 0 to 6
cx q[1], q[2]; // from node 1 to 2
cx q[1], q[5]; // from node 1 to 5
cx q[1], q[6]; // from node 1 to 6
cx q[2], q[3]; // from node 2 to 3
cx q[2], q[5]; // from node 2 to 5
cx q[3], q[6]; // from node 3 to 6
cx q[2], q[7]; // from node 2 to sink 7

// Layer 3: Apply phase rotations based on edge capacities
rz(0.5) q[1]; // capacity from 0 to 1
rz(0.8) q[2]; // capacity from 0 to 2
rz(0.6) q[5]; // capacity from 0 to 5
rz(0.4) q[6]; // capacity from 0 to 6
rz(0.3) q[3]; // capacity from 2 to 3
rz(0.3) q[5]; // capacity from 2 to 5
rz(0.1) q[6]; // capacity from 2 to 6
rz(0.6) q[7]; // capacity from 2 to 7
rz(0.5) q[6]; // capacity from 3 to 6

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];