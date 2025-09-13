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

// Edge interaction terms for layer 1
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
rz(0.2251) q[9];
cx q[0], q[9];

// Edge (0,5)
cx q[0], q[10];
rz(0.2318) q[10];
cx q[0], q[10];

// Edge (0,6) - using ancilla q[7] as it's already used
cx q[0], q[7];
rz(0.2083) q[7];
cx q[0], q[7];

// Edge (1,2)
cx q[1], q[8];
rz(0.1924) q[8];
cx q[1], q[8];

// Edge (1,4)
cx q[1], q[9];
rz(0.2197) q[9];
cx q[1], q[9];

// Edge (2,3)
cx q[2], q[10];
rz(0.1856) q[10];
cx q[2], q[10];

// Edge (2,5)
cx q[2], q[7];
rz(0.2039) q[7];
cx q[2], q[7];

// Edge (2,6)
cx q[2], q[8];
rz(0.2112) q[8];
cx q[2], q[8];

// Edge (4,6)
cx q[4], q[9];
rz(0.1975) q[9];
cx q[4], q[9];

// Layer 2: Mixer and cost Hamiltonian
rz(0.3421) q[0];
rz(0.3287) q[1];
rz(0.3154) q[2];
rz(0.3019) q[3];
rz(0.3368) q[4];
rz(0.3235) q[5];
rz(0.3102) q[6];
rz(0.2968) q[7];
rz(0.2835) q[8];
rz(0.2701) q[9];
rz(0.2568) q[10];

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

// Layer 3: Final parameterized rotations
rz(0.4289) q[0];
rz(0.4123) q[1];
rz(0.3958) q[2];
rz(0.3792) q[3];
rz(0.4214) q[4];
rz(0.4049) q[5];
rz(0.3883) q[6];
rz(0.3718) q[7];
rz(0.3552) q[8];
rz(0.3387) q[9];
rz(0.3221) q[10];

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