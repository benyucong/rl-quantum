OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1
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

// Layer 2
rz(0.1234) q[0];
cx q[0], q[1];
rz(0.5678) q[1];
cx q[1], q[2];
rz(0.9101) q[2];
cx q[2], q[3];
rz(0.1121) q[3];
cx q[3], q[4];
rz(0.3141) q[4];
cx q[4], q[5];
rz(0.5161) q[5];
cx q[5], q[6];

// Layer 3
rz(0.4242) q[6];
cx q[6], q[7];
rz(0.2222) q[7];
cx q[7], q[8];
rz(0.3333) q[8];
cx q[8], q[9];
rz(0.1110) q[9]; 
cx q[9], q[0];

// Layer 4
h q[0];
rz(0.7354) q[0];
h q[0];
h q[1];
rz(0.8524) q[1];
h q[1];
h q[2];
rz(0.0987) q[2];
h q[2];
h q[3];
rz(0.5432) q[3];
h q[3];
h q[4];
rz(0.6789) q[4];
h q[4];
h q[5];
rz(0.3456) q[5];
h q[5];
h q[6];
rz(0.5431) q[6];
h q[6];
h q[7];
rz(0.3012) q[7];
h q[7];
h q[8];
rz(0.1234) q[8];
h q[8];
h q[9];
rz(0.7890) q[9];
h q[9];

// Measurement
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