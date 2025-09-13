OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Edge 0-4 (weight 3)
rz(0.2356) q[0];
rz(0.2356) q[4];
// Edge 0-7 (weight 12)
rz(0.9425) q[0];
rz(0.9425) q[7];
// Edge 0-5 (weight 12)
rz(0.9425) q[0];
rz(0.9425) q[5];
// Edge 1-5 (weight 6)
rz(0.4712) q[1];
rz(0.4712) q[5];
// Edge 1-6 (weight 11)
rz(0.8639) q[1];
rz(0.8639) q[6];
// Edge 1-10 (weight 14) - Note: qubit 10 not available, using 8 as proxy
rz(1.0996) q[1];
rz(1.0996) q[8];
// Edge 2-6 (weight 7)
rz(0.5498) q[2];
rz(0.5498) q[6];
// Edge 3-7 (weight 8)
rz(0.6283) q[3];
rz(0.6283) q[7];
// Edge 3-9 (weight 16) - Note: qubit 9 not available, using 8 as proxy
rz(1.2566) q[3];
rz(1.2566) q[8];

// Layer 2: Mixing and optimization
h q[0];
rz(0.3927) q[0];
h q[0];
h q[1];
rz(0.3927) q[1];
h q[1];
h q[2];
rz(0.3927) q[2];
h q[2];
h q[3];
rz(0.3927) q[3];
h q[3];
h q[4];
rz(0.3927) q[4];
h q[4];
h q[5];
rz(0.3927) q[5];
h q[5];
h q[6];
rz(0.3927) q[6];
h q[6];
h q[7];
rz(0.3927) q[7];
h q[7];
h q[8];
rz(0.3927) q[8];
h q[8];

// Layer 3: Final optimization and measurement
h q[0];
rz(0.1963) q[0];
h q[0];
h q[1];
rz(0.1963) q[1];
h q[1];
h q[2];
rz(0.1963) q[2];
h q[2];
h q[3];
rz(0.1963) q[3];
h q[3];
h q[4];
rz(0.1963) q[4];
h q[4];
h q[5];
rz(0.1963) q[5];
h q[5];
h q[6];
rz(0.1963) q[6];
h q[6];
h q[7];
rz(0.1963) q[7];
h q[7];
h q[8];
rz(0.1963) q[8];
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