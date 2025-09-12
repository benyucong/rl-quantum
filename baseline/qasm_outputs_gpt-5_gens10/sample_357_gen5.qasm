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

// First layer with single-qubit rotations and entangling gates
rx(1.5708) q[0];
rz(0.7854) q[0];
rx(1.4276) q[1];
rz(0.3936) q[1];
rx(1.7205) q[2];
rz(0.5577) q[2];
rx(1.6352) q[3];
rz(0.5396) q[3];
rx(1.7894) q[4];
rz(0.4399) q[4];
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[2], q[3];
cx q[2], q[4];
cx q[3], q[4];

// Second layer with more rotations and entangling gates
rx(1.2993) q[5];
rz(0.4360) q[5];
rx(1.1342) q[6];
rz(0.5718) q[6];
cx q[5], q[6];
cx q[5], q[3];
cx q[5], q[4];
cx q[3], q[6];
cx q[4], q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];