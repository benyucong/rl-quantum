OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// First layer of parameterized rotations
rx(1.2054) q[0];
ry(0.4989) q[1];
rx(1.8231) q[2];
ry(0.3711) q[3];
rx(1.9634) q[4];
ry(0.2288) q[5];

// Entangling gates to capture the graph structure
cx q[0], q[1];
cx q[0], q[3];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];
cx q[4], q[5];

// Second layer of parameterized rotations
rz(-0.4672) q[0];
rz(0.1473) q[1];
rz(-0.9219) q[2];
rz(0.9220) q[3];
rz(-0.1505) q[4];
rz(0.7269) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];