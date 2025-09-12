OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

cx q[0], q[5];
cx q[0], q[6];
cx q[1], q[6];
cx q[1], q[7];
cx q[1], q[8];
cx q[2], q[5];
cx q[2], q[7];
cx q[3], q[5];
cx q[3], q[8];

// Layer 2
rz(0.34) q[0];
rz(0.23) q[1];
rz(0.19) q[2];
rz(0.12) q[3];
rz(0.15) q[4];
rz(0.40) q[5];
rz(0.35) q[6];
rz(0.38) q[7];
rz(0.33) q[8];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

cx q[0], q[5];
cx q[0], q[6];
cx q[1], q[6];
cx q[1], q[7];
cx q[1], q[8];
cx q[2], q[5];
cx q[2], q[7];
cx q[3], q[5];
cx q[3], q[8];

// Layer 4
rz(0.22) q[0];
rz(0.18) q[1];
rz(0.25) q[2];
rz(0.16) q[3];
rz(0.14) q[4];
rz(0.29) q[5];
rz(0.32) q[6];
rz(0.15) q[7];
rz(0.37) q[8];

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