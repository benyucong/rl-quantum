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
cx q[0], q[2]; // Edge from 0 to 2 (capacity: 3)
rz(0.8980) q[2]; 
cx q[0], q[2];
cx q[0], q[5]; // Edge from 0 to 5 (capacity: 1)
rz(1.0472) q[5];
cx q[0], q[5];
cx q[2], q[1]; // Edge from 2 to 1 (capacity: 3)
rz(0.7549) q[1];
cx q[2], q[1];
cx q[2], q[4]; // Edge from 2 to 4 (capacity: 3)
rz(0.7074) q[4];
cx q[2], q[4];
cx q[3], q[2]; // Edge from 3 to 2 (capacity: 3)
rz(1.2832) q[2];
cx q[3], q[2];
cx q[3], q[5]; // Edge from 3 to 5 (capacity: 2)
rz(1.2045) q[5];
cx q[3], q[5];
cx q[4], q[1]; // Edge from 4 to 1 (capacity: 3)
rz(0.5642) q[1];
cx q[4], q[1];
cx q[4], q[3]; // Edge from 4 to 3 (capacity: 1)
rz(0.7854) q[3];
cx q[4], q[3];
cx q[4], q[5]; // Edge from 4 to 5 (capacity: 1)
rz(1.3963) q[5];
cx q[4], q[5];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];