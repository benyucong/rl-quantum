OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;
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
// Layer 1
// Edge (0,2)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
cx q[2], q[7];
rz(0.2145) q[7];
cx q[2], q[7];
// Edge (0,3)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
cx q[3], q[8];
rz(0.1987) q[8];
cx q[3], q[8];
// Edge (0,4)
cx q[0], q[9];
rz(0.2251) q[9];
cx q[0], q[9];
cx q[4], q[9];
rz(0.2251) q[9];
cx q[4], q[9];
// Edge (0,5)
cx q[0], q[10];
rz(0.2318) q[10];
cx q[0], q[10];
cx q[5], q[10];
rz(0.2318) q[10];
cx q[5], q[10];
// Edge (0,6)
cx q[0], q[7];
rz(0.2083) q[7];
cx q[0], q[7];
cx q[6], q[7];
rz(0.2083) q[7];
cx q[6], q[7];
// Edge (1,5)
cx q[1], q[8];
rz(0.1924) q[8];
cx q[1], q[8];
cx q[5], q[8];
rz(0.1924) q[8];
cx q[5], q[8];
// Edge (1,6)
cx q[1], q[9];
rz(0.2056) q[9];
cx q[1], q[9];
cx q[6], q[9];
rz(0.2056) q[9];
cx q[6], q[9];
// Edge (3,6)
cx q[3], q[10];
rz(0.1879) q[10];
cx q[3], q[10];
cx q[6], q[10];
rz(0.1879) q[10];
cx q[6], q[10];
// Edge (4,5)
cx q[4], q[7];
rz(0.2192) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.2192) q[7];
cx q[5], q[7];
// Edge (4,6)
cx q[4], q[8];
rz(0.2117) q[8];
cx q[4], q[8];
cx q[6], q[8];
rz(0.2117) q[8];
cx q[6], q[8];
// Edge (5,6)
cx q[5], q[9];
rz(0.2236) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.2236) q[9];
cx q[6], q[9];
// Mixer layer 1
h q[0];
rz(0.4321) q[0];
h q[0];
h q[1];
rz(0.3987) q[1];
h q[1];
h q[2];
rz(0.4156) q[2];
h q[2];
h q[3];
rz(0.4219) q[3];
h q[3];
h q[4];
rz(0.4283) q[4];
h q[4];
h q[5];
rz(0.4392) q[5];
h q[5];
h q[6];
rz(0.4267) q[6];
h q[6];
// Layer 2
// Edge (0,2)
cx q[0], q[7];
rz(0.1983) q[7];
cx q[0], q[7];
cx q[2], q[7];
rz(0.1983) q[7];
cx q[2], q[7];
// Edge (0,3)
cx q[0], q[8];
rz(0.1842) q[8];
cx q[0], q[8];
cx q[3], q[8];
rz(0.1842) q[8];
cx q[3], q[8];
// Edge (0,4)
cx q[0], q[9];
rz(0.2087) q[9];
cx q[0], q[9];
cx q[4], q[9];
rz(0.2087) q[9];
cx q[4], q[9];
// Edge (0,5)
cx q[0], q[10];
rz(0.2149) q[10];
cx q[0], q[10];
cx q[5], q[10];
rz(0.2149) q[10];
cx q[5], q[10];
// Edge (0,6)
cx q[0], q[7];
rz(0.1928) q[7];
cx q[0], q[7];
cx q[6], q[7];
rz(0.1928) q[7];
cx q[6], q[7];
// Edge (1,5)
cx q[1], q[8];
rz(0.1781) q[8];
cx q[1], q[8];
cx q[5], q[8];
rz(0.1781) q[8];
cx q[5], q[8];
// Edge (1,6)
cx q[1], q[9];
rz(0.1905) q[9];
cx q[1], q[9];
cx q[6], q[9];
rz(0.1905) q[9];
cx q[6], q[9];
// Edge (3,6)
cx q[3], q[10];
rz(0.1739) q[10];
cx q[3], q[10];
cx q[6], q[10];
rz(0.1739) q[10];
cx q[6], q[10];
// Edge (4,5)
cx q[4], q[7];
rz(0.2031) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.2031) q[7];
cx q[5], q[7];
// Edge (4,6)
cx q[4], q[8];
rz(0.1962) q[8];
cx q[4], q[8];
cx q[6], q[8];
rz(0.1962) q[8];
cx q[6], q[8];
// Edge (5,6)
cx q[5], q[9];
rz(0.2073) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.2073) q[9];
cx q[6], q[9];
// Mixer layer 2
h q[0];
rz(0.3982) q[0];
h q[0];
h q[1];
rz(0.3691) q[1];
h q[1];
h q[2];
rz(0.3847) q[2];
h q[2];
h q[3];
rz(0.3906) q[3];
h q[3];
h q[4];
rz(0.3963) q[4];
h q[4];
h q[5];
rz(0.4067) q[5];
h q[5];
h q[6];
rz(0.3948) q[6];
h q[6];
// Layer 3
// Edge (0,2)
cx q[0], q[7];
rz(0.1837) q[7];
cx q[0], q[7];
cx q[2], q[7];
rz(0.1837) q[7];
cx q[2], q[7];
// Edge (0,3)
cx q[0], q[8];
rz(0.1706) q[8];
cx q[0], q[8];
cx q[3], q[8];
rz(0.1706) q[8];
cx q[3], q[8];
// Edge (0,4)
cx q[0], q[9];
rz(0.1933) q[9];
cx q[0], q[9];
cx q[4], q[9];
rz(0.1933) q[9];
cx q[4], q[9];
// Edge (0,5)
cx q[0], q[10];
rz(0.1991) q[10];
cx q[0], q[10];
cx q[5], q[10];
rz(0.1991) q[10];
cx q[5], q[10];
// Edge (0,6)
cx q[0], q[7];
rz(0.1786) q[7];
cx q[0], q[7];
cx q[6], q[7];
rz(0.1786) q[7];
cx q[6], q[7];
// Edge (1,5)
cx q[1], q[8];
rz(0.1650) q[8];
cx q[1], q[8];
cx q[5], q[8];
rz(0.1650) q[8];
cx q[5], q[8];
// Edge (1,6)
cx q[1], q[9];
rz(0.1765) q[9];
cx q[1], q[9];
cx q[6], q[9];
rz(0.1765) q[9];
cx q[6], q[9];
// Edge (3,6)
cx q[3], q[10];
rz(0.1611) q[10];
cx q[3], q[10];
cx q[6], q[10];
rz(0.1611) q[10];
cx q[6], q[10];
// Edge (4,5)
cx q[4], q[7];
rz(0.1882) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.1882) q[7];
cx q[5], q[7];
// Edge (4,6)
cx q[4], q[8];
rz(0.1817) q[8];
cx q[4], q[8];
cx q[6], q[8];
rz(0.1817) q[8];
cx q[6], q[8];
// Edge (5,6)
cx q[5], q[9];
rz(0.1921) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.1921) q[9];
cx q[6], q[9];
// Final mixer
h q[0];
rz(0.3689) q[0];
h q[0];
h q[1];
rz(0.3418) q[1];
h q[1];
h q[2];
rz(0.3564) q[2];
h q[2];
h q[3];
rz(0.3619) q[3];
h q[3];
h q[4];
rz(0.3671) q[4];
h q[4];
h q[5];
rz(0.3767) q[5];
h q[5];
h q[6];
rz(0.3657) q[6];
h q[6];
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