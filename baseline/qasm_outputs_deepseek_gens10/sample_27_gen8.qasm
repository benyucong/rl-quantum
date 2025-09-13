OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initial Hadamard and parameterized rotations
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
h q[11];

// Edge interactions for graph edges
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Edge (0,4)
cx q[0], q[4];
rz(0.1987) q[4];
cx q[0], q[4];

// Edge (0,6)
cx q[0], q[6];
rz(0.2251) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(0.1832) q[4];
cx q[1], q[4];

// Edge (1,6)
cx q[1], q[6];
rz(0.2079) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1924) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.2056) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.2189) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.1763) q[4];
cx q[3], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.2018) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.1895) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.2132) q[6];
cx q[5], q[6];

// Layer 2: Mixer and additional parameterized rotations
h q[0];
rz(0.4321) q[0];
h q[0];
h q[1];
rz(0.4156) q[1];
h q[1];
h q[2];
rz(0.4289) q[2];
h q[2];
h q[3];
rz(0.4098) q[3];
h q[3];
h q[4];
rz(0.4217) q[4];
h q[4];
h q[5];
rz(0.4372) q[5];
h q[5];
h q[6];
rz(0.4453) q[6];
h q[6];
h q[7];
rz(0.3987) q[7];
h q[7];
h q[8];
rz(0.4124) q[8];
h q[8];
h q[9];
rz(0.4069) q[9];
h q[9];
h q[10];
rz(0.4198) q[10];
h q[10];
h q[11];
rz(0.4236) q[11];
h q[11];

// Layer 3: Final parameterized rotations and measurement preparation
rz(0.6589) q[0];
rz(0.6423) q[1];
rz(0.6712) q[2];
rz(0.6354) q[3];
rz(0.6498) q[4];
rz(0.6637) q[5];
rz(0.6821) q[6];
rz(0.6276) q[7];
rz(0.6389) q[8];
rz(0.6312) q[9];
rz(0.6524) q[10];
rz(0.6578) q[11];

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
c[11] = measure q[11];