OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer of operations
cx q[0], q[1]; // Connect source(0) to other nodes
cx q[0], q[7]; // Connect direct path to sink(7)
cx q[1], q[2]; // Assign capacity
cx q[1], q[3];
cx q[1], q[6];
cx q[2], q[3]; // Flow between nodes
cx q[2], q[4];
cx q[3], q[2]; // Backup flow
cx q[3], q[6];

// Second layer of operations
rz(0.5) q[0]; // Phase rotation based on capacity
rz(0.5) q[1];
rz(0.4) q[2];
rz(0.3) q[3];
rz(0.4) q[4];
rz(0.5) q[5];
rz(0.5) q[6];
rz(0.5) q[7];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];