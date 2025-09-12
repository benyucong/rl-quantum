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

rx(-0.7868) q[0];
cx q[0], q[3];
cx q[0], q[4];
cz q[0], q[6];
rz(0.9012) q[4];
rz(0.9921) q[6];
rz(-0.0619) q[3];

rx(-0.4326) q[1];
cx q[1], q[3];
cx q[1], q[5];
rz(0.7184) q[5];
rz(0.3457) q[3];

rx(-0.6129) q[2];
cx q[2], q[4];
cx q[2], q[5];
rz(-0.4321) q[4];
rz(0.3291) q[5];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];