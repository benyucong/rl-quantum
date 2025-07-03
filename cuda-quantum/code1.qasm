OPENQASM 3.0;
include "stdgates.inc";
qubit[2] q;
rx(0.55) q[0];
rz(0.20) q[0];
rx(0.45) q[1];
rz(-0.30) q[1];
cx q[0], q[1];