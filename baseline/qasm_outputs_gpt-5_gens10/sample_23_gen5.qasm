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
cx q[0], q[4];
rz(0.4321) q[4];
cx q[0], q[4];
cx q[1], q[5];
rz(0.5478) q[5];
cx q[1], q[5];
cx q[2], q[6];
rz(0.3654) q[6];
cx q[2], q[6];
cx q[2], q[4];
rz(0.1234) q[4];
cx q[2], q[4];
cx q[3], q[7];
rz(0.3210) q[7];
cx q[3], q[7];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
cx q[0], q[4];
rz(0.5432) q[4];
cx q[0], q[4];
cx q[1], q[5];
rz(0.6543) q[5];
cx q[1], q[5];
cx q[2], q[6];
rz(0.4567) q[6];
cx q[2], q[6];
cx q[2], q[4];
rz(0.2345) q[4];
cx q[2], q[4];
cx q[3], q[7];
rz(0.6789) q[7];
cx q[3], q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];