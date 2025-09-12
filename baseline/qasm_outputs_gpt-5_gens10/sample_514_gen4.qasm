OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

rx(1.428) q[0];
rx(1.214) q[1];
rx(0.842) q[2];
rx(1.321) q[3];
rx(0.764) q[4];
rx(0.965) q[5];

cz q[0], q[1];
cz q[1], q[2];
cz q[2], q[3];
cz q[2], q[4];
cz q[2], q[5];

rx(0.397) q[0];
rx(1.341) q[1];
rx(1.052) q[2];
rx(0.713) q[3];
rx(0.829) q[4];
rx(1.112) q[5];

cz q[0], q[1];
cz q[1], q[2];
cz q[2], q[3];
cz q[2], q[4];
cz q[2], q[5];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];