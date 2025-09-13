OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

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

// Parameterized rotations for layer 1
rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.1763) q[2];
rz(0.1924) q[3];
rz(0.2056) q[4];
rz(0.1892) q[5];
rz(0.1837) q[6];
rz(0.1978) q[7];
rz(0.2089) q[8];
rz(0.2013) q[9];
rz(0.1946) q[10];

// Edge interaction terms for layer 1
// Edge (0,1)
cx q[0], q[1];
rz(0.0872) q[1];
cx q[0], q[1];

// Edge (0,4)
cx q[0], q[4];
rz(0.0923) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.0951) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.0834) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.0897) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.0915) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.0938) q[5];
cx q[1], q[5];

// Edge (2,4)
cx q[2], q[4];
rz(0.0869) q[4];
cx q[2], q[4];

// Edge (3,4)
cx q[3], q[4];
rz(0.0882) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.0904) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.0946) q[5];
cx q[4], q[5];

// Layer 2: Second set of parameterized rotations
rz(0.4231) q[0];
rz(0.3978) q[1];
rz(0.3529) q[2];
rz(0.3852) q[3];
rz(0.4115) q[4];
rz(0.3786) q[5];
rz(0.3678) q[6];
rz(0.3959) q[7];
rz(0.4182) q[8];
rz(0.4029) q[9];
rz(0.3895) q[10];

// Edge interaction terms for layer 2
// Edge (0,1)
cx q[0], q[1];
rz(0.1748) q[1];
cx q[0], q[1];

// Edge (0,4)
cx q[0], q[4];
rz(0.1849) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.1903) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.1669) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.1795) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.1831) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.1877) q[5];
cx q[1], q[5];

// Edge (2,4)
cx q[2], q[4];
rz(0.1739) q[4];
cx q[2], q[4];

// Edge (3,4)
cx q[3], q[4];
rz(0.1765) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.1809) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.1893) q[5];
cx q[4], q[5];

// Final measurements
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