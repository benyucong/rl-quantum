OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
h q[0];
h q[1];
h q[2];
cx q[0], q[2]; // layer 1: connect source to inner node
rz(0.6146) q[2]; // rotation for edge (0, 2)
cx q[1], q[3]; // layer 2: connect inner to sink
rz(0.6795) q[3]; // rotation for edge (1, 3)
cx q[2], q[3]; // layer 2: connect inner to another node
rz(0.5637) q[3]; // rotation for edge (2, 3)
cx q[3], q[4]; // layer 3: connect inner node to sink
rz(0.7192) q[4]; // rotation for edge (2, 4)
cx q[1], q[4]; // layer 3: connect node back to sink
rz(0.7823) q[4]; // rotation for edge (3, 1)

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];