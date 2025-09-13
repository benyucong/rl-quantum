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

// Layer 1: Problem-specific entangling gates
cx q[0], q[4];
cx q[0], q[5];
cx q[0], q[6];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[2], q[4];
cx q[2], q[6];
cx q[3], q[4];
cx q[3], q[5];
cx q[5], q[6];

// Layer 1: Parameterized rotations
rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.2256) q[2];
rz(0.2031) q[3];
rz(0.3124) q[4];
rz(0.2876) q[5];
rz(0.2763) q[6];
rz(0.1892) q[7];
rz(0.2015) q[8];
rz(0.1943) q[9];
rz(0.2087) q[10];

// Layer 2: Mixer and parameterized rotations
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

// Layer 2: Problem-specific entangling gates
cx q[0], q[4];
cx q[0], q[5];
cx q[0], q[6];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[2], q[4];
cx q[2], q[6];
cx q[3], q[4];
cx q[3], q[5];
cx q[5], q[6];

// Layer 2: Parameterized rotations
rz(0.4321) q[0];
rz(0.3986) q[1];
rz(0.4512) q[2];
rz(0.4062) q[3];
rz(0.6248) q[4];
rz(0.5752) q[5];
rz(0.5526) q[6];
rz(0.3784) q[7];
rz(0.4030) q[8];
rz(0.3886) q[9];
rz(0.4174) q[10];

// Layer 3: Mixer and parameterized rotations
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

// Layer 3: Problem-specific entangling gates
cx q[0], q[4];
cx q[0], q[5];
cx q[0], q[6];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[2], q[4];
cx q[2], q[6];
cx q[3], q[4];
cx q[3], q[5];
cx q[5], q[6];

// Layer 3: Final parameterized rotations
rz(0.6482) q[0];
rz(0.5979) q[1];
rz(0.6768) q[2];
rz(0.6093) q[3];
rz(0.9372) q[4];
rz(0.8628) q[5];
rz(0.8289) q[6];
rz(0.5676) q[7];
rz(0.6045) q[8];
rz(0.5829) q[9];
rz(0.6261) q[10];

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