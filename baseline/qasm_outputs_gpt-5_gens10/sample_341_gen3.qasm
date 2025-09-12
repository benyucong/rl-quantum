OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// First layer of gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[2], q[3];
cx q[3], q[4];

// Parameterized rotations for the second layer
rz(0.64) q[0];
rz(0.78) q[1];
rz(0.32) q[2];
rz(0.56) q[3];
rz(0.45) q[4];

// Second layer of entangling gates
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[3];
cx q[2], q[4];
cx q[3], q[4];

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