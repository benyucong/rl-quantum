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

// Layer 1: Problem-specific entangling gates with optimal parameters
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];

// Edge (0,4)
cx q[0], q[4];
rz(0.2251) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.2318) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(0.2432) q[6];
cx q[0], q[6];

// Edge (1,5)
cx q[1], q[5];
rz(0.1876) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.1923) q[6];
cx q[1], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.1765) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.1689) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.1821) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1954) q[6];
cx q[5], q[6];

// Layer 1: Mixer layer
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];
rx(0.5236) q[7];
rx(0.5236) q[8];
rx(0.5236) q[9];
rx(0.5236) q[10];

// Layer 2: Problem-specific entangling gates
cx q[0], q[2];
rz(0.2018) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.1862) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(0.2114) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.2179) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(0.2285) q[6];
cx q[0], q[6];

cx q[1], q[5];
rz(0.1763) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(0.1807) q[6];
cx q[1], q[6];

cx q[3], q[6];
rz(0.1658) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.1587) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(0.1712) q[6];
cx q[4], q[6];

cx q[5], q[6];
rz(0.1836) q[6];
cx q[5], q[6];

// Layer 2: Mixer layer
rx(0.4887) q[0];
rx(0.4887) q[1];
rx(0.4887) q[2];
rx(0.4887) q[3];
rx(0.4887) q[4];
rx(0.4887) q[5];
rx(0.4887) q[6];
rx(0.4887) q[7];
rx(0.4887) q[8];
rx(0.4887) q[9];
rx(0.4887) q[10];

// Layer 3: Problem-specific entangling gates
cx q[0], q[2];
rz(0.1892) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.1738) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(0.1978) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.2041) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(0.2139) q[6];
cx q[0], q[6];

cx q[1], q[5];
rz(0.1651) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(0.1692) q[6];
cx q[1], q[6];

cx q[3], q[6];
rz(0.1552) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.1486) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(0.1604) q[6];
cx q[4], q[6];

cx q[5], q[6];
rz(0.1719) q[6];
cx q[5], q[6];

// Layer 3: Mixer layer
rx(0.4538) q[0];
rx(0.4538) q[1];
rx(0.4538) q[2];
rx(0.4538) q[3];
rx(0.4538) q[4];
rx(0.4538) q[5];
rx(0.4538) q[6];
rx(0.4538) q[7];
rx(0.4538) q[8];
rx(0.4538) q[9];
rx(0.4538) q[10];

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