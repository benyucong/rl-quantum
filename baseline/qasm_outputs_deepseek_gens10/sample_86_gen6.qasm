OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard and parameterized rotations
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

// Edge interactions for layer 1
// Edge (0,4)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
// Edge (0,5)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
// Edge (0,6)
cx q[0], q[9];
rz(0.2231) q[9];
cx q[0], q[9];
// Edge (1,2)
cx q[1], q[10];
rz(0.1452) q[10];
cx q[1], q[10];
// Edge (1,3)
cx q[1], q[4];
rz(0.1678) q[4];
cx q[1], q[4];
// Edge (1,4)
cx q[1], q[7];
rz(0.1893) q[7];
cx q[1], q[7];
// Edge (2,4)
cx q[2], q[7];
rz(0.1765) q[7];
cx q[2], q[7];
// Edge (2,6)
cx q[2], q[9];
rz(0.2019) q[9];
cx q[2], q[9];
// Edge (3,4)
cx q[3], q[7];
rz(0.1821) q[7];
cx q[3], q[7];
// Edge (3,5)
cx q[3], q[8];
rz(0.1954) q[8];
cx q[3], q[8];
// Edge (5,6)
cx q[5], q[9];
rz(0.2087) q[9];
cx q[5], q[9];

// Layer 2: Mixer and parameterized rotations
h q[0];
rz(0.4321) q[0];
h q[0];
h q[1];
rz(0.4156) q[1];
h q[1];
h q[2];
rz(0.3987) q[2];
h q[2];
h q[3];
rz(0.4213) q[3];
h q[3];
h q[4];
rz(0.3879) q[4];
h q[4];
h q[5];
rz(0.4098) q[5];
h q[5];
h q[6];
rz(0.3765) q[6];
h q[6];

// Edge interactions for layer 2
// Edge (0,4)
cx q[0], q[7];
rz(0.1983) q[7];
cx q[0], q[7];
// Edge (0,5)
cx q[0], q[8];
rz(0.1842) q[8];
cx q[0], q[8];
// Edge (0,6)
cx q[0], q[9];
rz(0.2067) q[9];
cx q[0], q[9];
// Edge (1,2)
cx q[1], q[10];
rz(0.1348) q[10];
cx q[1], q[10];
// Edge (1,3)
cx q[1], q[4];
rz(0.1559) q[4];
cx q[1], q[4];
// Edge (1,4)
cx q[1], q[7];
rz(0.1756) q[7];
cx q[1], q[7];
// Edge (2,4)
cx q[2], q[7];
rz(0.1638) q[7];
cx q[2], q[7];
// Edge (2,6)
cx q[2], q[9];
rz(0.1874) q[9];
cx q[2], q[9];
// Edge (3,4)
cx q[3], q[7];
rz(0.1692) q[7];
cx q[3], q[7];
// Edge (3,5)
cx q[3], q[8];
rz(0.1813) q[8];
cx q[3], q[8];
// Edge (5,6)
cx q[5], q[9];
rz(0.1937) q[9];
cx q[5], q[9];

// Layer 3: Final mixer and parameterized rotations
h q[0];
rz(0.4012) q[0];
h q[0];
h q[1];
rz(0.3857) q[1];
h q[1];
h q[2];
rz(0.3703) q[2];
h q[2];
h q[3];
rz(0.3916) q[3];
h q[3];
h q[4];
rz(0.3601) q[4];
h q[4];
h q[5];
rz(0.3809) q[5];
h q[5];
h q[6];
rz(0.3498) q[6];
h q[6];

// Edge interactions for layer 3
// Edge (0,4)
cx q[0], q[7];
rz(0.1837) q[7];
cx q[0], q[7];
// Edge (0,5)
cx q[0], q[8];
rz(0.1706) q[8];
cx q[0], q[8];
// Edge (0,6)
cx q[0], q[9];
rz(0.1915) q[9];
cx q[0], q[9];
// Edge (1,2)
cx q[1], q[10];
rz(0.1251) q[10];
cx q[1], q[10];
// Edge (1,3)
cx q[1], q[4];
rz(0.1447) q[4];
cx q[1], q[4];
// Edge (1,4)
cx q[1], q[7];
rz(0.1629) q[7];
cx q[1], q[7];
// Edge (2,4)
cx q[2], q[7];
rz(0.1519) q[7];
cx q[2], q[7];
// Edge (2,6)
cx q[2], q[9];
rz(0.1738) q[9];
cx q[2], q[9];
// Edge (3,4)
cx q[3], q[7];
rz(0.1569) q[7];
cx q[3], q[7];
// Edge (3,5)
cx q[3], q[8];
rz(0.1682) q[8];
cx q[3], q[8];
// Edge (5,6)
cx q[5], q[9];
rz(0.1796) q[9];
cx q[5], q[9];

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