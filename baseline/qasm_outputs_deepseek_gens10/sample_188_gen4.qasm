OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;
// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(0.214) q[0];
rz(0.214) q[1];
rz(0.214) q[2];
rz(0.214) q[3];
rz(0.214) q[4];
rz(0.214) q[5];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(0.428) q[0];
rz(0.428) q[1];
rz(0.428) q[2];
rz(0.428) q[3];
rz(0.428) q[4];
rz(0.428) q[5];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(0.642) q[0];
rz(0.642) q[1];
rz(0.642) q[2];
rz(0.642) q[3];
rz(0.642) q[4];
rz(0.642) q[5];
// Final Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];