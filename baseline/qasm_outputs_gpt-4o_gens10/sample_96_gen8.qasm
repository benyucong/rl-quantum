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

// Layer 2: Apply controlled rotations based on the graph edges
rz(0.5) q[0]; // source to node 4
cx q[0], q[4];
rz(0.5) q[0]; // source to node 5
cx q[0], q[5];
rz(0.5) q[1]; // node 1 to node 3
cx q[1], q[3];
rz(0.5) q[1]; // node 1 to node 5
cx q[1], q[5];
rz(0.5) q[1]; // node 1 to sink
cx q[1], q[7];
rz(0.5) q[2]; // node 2 to node 1
cx q[2], q[1];
rz(0.5) q[2]; // node 2 to node 6
cx q[2], q[6];

// Layer 3: Further entanglement based on the graph structure
cx q[4], q[1];
rz(0.5) q[4]; // node 4 to node 1
cx q[4], q[1];
cx q[4], q[2];
rz(0.5) q[4]; // node 4 to node 3
cx q[4], q[3];
cx q[5], q[7]; // node 5 to sink
rz(0.5) q[5];
cx q[5], q[7];

// Layer 4: Finalize the circuit
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];