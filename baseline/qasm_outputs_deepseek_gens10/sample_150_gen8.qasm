OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1 - Initialization and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem Hamiltonian (edge constraints)
// Edge 0-1
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Edge 0-3
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];

// Edge 0-4
cx q[0], q[4];
rz(0.2251) q[4];
cx q[0], q[4];

// Edge 1-3
cx q[1], q[3];
rz(0.1863) q[3];
cx q[1], q[3];

// Edge 1-4
cx q[1], q[4];
rz(0.2128) q[4];
cx q[1], q[4];

// Edge 1-6
cx q[1], q[6];
rz(0.2039) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(0.1924) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.2087) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.1998) q[6];
cx q[2], q[6];

// Edge 3-5
cx q[3], q[5];
rz(0.2042) q[5];
cx q[3], q[5];

// Edge 3-6
cx q[3], q[6];
rz(0.1953) q[6];
cx q[3], q[6];

// Edge 4-5
cx q[4], q[5];
rz(0.2216) q[5];
cx q[4], q[5];

// Edge 5-6
cx q[5], q[6];
rz(0.2169) q[6];
cx q[5], q[6];

// Layer 2 - Mixing Hamiltonian
rx(1.4832) q[0];
rx(1.4765) q[1];
rx(1.4891) q[2];
rx(1.4728) q[3];
rx(1.4957) q[4];
rx(1.4814) q[5];
rx(1.4789) q[6];

// Layer 2 - Problem Hamiltonian
// Edge 0-1
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];

// Edge 0-3
cx q[0], q[3];
rz(0.1832) q[3];
cx q[0], q[3];

// Edge 0-4
cx q[0], q[4];
rz(0.2081) q[4];
cx q[0], q[4];

// Edge 1-3
cx q[1], q[3];
rz(0.1724) q[3];
cx q[1], q[3];

// Edge 1-4
cx q[1], q[4];
rz(0.1973) q[4];
cx q[1], q[4];

// Edge 1-6
cx q[1], q[6];
rz(0.1889) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(0.1781) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.1932) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.1848) q[6];
cx q[2], q[6];

// Edge 3-5
cx q[3], q[5];
rz(0.1891) q[5];
cx q[3], q[5];

// Edge 3-6
cx q[3], q[6];
rz(0.1807) q[6];
cx q[3], q[6];

// Edge 4-5
cx q[4], q[5];
rz(0.2052) q[5];
cx q[4], q[5];

// Edge 5-6
cx q[5], q[6];
rz(0.2008) q[6];
cx q[5], q[6];

// Layer 3 - Mixing Hamiltonian
rx(1.5218) q[0];
rx(1.5154) q[1];
rx(1.5273) q[2];
rx(1.5098) q[3];
rx(1.5332) q[4];
rx(1.5196) q[5];
rx(1.5172) q[6];

// Layer 3 - Problem Hamiltonian
// Edge 0-1
cx q[0], q[1];
rz(0.1827) q[1];
cx q[0], q[1];

// Edge 0-3
cx q[0], q[3];
rz(0.1689) q[3];
cx q[0], q[3];

// Edge 0-4
cx q[0], q[4];
rz(0.1918) q[4];
cx q[0], q[4];

// Edge 1-3
cx q[1], q[3];
rz(0.1592) q[3];
cx q[1], q[3];

// Edge 1-4
cx q[1], q[4];
rz(0.1821) q[4];
cx q[1], q[4];

// Edge 1-6
cx q[1], q[6];
rz(0.1745) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(0.1643) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.1784) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.1708) q[6];
cx q[2], q[6];

// Edge 3-5
cx q[3], q[5];
rz(0.1747) q[5];
cx q[3], q[5];

// Edge 3-6
cx q[3], q[6];
rz(0.1671) q[6];
cx q[3], q[6];

// Edge 4-5
cx q[4], q[5];
rz(0.1896) q[5];
cx q[4], q[5];

// Edge 5-6
cx q[5], q[6];
rz(0.1854) q[6];
cx q[5], q[6];

// Layer 4 - Mixing Hamiltonian
rx(1.5589) q[0];
rx(1.5528) q[1];
rx(1.5642) q[2];
rx(1.5473) q[3];
rx(1.5693) q[4];
rx(1.5563) q[5];
rx(1.5541) q[6];

// Layer 4 - Problem Hamiltonian
// Edge 0-1
cx q[0], q[1];
rz(0.1684) q[1];
cx q[0], q[1];

// Edge 0-3
cx q[0], q[3];
rz(0.1557) q[3];
cx q[0], q[3];

// Edge 0-4
cx q[0], q[4];
rz(0.1763) q[4];
cx q[0], q[4];

// Edge 1-3
cx q[1], q[3];
rz(0.1468) q[3];
cx q[1], q[3];

// Edge 1-4
cx q[1], q[4];
rz(0.1674) q[4];
cx q[1], q[4];

// Edge 1-6
cx q[1], q[6];
rz(0.1605) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(0.1514) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.1643) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.1574) q[6];
cx q[2], q[6];

// Edge 3-5
cx q[3], q[5];
rz(0.1611) q[5];
cx q[3], q[5];

// Edge 3-6
cx q[3], q[6];
rz(0.1542) q[6];
cx q[3], q[6];

// Edge 4-5
cx q[4], q[5];
rz(0.1748) q[5];
cx q[4], q[5];

// Edge 5-6
cx q[5], q[6];
rz(0.1709) q[6];
cx q[5], q[6];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];