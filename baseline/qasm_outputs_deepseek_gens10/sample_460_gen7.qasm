OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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

// Layer 1: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1987) q[4];
cx q[0], q[4];
// Edge (0,6)
cx q[0], q[6];
rz(0.2312) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1876) q[2];
cx q[1], q[2];
// Edge (1,6)
cx q[1], q[6];
rz(0.2053) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.1924) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.2198) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1765) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1842) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.2271) q[6];
cx q[4], q[6];

// Layer 1: Mixing
h q[0];
rz(0.4231) q[0];
h q[0];
h q[1];
rz(0.3987) q[1];
h q[1];
h q[2];
rz(0.4125) q[2];
h q[2];
h q[3];
rz(0.3876) q[3];
h q[3];
h q[4];
rz(0.4352) q[4];
h q[4];
h q[5];
rz(0.4019) q[5];
h q[5];
h q[6];
rz(0.4468) q[6];
h q[6];
h q[7];
rz(0.3764) q[7];
h q[7];
h q[8];
rz(0.3821) q[8];
h q[8];
h q[9];
rz(0.3793) q[9];
h q[9];

// Layer 2: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1842) q[4];
cx q[0], q[4];
// Edge (0,6)
cx q[0], q[6];
rz(0.2137) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1739) q[2];
cx q[1], q[2];
// Edge (1,6)
cx q[1], q[6];
rz(0.1904) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.1785) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.2036) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1637) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1708) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.2103) q[6];
cx q[4], q[6];

// Layer 2: Mixing
h q[0];
rz(0.3924) q[0];
h q[0];
h q[1];
rz(0.3698) q[1];
h q[1];
h q[2];
rz(0.3827) q[2];
h q[2];
h q[3];
rz(0.3594) q[3];
h q[3];
h q[4];
rz(0.4036) q[4];
h q[4];
h q[5];
rz(0.3726) q[5];
h q[5];
h q[6];
rz(0.4142) q[6];
h q[6];
h q[7];
rz(0.3491) q[7];
h q[7];
h q[8];
rz(0.3543) q[8];
h q[8];
h q[9];
rz(0.3517) q[9];
h q[9];

// Layer 3: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[1];
rz(0.1839) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1708) q[4];
cx q[0], q[4];
// Edge (0,6)
cx q[0], q[6];
rz(0.1982) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1613) q[2];
cx q[1], q[2];
// Edge (1,6)
cx q[1], q[6];
rz(0.1765) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.1655) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1888) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1518) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1584) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1950) q[6];
cx q[4], q[6];

// Layer 3: Mixing
h q[0];
rz(0.3638) q[0];
h q[0];
h q[1];
rz(0.3429) q[1];
h q[1];
h q[2];
rz(0.3548) q[2];
h q[2];
h q[3];
rz(0.3332) q[3];
h q[3];
h q[4];
rz(0.3742) q[4];
h q[4];
h q[5];
rz(0.3455) q[5];
h q[5];
h q[6];
rz(0.3840) q[6];
h q[6];
h q[7];
rz(0.3237) q[7];
h q[7];
h q[8];
rz(0.3285) q[8];
h q[8];
h q[9];
rz(0.3261) q[9];
h q[9];

// Layer 4: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[1];
rz(0.1705) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1584) q[4];
cx q[0], q[4];
// Edge (0,6)
cx q[0], q[6];
rz(0.1838) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1496) q[2];
cx q[1], q[2];
// Edge (1,6)
cx q[1], q[6];
rz(0.1636) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.1534) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1751) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1407) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1469) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1808) q[6];
cx q[4], q[6];

// Layer 4: Mixing
h q[0];
rz(0.3373) q[0];
h q[0];
h q[1];
rz(0.3179) q[1];
h q[1];
h q[2];
rz(0.3290) q[2];
h q[2];
h q[3];
rz(0.3090) q[3];
h q[3];
h q[4];
rz(0.3470) q[4];
h q[4];
h q[5];
rz(0.3203) q[5];
h q[5];
h q[6];
rz(0.3561) q[6];
h q[6];
h q[7];
rz(0.3001) q[7];
h q[7];
h q[8];
rz(0.3046) q[8];
h q[8];
h q[9];
rz(0.3024) q[9];
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