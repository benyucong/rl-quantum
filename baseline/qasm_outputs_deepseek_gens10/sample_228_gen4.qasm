OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
// Layer 1: Initialization and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// First cost unitary
rz(0.7854) q[0];
rz(1.0472) q[1];
rz(0.7854) q[2];
rz(0.5236) q[3];
rz(0.3927) q[4];
rz(1.0472) q[5];
rz(0.7854) q[6];
rz(0.3927) q[7];
rz(0.5236) q[8];
// First mixing layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Layer 2: Second cost unitary
rz(0.6283) q[0];
rz(0.8378) q[1];
rz(0.6283) q[2];
rz(0.4189) q[3];
rz(0.3142) q[4];
rz(0.8378) q[5];
rz(0.6283) q[6];
rz(0.3142) q[7];
rz(0.4189) q[8];
// Second mixing layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Layer 3: Final cost unitary
rz(0.4712) q[0];
rz(0.6283) q[1];
rz(0.4712) q[2];
rz(0.3142) q[3];
rz(0.2356) q[4];
rz(0.6283) q[5];
rz(0.4712) q[6];
rz(0.2356) q[7];
rz(0.3142) q[8];
// Final mixing layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
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