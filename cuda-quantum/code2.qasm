OPENQASM 3.0;
include "stdgates.inc";
qubit[2] q;
rx(0.5) q[0];
rz(0.25) q[0];
rx(0.5) q[1];
rz(-0.25) q[1];
cx q[0], q[1];