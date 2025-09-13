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

// Layer 1: Problem-specific unitaries
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];
// Edge (1,2)
cx q[1], q[2];
rz(0.3128) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1987) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.2256) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.2031) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1892) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1765) q[4];
cx q[2], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1923) q[6];
cx q[5], q[6];

// Layer 2: Mixer unitaries
rx(1.4287) q[0];
rx(1.3921) q[1];
rx(1.4056) q[2];
rx(1.3879) q[3];
rx(1.4198) q[4];
rx(1.4012) q[5];
rx(1.3954) q[6];

// Layer 2: Problem-specific unitaries
// Edge (0,2)
cx q[0], q[2];
rz(0.2089) q[2];
cx q[0], q[2];
// Edge (1,2)
cx q[1], q[2];
rz(0.3056) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1942) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.2201) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.1983) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1847) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1721) q[4];
cx q[2], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1876) q[6];
cx q[5], q[6];

// Layer 3: Mixer unitaries
rx(1.4362) q[0];
rx(1.3985) q[1];
rx(1.4123) q[2];
rx(1.3942) q[3];
rx(1.4268) q[4];
rx(1.4079) q[5];
rx(1.4018) q[6];

// Layer 3: Problem-specific unitaries
// Edge (0,2)
cx q[0], q[2];
rz(0.2034) q[2];
cx q[0], q[2];
// Edge (1,2)
cx q[1], q[2];
rz(0.2985) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1898) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.2147) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.1936) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1803) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1678) q[4];
cx q[2], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1830) q[6];
cx q[5], q[6];

// Layer 4: Mixer unitaries
rx(1.4438) q[0];
rx(1.4050) q[1];
rx(1.4191) q[2];
rx(1.4006) q[3];
rx(1.4339) q[4];
rx(1.4147) q[5];
rx(1.4083) q[6];

// Layer 4: Problem-specific unitaries
// Edge (0,2)
cx q[0], q[2];
rz(0.1980) q[2];
cx q[0], q[2];
// Edge (1,2)
cx q[1], q[2];
rz(0.2915) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1855) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.2094) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.1890) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1760) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1636) q[4];
cx q[2], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1785) q[6];
cx q[5], q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];