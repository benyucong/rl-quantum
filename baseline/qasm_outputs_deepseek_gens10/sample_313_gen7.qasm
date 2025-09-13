OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem unitary for vertex cover
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1987) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2251) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1923) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.1836) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2079) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1764) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.2018) q[5];
cx q[2], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.1892) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1954) q[6];
cx q[4], q[6];

// Layer 1: Mixer unitary
h q[0];
rz(0.4321) q[0];
h q[0];
h q[1];
rz(0.4157) q[1];
h q[1];
h q[2];
rz(0.3986) q[2];
h q[2];
h q[3];
rz(0.3842) q[3];
h q[3];
h q[4];
rz(0.4268) q[4];
h q[4];
h q[5];
rz(0.4412) q[5];
h q[5];
h q[6];
rz(0.4093) q[6];
h q[6];

// Layer 2: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1841) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2087) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1782) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.1704) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.1928) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1637) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1873) q[5];
cx q[2], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.1756) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1812) q[6];
cx q[4], q[6];

// Layer 2: Mixer unitary
h q[0];
rz(0.4012) q[0];
h q[0];
h q[1];
rz(0.3857) q[1];
h q[1];
h q[2];
rz(0.3698) q[2];
h q[2];
h q[3];
rz(0.3564) q[3];
h q[3];
h q[4];
rz(0.3961) q[4];
h q[4];
h q[5];
rz(0.4093) q[5];
h q[5];
h q[6];
rz(0.3798) q[6];
h q[6];

// Layer 3: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.1839) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1708) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.1936) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1653) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.1581) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.1789) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1519) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1738) q[5];
cx q[2], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.1629) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1681) q[6];
cx q[4], q[6];

// Layer 3: Mixer unitary
h q[0];
rz(0.3721) q[0];
h q[0];
h q[1];
rz(0.3576) q[1];
h q[1];
h q[2];
rz(0.3430) q[2];
h q[2];
h q[3];
rz(0.3306) q[3];
h q[3];
h q[4];
rz(0.3674) q[4];
h q[4];
h q[5];
rz(0.3797) q[5];
h q[5];
h q[6];
rz(0.3523) q[6];
h q[6];

// Layer 4: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.1706) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1584) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.1796) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1533) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.1466) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.1660) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1409) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1612) q[5];
cx q[2], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.1511) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1559) q[6];
cx q[4], q[6];

// Layer 4: Mixer unitary
h q[0];
rz(0.3451) q[0];
h q[0];
h q[1];
rz(0.3316) q[1];
h q[1];
h q[2];
rz(0.3181) q[2];
h q[2];
h q[3];
rz(0.3066) q[3];
h q[3];
h q[4];
rz(0.3407) q[4];
h q[4];
h q[5];
rz(0.3521) q[5];
h q[5];
h q[6];
rz(0.3267) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];