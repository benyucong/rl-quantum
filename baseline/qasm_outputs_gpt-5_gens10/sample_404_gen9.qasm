OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];

rx(2.2142) q[0];
rx(1.1765) q[1];
rx(1.3671) q[2];
rx(1.1543) q[3];
rx(0.1234) q[4];
rx(1.4829) q[5];
rx(0.9654) q[6];
rx(1.8756) q[7];
rx(1.3421) q[8];
rx(0.7563) q[9];
rx(0.4342) q[10];
rx(1.0959) q[11];

cx q[0], q[2];
cx q[1], q[3];
cx q[0], q[6];
cx q[0], q[7];
cx q[1], q[5];
cx q[1], q[8];
cx q[2], q[10];

rz(-0.0456) q[3];
cx q[3], q[1];
cx q[2], q[3];
cx q[4], q[3];
cx q[5], q[3];
cx q[6], q[8];
cx q[6], q[10];
cx q[7], q[5];

rz(-0.0135) q[0];
rz(-0.0983) q[1];
rz(0.0578) q[2];
rz(0.0870) q[4];
rz(0.0445) q[5];
rz(0.0953) q[6];
rz(-0.0242) q[7];

measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
measure q[4] -> c[4];
measure q[5] -> c[5];
measure q[6] -> c[6];
measure q[7] -> c[7];
measure q[8] -> c[8];
measure q[9] -> c[9];
measure q[10] -> c[10];
measure q[11] -> c[11];