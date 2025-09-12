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
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[5];
cx q[1], q[6];
cx q[2], q[3];
cx q[4], q[5];
cx q[4], q[6];
cx q[5], q[7];

// Layer 2
rz(1.324) q[0];
rz(-1.234) q[1];
rz(0.876) q[2];
rz(0.502) q[3];
rz(-0.432) q[4];
rz(0.251) q[5];
rz(-0.111) q[6];
rz(-0.305) q[7];
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[5];
cx q[1], q[6];
cx q[4], q[5];
cx q[4], q[6];
cx q[5], q[7];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(0.123) q[0];
rz(0.456) q[1];
rz(0.789) q[2];
rz(0.101) q[3];
rz(0.212) q[4];
rz(0.314) q[5];
rz(0.415) q[6];
rz(0.516) q[7];
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[5];
cx q[1], q[6];
cx q[2], q[3];
cx q[4], q[5];
cx q[4], q[6];
cx q[5], q[7];

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