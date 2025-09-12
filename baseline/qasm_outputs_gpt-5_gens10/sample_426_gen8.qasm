OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1
rx(1.2345) q[0];
rx(0.9876) q[1];
cx q[0], q[1];
rx(1.1122) q[2];
rx(1.3456) q[3];
cx q[2], q[3];
rz(0.5) q[1];
rz(0.7) q[3];

// Layer 2
h q[4];
h q[5];
h q[6];
h q[7];
rx(1.4567) q[4];
rz(0.5) q[4];
rx(1.6543) q[5];
rz(0.5) q[5];
cx q[4], q[5];
cx q[5], q[6];
cz q[4], q[6];

// Layer 3
rx(0.7890) q[6];
rz(0.3) q[6];
cx q[0], q[6];
cx q[1], q[7];
rx(0.1234) q[7];
rz(0.4) q[7];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];