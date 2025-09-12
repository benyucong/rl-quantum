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

// First layer of gates
cx q[0], q[1]; // Connect source to node 1
rz(0.3498) q[1];
cx q[0], q[1];

cx q[0], q[2]; // Connect source to node 2
rz(0.4653) q[2];
cx q[0], q[2];

cx q[0], q[4]; // Connect source to node 4
rz(0.1822) q[4];
cx q[0], q[4];

cx q[0], q[6]; // Connect source to node 6
rz(0.6937) q[6];
cx q[0], q[6];

cx q[0], q[7]; // Connect source to sink
rz(0.3010) q[7];
cx q[0], q[7];

// Second layer of gates
cx q[1], q[6]; // Node 1 to node 6
rz(0.5660) q[6];
cx q[1], q[6];

cx q[2], q[1]; // Node 2 to node 1
rz(0.7744) q[1];
cx q[2], q[1];

cx q[2], q[7]; // Node 2 to sink
rz(0.2235) q[7];
cx q[2], q[7];

cx q[3], q[2]; // Node 3 to node 2
rz(0.4448) q[2];
cx q[3], q[2];

cx q[3], q[4]; // Node 3 to node 4
rz(0.9735) q[4];
cx q[3], q[4];

cx q[5], q[1]; // Node 5 to node 1
rz(0.8642) q[1];
cx q[5], q[1];

cx q[5], q[2]; // Node 5 to node 2
rz(0.1221) q[2];
cx q[5], q[2];

cx q[6], q[3]; // Node 6 to node 3
rz(0.6308) q[3];
cx q[6], q[3];

// Final layer for measurement
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