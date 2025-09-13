OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.2145) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.2145) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,5)
cx q[0], q[5];
rz(0.2145) q[5];
cx q[0], q[5];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.2145) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.0715) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.0715) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.0715) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.0715) q[5];
cx q[2], q[5];

// Problem unitary for edge (2,6)
cx q[2], q[6];
rz(0.0715) q[6];
cx q[2], q[6];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.0715) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.0715) q[5];
cx q[4], q[5];

// Problem unitary for edge (5,6)
cx q[5], q[6];
rz(0.0715) q[6];
cx q[5], q[6];

// Mixer layer 1
rx(1.4286) q[0];
rx(1.4286) q[1];
rx(1.4286) q[2];
rx(1.4286) q[3];
rx(1.4286) q[4];
rx(1.4286) q[5];
rx(1.4286) q[6];

// Layer 2
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.1928) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,2)
cx q[0], q[2];
rz(0.1928) q[2];
cx q[0], q[2];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.1928) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.1928) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,5)
cx q[0], q[5];
rz(0.1928) q[5];
cx q[0], q[5];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.1928) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.0643) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.0643) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.0643) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.0643) q[5];
cx q[2], q[5];

// Problem unitary for edge (2,6)
cx q[2], q[6];
rz(0.0643) q[6];
cx q[2], q[6];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.0643) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.0643) q[5];
cx q[4], q[5];

// Problem unitary for edge (5,6)
cx q[5], q[6];
rz(0.0643) q[6];
cx q[5], q[6];

// Mixer layer 2
rx(1.2857) q[0];
rx(1.2857) q[1];
rx(1.2857) q[2];
rx(1.2857) q[3];
rx(1.2857) q[4];
rx(1.2857) q[5];
rx(1.2857) q[6];

// Layer 3
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.1711) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,2)
cx q[0], q[2];
rz(0.1711) q[2];
cx q[0], q[2];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.1711) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.1711) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,5)
cx q[0], q[5];
rz(0.1711) q[5];
cx q[0], q[5];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.1711) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.0570) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.0570) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.0570) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.0570) q[5];
cx q[2], q[5];

// Problem unitary for edge (2,6)
cx q[2], q[6];
rz(0.0570) q[6];
cx q[2], q[6];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.0570) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.0570) q[5];
cx q[4], q[5];

// Problem unitary for edge (5,6)
cx q[5], q[6];
rz(0.0570) q[6];
cx q[5], q[6];

// Mixer layer 3
rx(1.1429) q[0];
rx(1.1429) q[1];
rx(1.1429) q[2];
rx(1.1429) q[3];
rx(1.1429) q[4];
rx(1.1429) q[5];
rx(1.1429) q[6];

// Layer 4
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.1494) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,2)
cx q[0], q[2];
rz(0.1494) q[2];
cx q[0], q[2];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.1494) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.1494) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,5)
cx q[0], q[5];
rz(0.1494) q[5];
cx q[0], q[5];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.1494) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.0498) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.0498) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.0498) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.0498) q[5];
cx q[2], q[5];

// Problem unitary for edge (2,6)
cx q[2], q[6];
rz(0.0498) q[6];
cx q[2], q[6];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.0498) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.0498) q[5];
cx q[4], q[5];

// Problem unitary for edge (5,6)
cx q[5], q[6];
rz(0.0498) q[6];
cx q[5], q[6];

// Mixer layer 4
rx(1.0000) q[0];
rx(1.0000) q[1];
rx(1.0000) q[2];
rx(1.0000) q[3];
rx(1.0000) q[4];
rx(1.0000) q[5];
rx(1.0000) q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];