OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialize the qubits
h q[0]; // Apply Hadamard to qubit 0
h q[1]; // Apply Hadamard to qubit 1
h q[2]; // Apply Hadamard to qubit 2

// Encoding the graph edges into the circuit
cx q[0], q[2]; // Edge between node 0 and node 2
cx q[2], q[1]; // Edge between node 2 and node 1

// Apply RZ rotations for graph coloring
rz(0.5) q[0]; // Apply rotation on qubit 0
rz(0.5) q[1]; // Apply rotation on qubit 1
rz(0.5) q[2]; // Apply rotation on qubit 2

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];