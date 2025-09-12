OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initial Hadamard gates to create superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Encodings for the edges of the graph
cx q[0], q[1]; // Edge: 0 -> 1
rz(1.1513) q[1]; // Capacity: 1
cx q[1], q[2]; // Edge: 1 -> 2
rz(5.4825) q[2]; // Capacity: 5
cx q[1], q[3]; // Edge: 1 -> 3
rz(4.1076) q[3]; // Capacity: 4
cx q[2], q[4]; // Edge: 2 -> 4
rz(4.5631) q[4]; // Capacity: 5
cx q[2], q[5]; // Edge: 2 -> 5
rz(2.3542) q[5]; // Capacity: 2
cx q[4], q[5]; // Edge: 4 -> 5
rz(1.8904) q[5]; // Capacity: 2

// Layer 3: Additional layer to ensure entanglement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 4: Final rotations and measurements
rz(0.8923) q[0];
rz(0.4532) q[1];
rz(1.0678) q[2];
rz(0.7654) q[3];
rz(0.4321) q[4];
rz(0.6543) q[5];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];