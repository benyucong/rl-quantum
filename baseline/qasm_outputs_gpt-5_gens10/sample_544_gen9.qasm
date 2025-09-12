OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits
h q[0]; // Prepare source qubit
h q[1]; // Prepare intermediate qubit
h q[2]; // Prepare intermediate qubit
h q[3]; // Prepare sink qubit

// Apply entanglement based on edges capacities
cx q[0], q[2]; // Edge from source (0) to intermediate (2) - capacity 5
rz(0.4624) q[2]; // Rotation based on capacity
cx q[1], q[2]; // Edge from intermediate (1) to intermediate (2) - capacity 1
rz(-0.7854) q[2]; // Rotation based on capacity
cx q[0], q[3]; // Edge from source (0) to sink (3) - capacity 1
rz(-0.7854) q[3]; // Rotation based on capacity
cx q[1], q[3]; // Edge from intermediate (1) to sink (3) - capacity 6
rz(0.7854) q[3]; // Rotation based on capacity

// Additional entangling operations to prepare final states
h q[0];
h q[1];
h q[2];
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