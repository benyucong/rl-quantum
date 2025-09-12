OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initialize qubits
h q[0]; // Source
h q[1]; // Intermediate
h q[2]; // Intermediate
h q[3]; // Intermediate
h q[4]; // Sink
h q[5]; // Sink

// Quantum gates representing flow capacities
cx q[0], q[1]; // 1 unit from source to node 1
rz(1.047) q[1]; // Capacity condition on node 1
cx q[0], q[3]; // 2 units from source to node 3
rz(1.047) q[3]; // Capacity condition on node 3

cx q[1], q[2]; // Flow from node 1 to node 2
rz(1.047) q[2]; // Capacity condition on node 2
cx q[1], q[5]; // Flow from node 1 to sink
rz(1.047) q[5]; // Capacity condition at sink

cx q[2], q[1]; // Backward flow from node 2 to node 1
rz(1.047) q[1]; // Capacity condition on node 1

cx q[2], q[4]; // Flow from node 2 to node 4
rz(1.047) q[4]; // Capacity condition on node 4

cx q[4], q[1]; // Backflow from node 4 to node 1
rz(1.047) q[1]; // Capacity condition on node 1
cx q[4], q[2]; // Flow from node 4 to node 2
rz(1.047) q[2]; // Capacity condition on node 2

// Measure output state
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];