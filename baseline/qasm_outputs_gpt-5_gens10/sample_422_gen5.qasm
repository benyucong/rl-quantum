OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

h q[0];
h q[1];
rx(1.5708) q[2]; // Rotation to encode initial state for node 2
rx(1.5708) q[3]; // Rotation to encode initial state for node 3
cx q[0], q[2];
cx q[1], q[3];
rz(-0.5) q[2]; // Adjust phase for edge (0,2)
rz(-0.5) q[3]; // Adjust phase for edge (0,3)

cx q[0], q[1]; // Entangle qubit 0 and qubit 1
h q[0]; // Hadamard to prepare for measurement

cx q[2], q[3]; // Entangle qubit 2 and qubit 3
h q[2]; // Hadamard to prepare for measurement

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];