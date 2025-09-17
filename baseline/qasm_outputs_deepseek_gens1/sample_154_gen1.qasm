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

// Layer 2: Problem unitary with optimal parameters
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge (0,5)
cx q[0], q[5];
rz(0.1987) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.3124) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2876) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.3021) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.3258) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.2983) q[6];
cx q[1], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.1765) q[4];
cx q[2], q[4];
// Edge (2,6)
cx q[2], q[6];
rz(0.1892) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.2017) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1943) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.2236) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.2089) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.2351) q[6];
cx q[5], q[6];

// Layer 3: Mixer unitary with optimal parameters
rx(1.8924) q[0];
rx(1.8765) q[1];
rx(1.9032) q[2];
rx(1.8871) q[3];
rx(1.8956) q[4];
rx(1.9087) q[5];
rx(1.8819) q[6];

// Layer 4: Final problem unitary with optimal parameters
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];
// Edge (0,5)
cx q[0], q[5];
rz(0.1842) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.2896) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2671) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2804) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.3027) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.2772) q[6];
cx q[1], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.1638) q[4];
cx q[2], q[4];
// Edge (2,6)
cx q[2], q[6];
rz(0.1756) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1873) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1804) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.2076) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1941) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.2183) q[6];
cx q[5], q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];