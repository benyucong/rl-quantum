OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initializing qubits
h q[0]; // Prepare source state
h q[1]; // Prepare intermediate node
h q[2]; // Prepare intermediate node
h q[3]; // Prepare sink state

// Layer 1: encoding the graph's edges weights
cx q[0], q[1]; // 4 from src (node 0) to intermediate (node 1)
rz(0.1099) q[1]; // adjust based on capacity
cx q[1], q[2]; // 6 from intermediate (node 1) to intermediate (node 2)
rz(0.1685) q[2]; // adjust based on capacity
cx q[2], q[3]; // 3 from intermediate (node 2) to sink (node 3)
rz(0.0686) q[3]; // adjust based on capacity

// Layer 2: further interactions
h q[1];
h q[2];
cx q[1], q[3]; // forwarding flow to sink
rz(0.0541) q[3];
cx q[2], q[3]; // feedback from intermediate
rz(0.0377) q[3];

// Layer 3: interference of flows
h q[0];
h q[3];
cx q[0], q[3]; // flow from src to sink 
rz(0.0450) q[3];
cx q[1], q[3]; // feedback flow from intermediate node
rz(0.0231) q[3];

// Layer 4: final adjustments 
h q[0];
h q[1];
h q[2];
h q[3];
rz(-0.0075) q[3]; // final measure
h q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];