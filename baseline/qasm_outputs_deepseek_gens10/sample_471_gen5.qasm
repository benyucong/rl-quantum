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

// Layer 1: Problem unitary (edges)
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2145) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2145) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2145) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.2145) q[6];
cx q[0], q[6];
// Edge (1,3)
cx q[1], q[3];
rz(0.1423) q[3];
cx q[1], q[3];
// Edge (1,6)
cx q[1], q[6];
rz(0.1423) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1423) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1423) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1423) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.1423) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1423) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.1423) q[6];
cx q[5], q[6];

// Layer 1: Mixer unitary
rx(1.4287) q[0];
rx(1.4287) q[1];
rx(1.4287) q[2];
rx(1.4287) q[3];
rx(1.4287) q[4];
rx(1.4287) q[5];
rx(1.4287) q[6];

// Layer 2: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1983) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1983) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1983) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.1983) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1983) q[6];
cx q[0], q[6];
// Edge (1,3)
cx q[1], q[3];
rz(0.1322) q[3];
cx q[1], q[3];
// Edge (1,6)
cx q[1], q[6];
rz(0.1322) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1322) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1322) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1322) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.1322) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1322) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.1322) q[6];
cx q[5], q[6];

// Layer 2: Mixer unitary
rx(1.3215) q[0];
rx(1.3215) q[1];
rx(1.3215) q[2];
rx(1.3215) q[3];
rx(1.3215) q[4];
rx(1.3215) q[5];
rx(1.3215) q[6];

// Layer 3: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.1837) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1837) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1837) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1837) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.1837) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1837) q[6];
cx q[0], q[6];
// Edge (1,3)
cx q[1], q[3];
rz(0.1225) q[3];
cx q[1], q[3];
// Edge (1,6)
cx q[1], q[6];
rz(0.1225) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1225) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1225) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1225) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.1225) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1225) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.1225) q[6];
cx q[5], q[6];

// Layer 3: Mixer unitary
rx(1.2249) q[0];
rx(1.2249) q[1];
rx(1.2249) q[2];
rx(1.2249) q[3];
rx(1.2249) q[4];
rx(1.2249) q[5];
rx(1.2249) q[6];

// Layer 4: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.1702) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1702) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1702) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1702) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.1702) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1702) q[6];
cx q[0], q[6];
// Edge (1,3)
cx q[1], q[3];
rz(0.1135) q[3];
cx q[1], q[3];
// Edge (1,6)
cx q[1], q[6];
rz(0.1135) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1135) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1135) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1135) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.1135) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1135) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.1135) q[6];
cx q[5], q[6];

// Layer 4: Mixer unitary
rx(1.1358) q[0];
rx(1.1358) q[1];
rx(1.1358) q[2];
rx(1.1358) q[3];
rx(1.1358) q[4];
rx(1.1358) q[5];
rx(1.1358) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];