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
rz(0.1873) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2039) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.2216) q[6];
cx q[0], q[6];
// Edge (1,3)
cx q[1], q[3];
rz(0.0923) q[3];
cx q[1], q[3];
// Edge (1,6)
cx q[1], q[6];
rz(0.0897) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.0854) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.0819) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.0882) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.0941) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.0796) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.0918) q[6];
cx q[5], q[6];

// Layer 3: Mixer unitary with optimal parameters
rx(1.4832) q[0];
rx(1.4927) q[1];
rx(1.4769) q[2];
rx(1.4983) q[3];
rx(1.4715) q[4];
rx(1.4798) q[5];
rx(1.4951) q[6];

// Layer 4: Final problem unitary with optimal parameters
// Edge (0,1)
cx q[0], q[1];
rz(0.2087) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1924) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2189) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1812) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.1976) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.2153) q[6];
cx q[0], q[6];
// Edge (1,3)
cx q[1], q[3];
rz(0.0891) q[3];
cx q[1], q[3];
// Edge (1,6)
cx q[1], q[6];
rz(0.0865) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.0823) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.0788) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.0851) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.0909) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.0765) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.0887) q[6];
cx q[5], q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];