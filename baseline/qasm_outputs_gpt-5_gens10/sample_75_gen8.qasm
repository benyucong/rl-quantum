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

cx q[0], q[2];
rz(1.2345) q[2];
cx q[0], q[2];

cx q[0], q[5];
rz(1.4567) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(1.6789) q[6];
cx q[0], q[6];

cx q[0], q[7];
rz(1.8901) q[7];
cx q[0], q[7];

cx q[1], q[2];
rz(0.1234) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.5678) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.9012) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(1.2345) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(1.4567) q[6];
cx q[1], q[6];

cx q[1], q[2];
rz(0.1111) q[2]; 
cx q[1], q[2];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];