OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
cx q[0], q[2];  // reflect capacity from source to intermediate
rx(1.2) q[2];   // parameterized rotation
cx q[1], q[3];  // reflect capacity from node 1 to node 3
rx(1.1) q[3];   // parameterized rotation
cx q[1], q[4];  // reflect capacity from node 1 to node 4
rx(1.3) q[4];   // parameterized rotation
cx q[2], q[4];  // reflect capacity between node 2 and node 4
rx(1.0) q[2];   // parameterized rotation
cx q[2], q[5];  // reflect capacity from node 2 to sink
rx(1.4) q[5];   // parameterized rotation
cx q[3], q[2];  // reflect back towards source
rx(0.8) q[2];   // parameterized rotation
cx q[4], q[6];  // reflect towards sink
rx(0.9) q[6];   // parameterized rotation
cx q[5], q[1];  // redundant path consideration
rx(1.5) q[1];   // parameterized rotation
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];