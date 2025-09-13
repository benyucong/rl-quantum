OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1987) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2251) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2318) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1876) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.2034) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2198) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2265) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.2089) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.2156) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.2327) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1942) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1891) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4123) q[0];
h q[0];
h q[1];
rz(0.3987) q[1];
h q[1];
h q[2];
rz(0.3856) q[2];
h q[2];
h q[3];
rz(0.4218) q[3];
h q[3];
h q[4];
rz(0.4352) q[4];
h q[4];
h q[5];
rz(0.3679) q[5];
h q[5];
h q[6];
rz(0.3764) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1845) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2087) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2149) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1738) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1882) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2034) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2096) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1934) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1996) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.2154) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1798) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1752) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3821) q[0];
h q[0];
h q[1];
rz(0.3694) q[1];
h q[1];
h q[2];
rz(0.3572) q[2];
h q[2];
h q[3];
rz(0.3908) q[3];
h q[3];
h q[4];
rz(0.4031) q[4];
h q[4];
h q[5];
rz(0.3408) q[5];
h q[5];
h q[6];
rz(0.3487) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1837) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1712) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1934) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1992) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1612) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1745) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1886) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1944) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1793) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1851) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.1998) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1667) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1624) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3543) q[0];
h q[0];
h q[1];
rz(0.3424) q[1];
h q[1];
h q[2];
rz(0.3311) q[2];
h q[2];
h q[3];
rz(0.3622) q[3];
h q[3];
h q[4];
rz(0.3737) q[4];
h q[4];
h q[5];
rz(0.3161) q[5];
h q[5];
h q[6];
rz(0.3233) q[6];
h q[6];

// Layer 4 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1703) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1587) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1793) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1847) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1494) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1618) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1749) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1803) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1662) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1716) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.1853) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1545) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1506) q[6];
cx q[4], q[6];

// Layer 4 - Mixer Hamiltonian
h q[0];
rz(0.3285) q[0];
h q[0];
h q[1];
rz(0.3175) q[1];
h q[1];
h q[2];
rz(0.3070) q[2];
h q[2];
h q[3];
rz(0.3358) q[3];
h q[3];
h q[4];
rz(0.3465) q[4];
h q[4];
h q[5];
rz(0.2931) q[5];
h q[5];
h q[6];
rz(0.2997) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];