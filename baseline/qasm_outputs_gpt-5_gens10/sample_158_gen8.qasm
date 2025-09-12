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
h q[8];

cx q[0], q[3];
rz(-0.0452) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(-0.0421) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(-0.0385) q[5];
cx q[0], q[5];

cx q[0], q[7];
rz(-0.0523) q[7];
cx q[0], q[7];

cx q[1], q[4];
rz(-0.0407) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(-0.0476) q[5];
cx q[1], q[5];

cx q[1], q[7];
rz(-0.0480) q[7];
cx q[1], q[7];

cx q[1], q[8];
rz(-0.0432) q[8];
cx q[1], q[8];

cx q[2], q[4];
rz(-0.0465) q[4];
cx q[2], q[4];

cx q[2], q[7];
rz(-0.0448) q[7];
cx q[2], q[7];

cx q[3], q[5];
rz(-0.0399) q[5];
cx q[3], q[5];

cx q[3], q[7];
rz(-0.0479) q[7];
cx q[3], q[7];

cx q[4], q[6];
rz(-0.0501) q[6];
cx q[4], q[6];

cx q[4], q[8];
rz(-0.0423) q[8];
cx q[4], q[8];

cx q[5], q[7];
rz(-0.0413) q[7];
cx q[5], q[7];

cx q[6], q[8];
rz(-0.0494) q[8];
cx q[6], q[8];

h q[0];
rz(0.0514) q[0];
h q[0];

h q[1];
rz(0.0537) q[1];
h q[1];

h q[2];
rz(0.0499) q[2];
h q[2];

h q[3];
rz(0.0462) q[3];
h q[3];

h q[4];
rz(0.0450) q[4];
h q[4];

h q[5];
rz(0.0425) q[5];
h q[5];

h q[6];
rz(0.0511) q[6];
h q[6];

h q[7];
rz(0.0467) q[7];
h q[7];

h q[8];
rz(0.0453) q[8];
h q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];