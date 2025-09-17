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
rz(0.2256) q[2];
rz(0.2031) q[3];
rz(0.1923) q[4];
rz(0.2089) q[5];
rz(0.2198) q[6];
rz(0.2015) q[7];
rz(0.1972) q[8];
rz(0.2134) q[9];
rz(0.2067) q[10];
rz(0.2221) q[11];

// Layer 1: Problem-specific entangling gates (edge constraints)
// Edge 0-1
cx q[0], q[1];
rz(0.0357) q[1];
cx q[0], q[1];

// Edge 0-4
cx q[0], q[4];
rz(0.0321) q[4];
cx q[0], q[4];

// Edge 0-6
cx q[0], q[6];
rz(0.0389) q[6];
cx q[0], q[6];

// Edge 1-4
cx q[1], q[4];
rz(0.0298) q[4];
cx q[1], q[4];

// Edge 1-6
cx q[1], q[6];
rz(0.0342) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(0.0315) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.0364) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.0401) q[6];
cx q[2], q[6];

// Edge 3-4
cx q[3], q[4];
rz(0.0287) q[4];
cx q[3], q[4];

// Edge 3-6
cx q[3], q[6];
rz(0.0336) q[6];
cx q[3], q[6];

// Edge 4-5
cx q[4], q[5];
rz(0.0309) q[5];
cx q[4], q[5];

// Edge 5-6
cx q[5], q[6];
rz(0.0373) q[6];
cx q[5], q[6];

// Layer 2: Mixer and parameterized rotations
rz(0.1856) q[0];
rz(0.1763) q[1];
rz(0.1921) q[2];
rz(0.1814) q[3];
rz(0.1738) q[4];
rz(0.1872) q[5];
rz(0.1895) q[6];
rz(0.1792) q[7];
rz(0.1756) q[8];
rz(0.1843) q[9];
rz(0.1827) q[10];
rz(0.1908) q[11];

// Layer 2: Additional entangling for connectivity
cx q[7], q[8];
rz(0.0254) q[8];
cx q[7], q[8];

cx q[8], q[9];
rz(0.0268) q[9];
cx q[8], q[9];

cx q[9], q[10];
rz(0.0249) q[10];
cx q[9], q[10];

cx q[10], q[11];
rz(0.0273) q[11];
cx q[10], q[11];

// Layer 3: Final parameterized rotations
rz(0.1689) q[0];
rz(0.1624) q[1];
rz(0.1745) q[2];
rz(0.1658) q[3];
rz(0.1592) q[4];
rz(0.1716) q[5];
rz(0.1731) q[6];
rz(0.1637) q[7];
rz(0.1613) q[8];
rz(0.1692) q[9];
rz(0.1678) q[10];
rz(0.1729) q[11];

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