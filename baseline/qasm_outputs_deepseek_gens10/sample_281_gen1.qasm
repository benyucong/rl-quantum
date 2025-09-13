OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;
h q[0];
h q[1];
h q[2];
h q[3];
// Hyperedge [1,3]
cx q[1], q[3];
rz(-0.25) q[3];
cx q[1], q[3];
// Hyperedge [0,2,3]
cx q[0], q[2];
cx q[2], q[3];
rz(-0.1667) q[3];
cx q[2], q[3];
cx q[0], q[2];
// Mixer layer
h q[0];
rz(0.5) q[0];
h q[0];
h q[1];
rz(0.5) q[1];
h q[1];
h q[2];
rz(0.5) q[2];
h q[2];
h q[3];
rz(0.5) q[3];
h q[3];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];