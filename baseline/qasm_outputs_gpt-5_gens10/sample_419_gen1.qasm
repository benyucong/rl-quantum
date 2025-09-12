OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First layer of entangling gates
cx q[0], q[2]; // Source node connections
cx q[0], q[5]; // Source to sink
cx q[2], q[1]; // Graph edges
cx q[2], q[4]; // Graph edges
cx q[3], q[2]; // Graph edges
cx q[3], q[5]; // Graph edges
cx q[4], q[1]; // Graph edges
cx q[4], q[3]; // Graph edges
cx q[4], q[5]; // Graph edges

// Second layer of angle rotations based on capacities
rz(0.6345) q[0];
rz(0.1234) q[1];
rz(0.8765) q[2];
rz(0.5432) q[3];
rz(0.9876) q[4];
rz(0.2345) q[5];

// Final layer of measurement gates
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