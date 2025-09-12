OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

rz(1.2567) q[0];
rz(0.4321) q[1];
rz(1.7894) q[2];
rz(0.7715) q[3];
rz(1.1111) q[4];
rz(0.5432) q[5];
rz(1.6543) q[6];
rz(0.9876) q[7];
cx q[0], q[1];
cx q[2], q[3];
cx q[4], q[5];
cx q[6], q[7];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

rz(0.1579) q[0];
rz(0.7689) q[1];
rz(0.9451) q[2];
rz(0.2543) q[3];
rz(0.3210) q[4];
rz(0.4567) q[5];
rz(0.8765) q[6];
rz(0.1123) q[7];
cx q[0], q[1];
cx q[2], q[3];
cx q[4], q[5];
cx q[6], q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];