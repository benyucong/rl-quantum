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
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[4];
cx q[0], q[7];
cx q[0], q[8];

// Layer 2
rx(1.2345) q[1];
rx(1.4567) q[2];
rx(0.8765) q[4];
rx(1.2345) q[7];
rz(0.1234) q[0];
cx q[1], q[3];
cx q[2], q[6];
cx q[3], q[5];

// Layer 3
rz(-0.7890) q[1];
rz(0.4567) q[2];
rz(0.9876) q[3];
rz(0.1234) q[4];
rz(-0.5678) q[5];
rz(0.4321) q[6];
cx q[1], q[4];
cx q[2], q[5];
cx q[3], q[6];

// Layer 4
h q[0];
cz q[0], q[1];
cz q[0], q[2];
cz q[0], q[3];
cz q[0], q[5];
cz q[0], q[8];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];