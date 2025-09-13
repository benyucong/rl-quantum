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
rz(0.1921) q[3];
rz(0.2056) q[4];
rz(0.1879) q[5];
rz(0.1684) q[6];
rz(0.1792) q[7];
rz(0.2013) q[8];
rz(0.1954) q[9];
rz(0.1827) q[10];

// Edge interaction terms for layer 1
// Edge (0,1)
cx q[0], q[1];
rz(0.0456) q[1];
cx q[0], q[1];

// Edge (0,4)
cx q[0], q[4];
rz(0.0389) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.0421) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.0512) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.0478) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.0395) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.0432) q[5];
cx q[1], q[5];

// Edge (2,4)
cx q[2], q[4];
rz(0.0527) q[4];
cx q[2], q[4];

// Edge (3,4)
cx q[3], q[4];
rz(0.0493) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.0481) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.0417) q[5];
cx q[4], q[5];

// Layer 2: Mixer and final parameterized rotations
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

// Parameterized rotations for layer 2
rz(0.2317) q[0];
rz(0.2189) q[1];
rz(0.1942) q[2];
rz(0.2076) q[3];
rz(0.2241) q[4];
rz(0.2018) q[5];
rz(0.1835) q[6];
rz(0.1928) q[7];
rz(0.2164) q[8];
rz(0.2097) q[9];
rz(0.1973) q[10];

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