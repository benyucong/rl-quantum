OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Edge (0,2) interaction
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];

// Edge (0,3) interaction
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

// Edge (0,1) interaction
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge (1,4) interaction
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Edge (0,2) interaction
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];

// Edge (0,3) interaction
cx q[0], q[3];
rz(0.5236) q[3];
cx q[0], q[3];

// Edge (0,1) interaction
cx q[0], q[1];
rz(0.5236) q[1];
cx q[0], q[1];

// Edge (1,4) interaction
cx q[1], q[4];
rz(0.5236) q[4];
cx q[1], q[4];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Edge (0,2) interaction
cx q[0], q[2];
rz(0.3491) q[2];
cx q[0], q[2];

// Edge (0,3) interaction
cx q[0], q[3];
rz(0.3491) q[3];
cx q[0], q[3];

// Edge (0,1) interaction
cx q[0], q[1];
rz(0.3491) q[1];
cx q[0], q[1];

// Edge (1,4) interaction
cx q[1], q[4];
rz(0.3491) q[4];
cx q[1], q[4];

// Final mixing layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];