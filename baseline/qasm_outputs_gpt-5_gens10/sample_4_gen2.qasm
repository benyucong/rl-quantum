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
ccx q[0], q[1], q[2]; // Control q[0] and q[1] to q[2]
ccx q[0], q[3], q[4]; // Control q[0] and q[3] to q[4]
ccx q[1], q[5], q[6]; // Control q[1] and q[5] to q[6]
ccx q[3], q[4], q[7]; // Control q[3] and q[4] to q[7]
cx q[2], q[5]; // Control q[2] to q[5]
cx q[4], q[6]; // Control q[4] to q[6]
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];