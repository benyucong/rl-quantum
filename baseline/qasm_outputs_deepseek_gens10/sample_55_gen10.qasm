OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
// Layer 1: Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Layer 1: Problem unitary for edge cover
// Edge (0,3)
cx q[0], q[3];
rz(0.2145) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1987) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2312) q[5];
cx q[0], q[5];
// Edge (1,5)
cx q[1], q[5];
rz(0.1876) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1763) q[3];
cx q[2], q[3];
// Edge (3,4)
cx q[3], q[4];
rz(0.2054) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.2198) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1921) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.1849) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.2083) q[6];
cx q[5], q[6];
// Layer 1: Mixing unitary
h q[0];
rz(0.4289) q[0];
h q[0];
h q[1];
rz(0.3752) q[1];
h q[1];
h q[2];
rz(0.3526) q[2];
h q[2];
h q[3];
rz(0.8037) q[3];
h q[3];
h q[4];
rz(0.5889) q[4];
h q[4];
h q[5];
rz(0.8473) q[5];
h q[5];
h q[6];
rz(0.5853) q[6];
h q[6];
// Layer 2: Problem unitary for edge cover
// Edge (0,3)
cx q[0], q[3];
rz(0.1983) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1841) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2142) q[5];
cx q[0], q[5];
// Edge (1,5)
cx q[1], q[5];
rz(0.1738) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1633) q[3];
cx q[2], q[3];
// Edge (3,4)
cx q[3], q[4];
rz(0.1903) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.2036) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1780) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.1713) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.1930) q[6];
cx q[5], q[6];
// Layer 2: Final mixing unitary
h q[0];
rz(0.3966) q[0];
h q[0];
h q[1];
rz(0.3476) q[1];
h q[1];
h q[2];
rz(0.3266) q[2];
h q[2];
h q[3];
rz(0.7446) q[3];
h q[3];
h q[4];
rz(0.5457) q[4];
h q[4];
h q[5];
rz(0.7851) q[5];
h q[5];
h q[6];
rz(0.5423) q[6];
h q[6];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];