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

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.2251) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.1923) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.1839) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.2076) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,5)
cx q[1], q[5];
rz(0.1762) q[5];
cx q[1], q[5];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.1894) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.1689) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,4)
cx q[2], q[4];
rz(0.1953) q[4];
cx q[2], q[4];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.1728) q[5];
cx q[2], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.1811) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.1847) q[5];
cx q[4], q[5];

// Problem unitary for edge (4,6)
cx q[4], q[6];
rz(0.1972) q[6];
cx q[4], q[6];

// Mixer layer 1
rx(1.8234) q[0];
rx(1.8456) q[1];
rx(1.7891) q[2];
rx(1.8672) q[3];
rx(1.8529) q[4];
rx(1.8017) q[5];
rx(1.8348) q[6];

// Layer 2
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.4321) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.4012) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.4532) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.3876) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.3708) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.4187) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,5)
cx q[1], q[5];
rz(0.3552) q[5];
cx q[1], q[5];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.3819) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.3405) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,4)
cx q[2], q[4];
rz(0.3938) q[4];
cx q[2], q[4];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.3483) q[5];
cx q[2], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.3652) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.3724) q[5];
cx q[4], q[5];

// Problem unitary for edge (4,6)
cx q[4], q[6];
rz(0.3976) q[6];
cx q[4], q[6];

// Mixer layer 2
rx(1.7654) q[0];
rx(1.7892) q[1];
rx(1.7231) q[2];
rx(1.8023) q[3];
rx(1.7845) q[4];
rx(1.7389) q[5];
rx(1.7698) q[6];

// Layer 3
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.6512) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.6034) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.6819) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.5832) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.5578) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.6298) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,5)
cx q[1], q[5];
rz(0.5345) q[5];
cx q[1], q[5];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.5748) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.5127) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,4)
cx q[2], q[4];
rz(0.5924) q[4];
cx q[2], q[4];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.5241) q[5];
cx q[2], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.5496) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.5603) q[5];
cx q[4], q[5];

// Problem unitary for edge (4,6)
cx q[4], q[6];
rz(0.5982) q[6];
cx q[4], q[6];

// Mixer layer 3
rx(1.6543) q[0];
rx(1.6789) q[1];
rx(1.6123) q[2];
rx(1.6987) q[3];
rx(1.6734) q[4];
rx(1.6256) q[5];
rx(1.6578) q[6];

// Layer 4
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.8723) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.8076) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.9128) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.7809) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.7465) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.8429) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,5)
cx q[1], q[5];
rz(0.7152) q[5];
cx q[1], q[5];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.7694) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.6863) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,4)
cx q[2], q[4];
rz(0.7932) q[4];
cx q[2], q[4];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.7018) q[5];
cx q[2], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.7358) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.7502) q[5];
cx q[4], q[5];

// Problem unitary for edge (4,6)
cx q[4], q[6];
rz(0.8013) q[6];
cx q[4], q[6];

// Mixer layer 4
rx(1.5234) q[0];
rx(1.5489) q[1];
rx(1.4821) q[2];
rx(1.5678) q[3];
rx(1.5423) q[4];
rx(1.4932) q[5];
rx(1.5267) q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];