OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

cx q[0], q[2]; // source to node 2
cx q[0], q[7]; // source to node 7
rz(0.1) q[2]; 
rz(0.2) q[7];

cx q[1], q[2]; // node 1 to node 2
cx q[1], q[4]; // node 1 to node 4
cx q[1], q[7]; // node 1 to node 7
rz(0.15) q[4];

cx q[2], q[1]; // node 2 to node 1
cx q[3], q[5]; // node 3 to node 5
rx(0.3) q[5]; 
rz(0.2) q[6]; // node 6 low capacity

cx q[3], q[8]; // node 3 to sink

cx q[4], q[2]; // node 4 to node 2
cx q[4], q[6]; // node 4 to node 6
rz(0.12) q[6]; 

cx q[6], q[3]; // node 6 to node 3
cx q[6], q[5]; // node 6 to node 5
cx q[7], q[2]; // node 7 to node 2
cx q[7], q[4]; // node 7 to node 4

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];