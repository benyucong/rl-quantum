OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer of operations based on the graph edges 
// encoding the capacities
cx q[0], q[1]; // Edge 0 -> 1
rz(-0.1745) q[1]; 
cx q[0], q[1];

cx q[0], q[4]; // Edge 0 -> 4
rz(-0.5389) q[4];
cx q[0], q[4];

cx q[0], q[5]; // Edge 0 -> 5
rz(-0.1234) q[5];
cx q[0], q[5];

cx q[0], q[6]; // Edge 0 -> 6
rz(-0.4563) q[6];
cx q[0], q[6];

cx q[1], q[2]; // Edge 1 -> 2
rz(-0.6543) q[2];
cx q[1], q[2];

cx q[1], q[3]; // Edge 1 -> 3
rz(-0.2311) q[3];
cx q[1], q[3];

cx q[1], q[5]; // Edge 1 -> 5
rz(-0.1238) q[5];
cx q[1], q[5];

cx q[1], q[6]; // Edge 1 -> 6
rz(-0.8765) q[6];
cx q[1], q[6];

// Second layer to entangle the outputs further
cx q[2], q[3]; // Edge 2 -> 3
rz(-0.3421) q[3];
cx q[2], q[3];

cx q[2], q[4]; // Edge 2 -> 4
rz(-0.1111) q[4];
cx q[2], q[4];

cx q[3], q[4]; // Edge 3 -> 4
rz(-0.5555) q[4];
cx q[3], q[4];

cx q[4], q[7]; // Final connection to sink
rz(-0.9288) q[7];
cx q[4], q[7];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measurement of the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];