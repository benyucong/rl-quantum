OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard gates
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

// Layer 1: Problem unitary for edge cover
// Edge (0,3)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
cx q[3], q[7];
rz(0.2145) q[7];
cx q[3], q[7];

// Edge (0,5)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
cx q[5], q[8];
rz(0.1987) q[8];
cx q[5], q[8];

// Edge (1,2)
cx q[1], q[9];
rz(0.2251) q[9];
cx q[1], q[9];
cx q[2], q[9];
rz(0.2251) q[9];
cx q[2], q[9];

// Edge (1,3)
cx q[1], q[10];
rz(0.2034) q[10];
cx q[1], q[10];
cx q[3], q[10];
rz(0.2034) q[10];
cx q[3], q[10];

// Edge (1,6)
cx q[1], q[7];
rz(0.1923) q[7];
cx q[1], q[7];
cx q[6], q[7];
rz(0.1923) q[7];
cx q[6], q[7];

// Edge (2,3)
cx q[2], q[8];
rz(0.2189) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(0.2189) q[8];
cx q[3], q[8];

// Edge (2,6)
cx q[2], q[9];
rz(0.2076) q[9];
cx q[2], q[9];
cx q[6], q[9];
rz(0.2076) q[9];
cx q[6], q[9];

// Edge (3,5)
cx q[3], q[10];
rz(0.2112) q[10];
cx q[3], q[10];
cx q[5], q[10];
rz(0.2112) q[10];
cx q[5], q[10];

// Edge (4,5)
cx q[4], q[7];
rz(0.1865) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.1865) q[7];
cx q[5], q[7];

// Edge (4,6)
cx q[4], q[8];
rz(0.1958) q[8];
cx q[4], q[8];
cx q[6], q[8];
rz(0.1958) q[8];
cx q[6], q[8];

// Edge (5,6)
cx q[5], q[9];
rz(0.2021) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.2021) q[9];
cx q[6], q[9];

// Layer 1: Mixer unitary
h q[0];
rz(0.4231) q[0];
h q[0];
h q[1];
rz(0.4231) q[1];
h q[1];
h q[2];
rz(0.4231) q[2];
h q[2];
h q[3];
rz(0.4231) q[3];
h q[3];
h q[4];
rz(0.4231) q[4];
h q[4];
h q[5];
rz(0.4231) q[5];
h q[5];
h q[6];
rz(0.4231) q[6];
h q[6];

// Layer 2: Problem unitary
cx q[0], q[7];
rz(0.3218) q[7];
cx q[0], q[7];
cx q[3], q[7];
rz(0.3218) q[7];
cx q[3], q[7];
cx q[0], q[8];
rz(0.2981) q[8];
cx q[0], q[8];
cx q[5], q[8];
rz(0.2981) q[8];
cx q[5], q[8];
cx q[1], q[9];
rz(0.3377) q[9];
cx q[1], q[9];
cx q[2], q[9];
rz(0.3377) q[9];
cx q[2], q[9];
cx q[1], q[10];
rz(0.3051) q[10];
cx q[1], q[10];
cx q[3], q[10];
rz(0.3051) q[10];
cx q[3], q[10];
cx q[1], q[7];
rz(0.2885) q[7];
cx q[1], q[7];
cx q[6], q[7];
rz(0.2885) q[7];
cx q[6], q[7];
cx q[2], q[8];
rz(0.3284) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(0.3284) q[8];
cx q[3], q[8];
cx q[2], q[9];
rz(0.3114) q[9];
cx q[2], q[9];
cx q[6], q[9];
rz(0.3114) q[9];
cx q[6], q[9];
cx q[3], q[10];
rz(0.3168) q[10];
cx q[3], q[10];
cx q[5], q[10];
rz(0.3168) q[10];
cx q[5], q[10];
cx q[4], q[7];
rz(0.2798) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.2798) q[7];
cx q[5], q[7];
cx q[4], q[8];
rz(0.2937) q[8];
cx q[4], q[8];
cx q[6], q[8];
rz(0.2937) q[8];
cx q[6], q[8];
cx q[5], q[9];
rz(0.3032) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.3032) q[9];
cx q[6], q[9];

// Layer 2: Mixer unitary
h q[0];
rz(0.6347) q[0];
h q[0];
h q[1];
rz(0.6347) q[1];
h q[1];
h q[2];
rz(0.6347) q[2];
h q[2];
h q[3];
rz(0.6347) q[3];
h q[3];
h q[4];
rz(0.6347) q[4];
h q[4];
h q[5];
rz(0.6347) q[5];
h q[5];
h q[6];
rz(0.6347) q[6];
h q[6];

