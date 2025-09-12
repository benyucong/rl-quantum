OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[0], q[5]; // source to sink capacity
rz(0.7854) q[0]; // optimal phase rotation for flow calculation
cx q[1], q[2]; // intermediate nodes connection
rz(-0.4636) q[2]; 
cx q[1], q[5]; // connect source alternative path to sink
rz(0.0694) q[1];
cx q[2], q[4]; // direct flow from intermediate node to sink
rz(-0.9273) q[2];
cx q[3], q[2]; // connecting the other source to intermediate
rz(0.7854) q[3];
cx q[3], q[5]; // connect source to sink through intermediate
rz(-0.5583) q[3];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rz(0.1234) q[0]; // applying final rotations to refine solution
rz(0.5678) q[1];
rz(0.7890) q[2];
rz(-0.3456) q[3];
rz(0.1234) q[4];
rz(-0.5678) q[5];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];