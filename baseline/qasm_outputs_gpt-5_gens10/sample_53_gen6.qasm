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

rx(1.256) q[0];
rz(0.788) q[0];
rx(1.328) q[6];
rz(0.422) q[6];
rx(1.152) q[1];
rz(0.562) q[1];
rx(1.198) q[3];
rz(0.876) q[3];
rx(1.018) q[5];
rz(0.682) q[5];

// Layer 2
cx q[0], q[6];
cx q[1], q[3];
cx q[2], q[1];
cx q[3], q[5];
cx q[5], q[8];
cx q[6], q[7];

rz(-0.0275) q[0];
rz(-0.0923) q[2];
rz(-0.0641) q[1];
rz(-0.0547) q[5];
rz(-0.0394) q[4];
rz(-0.0883) q[8];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Measure
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];