// Layer 3: Problem unitary
cx q[0], q[7];
rz(0.4291) q[7];
cx q[0], q[7];
cx q[3], q[7];
rz(0.4291) q[7];
cx q[3], q[7];
cx q[0], q[8];
rz(0.3974) q[8];
cx q[0], q[8];
cx q[5], q[8];
rz(0.3974) q[8];
cx q[5], q[8];
cx q[1], q[9];
rz(0.4502) q[9];
cx q[1], q[9];
cx q[2], q[9];
rz(0.4502) q[9];
cx q[2], q[9];
cx q[1], q[10];
rz(0.4068) q[10];
cx q[1], q[10];
cx q[3], q[10];
rz(0.4068) q[10];
cx q[3], q[10];
cx q[1], q[7];
rz(0.3846) q[7];
cx q[1], q[7];
cx q[6], q[7];
rz(0.3846) q[7];
cx q[6], q[7];
cx q[2], q[8];
rz(0.4378) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(0.4378) q[8];
cx q[3], q[8];
cx q[2], q[9];
rz(0.4152) q[9];
cx q[2], q[9];
cx q[6], q[9];
rz(0.4152) q[9];
cx q[6], q[9];
cx q[3], q[10];
rz(0.4224) q[10];
cx q[3], q[10];
cx q[5], q[10];
rz(0.4224) q[10];
cx q[5], q[10];
cx q[4], q[7];
rz(0.3730) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.3730) q[7];
cx q[5], q[7];
cx q[4], q[8];
rz(0.3916) q[8];
cx q[4], q[8];
cx q[6], q[8];
rz(0.3916) q[8];
cx q[6], q[8];
cx q[5], q[9];
rz(0.4043) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.4043) q[9];
cx q[6], q[9];

// Layer 3: Mixer unitary
h q[0];
rz(0.8462) q[0];
h q[0];
h q[1];
rz(0.8462) q[1];
h q[1];
h q[2];
rz(0.8462) q[2];
h q[2];
h q[3];
rz(0.8462) q[3];
h q[3];
h q[4];
rz(0.8462) q[4];
h q[4];
h q[5];
rz(0.8462) q[5];
h q[5];
h q[6];
rz(0.8462) q[6];
h q[6];

// Layer 4: Problem unitary
cx q[0], q[7];
rz(0.5364) q[7];
cx q[0], q[7];
cx q[3], q[7];
rz(0.5364) q[7];
cx q[3], q[7];
cx q[0], q[8];
rz(0.4967) q[8];
cx q[0], q[8];
cx q[5], q[8];
rz(0.4967) q[8];
cx q[5], q[8];
cx q[1], q[9];
rz(0.5628) q[9];
cx q[1], q[9];
cx q[2], q[9];
rz(0.5628) q[9];
cx q[2], q[9];
cx q[1], q[10];
rz(0.5085) q[10];
cx q[1], q[10];
cx q[3], q[10];
rz(0.5085) q[10];
cx q[3], q[10];
cx q[1], q[7];
rz(0.4808) q[7];
cx q[1], q[7];
cx q[6], q[7];
rz(0.4808) q[7];
cx q[6], q[7];
cx q[2], q[8];
rz(0.5473) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(0.5473) q[8];
cx q[3], q[8];
cx q[2], q[9];
rz(0.5190) q[9];
cx q[2], q[9];
cx q[6], q[9];
rz(0.5190) q[9];
cx q[6], q[9];
cx q[3], q[10];
rz(0.5280) q[10];
cx q[3], q[10];
cx q[5], q[10];
rz(0.5280) q[10];
cx q[5], q[10];
cx q[4], q[7];
rz(0.4663) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.4663) q[7];
cx q[5], q[7];
cx q[4], q[8];
rz(0.4895) q[8];
cx q[4], q[8];
cx q[6], q[8];
rz(0.4895) q[8];
cx q[6], q[8];
cx q[5], q[9];
rz(0.5054) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.5054) q[9];
cx q[6], q[9];

// Layer 4: Mixer unitary
h q[0];
rz(1.0577) q[0];
h q[0];
h q[1];
rz(1.0577) q[1];
h q[1];
h q[2];
rz(1.0577) q[2];
h q[2];
h q[3];
rz(1.0577) q[3];
h q[3];
h q[4];
rz(1.0577) q[4];
h q[4];
h q[5];
rz(1.0577) q[5];
h q[5];
h q[6];
rz(1.0577) q[6];
h q[6];

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
c[10] = measure q[10];