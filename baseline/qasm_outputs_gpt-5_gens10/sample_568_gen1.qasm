OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initialize qubits with a Hadamard gate for superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First layer of entangling gates (Encoding flow paths)
cx q[0], q[5]; // Edge from source 0 to sink 5
rz(0.15) q[5];
cx q[1], q[2]; // Edge from node 1 to node 2 
rz(0.12) q[2];
cx q[1], q[5]; // Edge from node 1 to sink 5
rz(0.10) q[5];
cx q[2], q[4]; // Edge from node 2 to node 4
rz(0.13) q[4];
cx q[3], q[2]; // Edge from node 3 to node 2
rz(0.14) q[2];
cx q[3], q[5]; // Edge from node 3 to sink 5
rz(0.11) q[5];

// Second layer of entangling gates (Constructing flows)
cx q[0], q[1]; 
rz(0.09) q[1];
cx q[1], q[3];
rz(0.08) q[3];
cx q[2], q[4];
rz(0.07) q[4];
cx q[2], q[3];
rz(0.06) q[3];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];