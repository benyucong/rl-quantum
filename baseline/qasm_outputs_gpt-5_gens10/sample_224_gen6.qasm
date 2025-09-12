OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initializations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Optimization for min_cut problem
rx(1.0201) q[0];
ry(0.4902) q[1];
rz(0.2153) q[2];
rx(1.3567) q[3];
ry(0.8459) q[4];
rz(0.9812) q[5];
rx(1.1234) q[6];
ry(0.4777) q[7];
rz(0.5439) q[8];

// Entanglement via CNOTs
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[2], q[5];
cx q[2], q[6];
cx q[3], q[7];
cx q[4], q[8];
cx q[6], q[7];
cx q[5], q[8];

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