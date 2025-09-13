OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

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
h q[11];

rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.2251) q[2];
rz(0.2033) q[3];
rz(0.1928) q[4];
rz(0.2196) q[5];
rz(0.2082) q[6];
rz(0.1974) q[7];
rz(0.2119) q[8];
rz(0.2057) q[9];
rz(0.1893) q[10];
rz(0.2168) q[11];

// Layer 1: Problem-specific entangling gates (edge cover constraints)
// Edge 0-1
cx q[0], q[1];
rz(-0.0352) q[1];
cx q[0], q[1];

// Edge 0-4
cx q[0], q[4];
rz(-0.0287) q[4];
cx q[0], q[4];

// Edge 0-6
cx q[0], q[6];
rz(-0.0319) q[6];
cx q[0], q[6];

// Edge 1-4
cx q[1], q[4];
rz(-0.0264) q[4];
cx q[1], q[4];

// Edge 1-6
cx q[1], q[6];
rz(-0.0298) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(-0.0321) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(-0.0276) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(-0.0304) q[6];
cx q[2], q[6];

// Edge 3-4
cx q[3], q[4];
rz(-0.0259) q[4];
cx q[3], q[4];

// Edge 3-6
cx q[3], q[6];
rz(-0.0283) q[6];
cx q[3], q[6];

// Edge 4-5
cx q[4], q[5];
rz(-0.0247) q[5];
cx q[4], q[5];

// Edge 5-6
cx q[5], q[6];
rz(-0.0271) q[6];
cx q[5], q[6];

// Layer 2: Mixer and parameterized rotations
rz(0.1842) q[0];
rz(0.1729) q[1];
rz(0.1915) q[2];
rz(0.1783) q[3];
rz(0.1684) q[4];
rz(0.1876) q[5];
rz(0.1812) q[6];
rz(0.1708) q[7];
rz(0.1837) q[8];
rz(0.1791) q[9];
rz(0.1659) q[10];
rz(0.1892) q[11];

// Layer 2: Additional entangling for better convergence
cx q[0], q[7];
rz(-0.0183) q[7];
cx q[0], q[7];

cx q[1], q[8];
rz(-0.0176) q[8];
cx q[1], q[8];

cx q[2], q[9];
rz(-0.0192) q[9];
cx q[2], q[9];

cx q[3], q[10];
rz(-0.0179) q[10];
cx q[3], q[10];

cx q[4], q[11];
rz(-0.0168) q[11];
cx q[4], q[11];

// Layer 3: Final parameterized rotations
rz(0.1578) q[0];
rz(0.1492) q[1];
rz(0.1624) q[2];
rz(0.1527) q[3];
rz(0.1463) q[4];
rz(0.1598) q[5];
rz(0.1551) q[6];
rz(0.1476) q[7];
rz(0.1583) q[8];
rz(0.1539) q[9];
rz(0.1448) q[10];
rz(0.1612) q[11];

// Final measurements
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
c[11] = measure q[11];