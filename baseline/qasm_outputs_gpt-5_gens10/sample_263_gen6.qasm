OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Prepare the initial state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Entanglement based on the 3-clique connections
cx q[0], q[1]; // 0 <-> 1
cx q[0], q[2]; // 0 <-> 2
cx q[0], q[4]; // 0 <-> 5
cx q[1], q[2]; // 1 <-> 2
cx q[1], q[3]; // 1 <-> 4
cx q[2], q[3]; // 2 <-> 4

// Layer 2: Apply rotation gates for optimal measurement
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];