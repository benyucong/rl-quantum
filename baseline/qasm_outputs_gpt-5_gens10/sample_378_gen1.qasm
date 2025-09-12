OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

rz(1.2345) q[0];
cx q[0], q[1];
rz(1.6789) q[1];
cx q[1], q[2];
rz(0.4567) q[2];

rz(2.3456) q[0];
cx q[0], q[3];
rz(1.2345) q[3];
cx q[3], q[4];
rz(3.4567) q[4];

rx(2.9712) q[0];
rx(1.7892) q[1];
rx(1.4568) q[2];
rx(2.1134) q[3];
rx(0.7890) q[4];

h q[0];
cx q[0], q[1];
h q[1];
cx q[1], q[2];
h q[2];

h q[3];
cx q[3], q[4];
h q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];