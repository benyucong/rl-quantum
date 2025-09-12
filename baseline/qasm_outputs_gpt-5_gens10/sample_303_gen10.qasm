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

// First layer of operations
cx q[0], q[5];
rz(0.7654) q[5];
cx q[0], q[5];

cx q[1], q[5];
rz(0.8712) q[5];
cx q[1], q[5];

cx q[2], q[1];
rz(1.2345) q[1];
cx q[2], q[1];

cx q[2], q[3];
rz(0.5432) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.5567) q[4];
cx q[2], q[4];

cx q[3], q[6];
rz(1.0123) q[6];
cx q[3], q[6];

cx q[4], q[1];
rz(0.9888) q[1];
cx q[4], q[1];

// Second layer of operations
cx q[0], q[5];
rz(-0.7654) q[5];
cx q[0], q[5];

cx q[1], q[5];
rz(-0.8712) q[5];
cx q[1], q[5];

cx q[2], q[1];
rz(-1.2345) q[1];
cx q[2], q[1];

cx q[2], q[3];
rz(-0.5432) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(-0.5567) q[4];
cx q[2], q[4];

cx q[3], q[6];
rz(-1.0123) q[6];
cx q[3], q[6];

cx q[4], q[1];
rz(-0.9888) q[1];
cx q[4], q[1];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];