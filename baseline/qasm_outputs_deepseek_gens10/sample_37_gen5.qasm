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

rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.3256) q[2];
rz(0.3124) q[3];
rz(0.2879) q[4];
rz(0.2763) q[5];
rz(0.2431) q[6];
rz(0.2298) q[7];
rz(0.2056) q[8];
rz(0.1923) q[9];
rz(0.1789) q[10];

// Edge interaction terms for layer 1
// Edge (0,4)
cx q[0], q[4];
rz(0.0872) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.0915) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.1038) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.0987) q[3];
cx q[1], q[3];

// Edge (2,3)
cx q[2], q[3];
rz(0.0764) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.0821) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.0793) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.0856) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.0742) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.0718) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.0837) q[6];
cx q[3], q[6];

// Layer 2: Mixing and parameterized rotations
rz(0.1876) q[0];
rz(0.1732) q[1];
rz(0.2987) q[2];
rz(0.2845) q[3];
rz(0.2631) q[4];
rz(0.2518) q[5];
rz(0.2214) q[6];
rz(0.2093) q[7];
rz(0.1872) q[8];
rz(0.1751) q[9];
rz(0.1632) q[10];

// Edge interaction terms for layer 2
cx q[0], q[4];
rz(0.0798) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.0834) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.0947) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.0901) q[3];
cx q[1], q[3];

cx q[2], q[3];
rz(0.0698) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.0751) q[4];
cx q[2], q[4];

cx q[2], q[5];
rz(0.0724) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.0782) q[6];
cx q[2], q[6];

cx q[3], q[4];
rz(0.0679) q[4];
cx q[3], q[4];

cx q[3], q[5];
rz(0.0656) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(0.0764) q[6];
cx q[3], q[6];

// Layer 3: Final parameterized rotations
rz(0.1654) q[0];
rz(0.1528) q[1];
rz(0.2763) q[2];
rz(0.2619) q[3];
rz(0.2427) q[4];
rz(0.2316) q[5];
rz(0.2038) q[6];
rz(0.1924) q[7];
rz(0.1721) q[8];
rz(0.1609) q[9];
rz(0.1498) q[10];

// Edge interaction terms for layer 3
cx q[0], q[4];
rz(0.0732) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.0765) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.0869) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.0827) q[3];
cx q[1], q[3];

cx q[2], q[3];
rz(0.0641) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.0691) q[4];
cx q[2], q[4];

cx q[2], q[5];
rz(0.0665) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.0718) q[6];
cx q[2], q[6];

cx q[3], q[4];
rz(0.0624) q[4];
cx q[3], q[4];

cx q[3], q[5];
rz(0.0603) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(0.0702) q[6];
cx q[3], q[6];

// Final measurement
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