OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard gates
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

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,1)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];

// Edge (0,3)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];

// Edge (0,4)
cx q[0], q[9];
rz(0.2031) q[9];
cx q[0], q[9];

// Edge (0,5)
cx q[0], q[10];
rz(0.2218) q[10];
cx q[0], q[10];

// Edge (0,6)
cx q[0], q[1];
rz(0.1923) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.1856) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.2079) q[5];
cx q[1], q[5];

// Edge (3,4)
cx q[3], q[4];
rz(0.1764) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.1942) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.1897) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.2015) q[6];
cx q[5], q[6];

// Layer 3: Mixer layer with optimal parameters
rx(0.4321) q[0];
rx(0.4187) q[1];
rx(0.4012) q[2];
rx(0.4256) q[3];
rx(0.4098) q[4];
rx(0.4453) q[5];
rx(0.3967) q[6];
rx(0.4124) q[7];
rx(0.4079) q[8];
rx(0.4213) q[9];
rx(0.4386) q[10];

// Layer 4: Final rotation layer with optimal parameters
rz(0.1567) q[0];
rz(0.1724) q[1];
rz(0.1439) q[2];
rz(0.1682) q[3];
rz(0.1618) q[4];
rz(0.1845) q[5];
rz(0.1523) q[6];
rz(0.1659) q[7];
rz(0.1594) q[8];
rz(0.1701) q[9];
rz(0.1783) q[10];

// Measurement
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