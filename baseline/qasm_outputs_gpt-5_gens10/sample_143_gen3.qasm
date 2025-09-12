OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Create superposition
cx q[0], q[4]; // Edge from source to node 4
cx q[1], q[4]; // Edge from node 1 to node 4
cx q[2], q[3]; // Edge from node 2 to node 3
cx q[2], q[4]; // Edge from node 2 to node 4
cx q[2], q[5]; // Edge from node 2 to sink
cx q[3], q[2]; // Edge connecting nodes 2 and 3
cx q[4], q[5]; // Edge from node 4 to sink

// Layer 2: Apply phase shifts
rz(0.7854) q[0]; // Phase shift for input to source
rz(0.7854) q[1]; // Phase shift for input to node 1
rz(0.7854) q[2]; // Phase shift for node 2
rz(0.7854) q[3]; // Phase shift for node 3
rz(0.7854) q[4]; // Phase shift for node 4
rz(0.7854) q[5]; // Phase shift for sink

// Layer 3: Create entangled states
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[3];
cx q[2], q[4];
cx q[2], q[5];
cx q[3], q[2];
cx q[4], q[5];

// Layer 4: Final measurements
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];