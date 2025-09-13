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
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];
// Edge (1,2)
cx q[1], q[2];
rz(0.2251) q[2];
cx q[1], q[2];
// Edge (1,4)
cx q[1], q[4];
rz(0.2318) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2432) q[5];
cx q[1], q[5];
// Edge (2,4)
cx q[2], q[4];
rz(0.2076) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.2193) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.1924) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.2357) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.2289) q[6];
cx q[5], q[6];

// Layer 1: Mixer unitary
rx(1.8421) q[0];
rx(1.8567) q[1];
rx(1.8319) q[2];
rx(1.8673) q[3];
rx(1.8245) q[4];
rx(1.8092) q[5];
rx(1.8783) q[6];

// Layer 2: Problem unitary
cx q[0], q[2];
rz(0.1983) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.1842) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.2087) q[2];
cx q[1], q[2];
cx q[1], q[4];
rz(0.2149) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(0.2256) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(0.1921) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(0.2034) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(0.1783) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(0.2185) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(0.2122) q[6];
cx q[5], q[6];

// Layer 2: Mixer unitary
rx(1.7068) q[0];
rx(1.7201) q[1];
rx(1.6974) q[2];
rx(1.7305) q[3];
rx(1.6902) q[4];
rx(1.6763) q[5];
rx(1.7412) q[6];

// Layer 3: Problem unitary
cx q[0], q[2];
rz(0.1837) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.1706) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.1933) q[2];
cx q[1], q[2];
cx q[1], q[4];
rz(0.1991) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(0.2090) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(0.1779) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(0.1884) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(0.1652) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(0.2024) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(0.1966) q[6];
cx q[5], q[6];

// Layer 3: Mixer unitary
rx(1.5812) q[0];
rx(1.5934) q[1];
rx(1.5726) q[2];
rx(1.6032) q[3];
rx(1.5658) q[4];
rx(1.5532) q[5];
rx(1.6137) q[6];

// Layer 4: Problem unitary
cx q[0], q[2];
rz(0.1701) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.1580) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.1791) q[2];
cx q[1], q[2];
cx q[1], q[4];
rz(0.1845) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(0.1936) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(0.1648) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(0.1745) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(0.1531) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(0.1875) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(0.1821) q[6];
cx q[5], q[6];

// Layer 4: Mixer unitary
rx(1.4653) q[0];
rx(1.4764) q[1];
rx(1.4573) q[2];
rx(1.4852) q[3];
rx(1.4508) q[4];
rx(1.4394) q[5];
rx(1.4948) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];