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
cx q[0], q[2];  // Connect source 0 to target 2
rz(2.2896) q[2];
cx q[0], q[2];
cx q[0], q[3];  // Connect source 0 to target 3
rz(2.0897) q[3];
cx q[0], q[3];
cx q[0], q[4];  // Connect source 0 to target 4
rz(1.0472) q[4];
cx q[0], q[4];
cx q[0], q[5];  // Connect source 0 to target 5
rz(1.7325) q[5];
cx q[0], q[5];
cx q[0], q[6];  // Connect source 0 to target 6
rz(1.5708) q[6];
cx q[0], q[6];
cx q[1], q[8];  // Connect source 1 to target 8
rz(1.6650) q[8];
cx q[1], q[8];
cx q[2], q[1];  // Connect source 2 to target 1
rz(1.3350) q[1];
cx q[2], q[1];
cx q[2], q[7];  // Connect source 2 to target 7
rz(0.8559) q[7];
cx q[2], q[7];
cx q[3], q[1];  // Connect source 3 to target 1
rz(0.9603) q[1];
cx q[3], q[1];
cx q[3], q[2];  // Connect source 3 to target 2
rz(1.2000) q[2];
cx q[3], q[2];
cx q[3], q[5];  // Connect source 3 to target 5
rz(0.5500) q[5];
cx q[3], q[5];
cx q[3], q[6];  // Connect source 3 to target 6
rz(0.4100) q[6];
cx q[3], q[6];
cx q[4], q[1];  // Connect source 4 to target 1
rz(0.7200) q[1];
cx q[4], q[1];
cx q[4], q[3];  // Connect source 4 to target 3
rz(1.0000) q[3];
cx q[4], q[3];
cx q[4], q[5];  // Connect source 4 to target 5
rz(2.2000) q[5];
cx q[4], q[5];
cx q[4], q[7];  // Connect source 4 to target 7
rz(1.5708) q[7];
cx q[4], q[7];
cx q[5], q[2];  // Connect source 5 to target 2
rz(1.0488) q[2];
cx q[5], q[2];
cx q[5], q[4];  // Connect source 5 to target 4
rz(1.5708) q[4];
cx q[5], q[4];
cx q[5], q[6];  // Connect source 5 to target 6
rz(0.8905) q[6];
cx q[5], q[6];
cx q[7], q[4];  // Connect source 7 to target 4
rz(1.5708) q[4];
cx q[7], q[4];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
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