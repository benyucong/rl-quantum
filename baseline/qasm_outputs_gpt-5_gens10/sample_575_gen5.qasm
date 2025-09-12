OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
cx q[0], q[3]; // Edge from source 0 to node 3
rz(0.1) q[3];
cx q[0], q[3];
cx q[0], q[4]; // Edge from source 0 to sink 4
rz(0.1) q[4];
cx q[0], q[4];
cx q[1], q[2]; // Edge from node 1 to node 2
rz(0.1) q[2];
cx q[1], q[2];
cx q[1], q[3]; // Edge from node 1 to node 3
rz(0.1) q[3];
cx q[1], q[3];
cx q[2], q[1]; // Edge back from node 2 to node 1
rz(0.1) q[1];
cx q[2], q[1];
cx q[2], q[4]; // Edge from node 2 to sink 4
rz(0.1) q[4];
cx q[2], q[4];
cx q[3], q[1]; // Edge from node 3 to node 1
rz(0.1) q[1];
cx q[3], q[1];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
rz(0.2) q[0];
rz(0.2) q[1];
rz(0.2) q[2];
rz(0.2) q[3];
rz(0.2) q[4];

h q[0];
cx q[0], q[3]; // Reapply edges for maximum flow
cz q[0], q[4]; // Constrain to the sink
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[4];
cx q[3], q[1];

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
c[9] = measure q[9];