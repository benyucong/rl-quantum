OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize source and sink states
h q[0]; // Source qubit
h q[1]; // Intermediate qubit
h q[2]; // Intermediate qubit
h q[3]; // Sink qubit

// Corresponding controlled operations to simulate the flow
cx q[0], q[2]; // Edge 0 -> 2 (capacity 5)
rz(0.2469) q[2]; // Phase rotation based on capacity

cx q[0], q[3]; // Edge 0 -> 3 (capacity 1)
rz(0.2453) q[3]; // Phase rotation based on capacity

cx q[1], q[2]; // Edge 1 -> 2 (capacity 1)
rz(0.2534) q[2]; // Phase rotation based on capacity

cx q[1], q[3]; // Edge 1 -> 3 (capacity 6)
rz(0.2156) q[3]; // Phase rotation based on capacity

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];