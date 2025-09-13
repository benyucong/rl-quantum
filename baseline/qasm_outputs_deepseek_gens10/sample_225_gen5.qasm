OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initial Hadamard and problem-specific unitaries
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Edge interactions for k=3 clique problem
// Triangle (0,1,2)
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
cx q[0], q[1];
rz(-0.3927) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(-0.3927) q[2];
cx q[1], q[2];
cx q[0], q[2];
rz(-0.3927) q[2];
cx q[0], q[2];

// Edge (2,4)
rz(0.5236) q[2];
rz(0.5236) q[4];
cx q[2], q[4];
rz(-0.2618) q[4];
cx q[2], q[4];

// Edge (4,3)
rz(0.5236) q[4];
rz(0.5236) q[3];
cx q[4], q[3];
rz(-0.2618) q[3];
cx q[4], q[3];

// Layer 2: Mixing and final optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Second round of problem unitaries
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
cx q[0], q[1];
rz(-0.1963) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(-0.1963) q[2];
cx q[1], q[2];
cx q[0], q[2];
rz(-0.1963) q[2];
cx q[0], q[2];

rz(0.2618) q[2];
rz(0.2618) q[4];
cx q[2], q[4];
rz(-0.1309) q[4];
cx q[2], q[4];

rz(0.2618) q[4];
rz(0.2618) q[3];
cx q[4], q[3];
rz(-0.1309) q[3];
cx q[4], q[3];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];