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
// Edge (0,3)
cx q[0], q[3];
rz(0.2147) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.1983) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.2251) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.2319) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.2085) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1927) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.2194) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.2056) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.1872) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.2238) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.2113) q[6];
cx q[5], q[6];

// Layer 3: Mixer layer with optimal parameters
rz(0.1542) q[0];
rz(0.1689) q[1];
rz(0.1427) q[2];
rz(0.1763) q[3];
rz(0.1358) q[4];
rz(0.1634) q[5];
rz(0.1496) q[6];
rz(0.1587) q[7];
rz(0.1721) q[8];
rz(0.1395) q[9];
rz(0.1658) q[10];

// Layer 4: Final rotation and measurement
rx(1.4832) q[0];
rx(1.5217) q[1];
rx(1.4628) q[2];
rx(1.5384) q[3];
rx(1.4491) q[4];
rx(1.4976) q[5];
rx(1.4723) q[6];
rx(1.5069) q[7];
rx(1.5274) q[8];
rx(1.4562) q[9];
rx(1.4921) q[10];

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