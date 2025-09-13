OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1 - Initial Hadamard and parameterized rotations
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
h q[12];

rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.2251) q[2];
rz(0.2039) q[3];
rz(0.1923) q[4];
rz(0.2086) q[5];
rz(0.1972) q[6];
rz(0.2118) q[7];
rz(0.2054) q[8];
rz(0.1991) q[9];
rz(0.2167) q[10];
rz(0.2023) q[11];
rz(0.2095) q[12];

// Layer 1 - Problem Hamiltonian (edge constraints)
// Edge 0-1
cx q[0], q[7];
rz(0.0872) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.0872) q[7];
cx q[1], q[7];

// Edge 0-3
cx q[0], q[8];
rz(0.0915) q[8];
cx q[0], q[8];
cx q[3], q[8];
rz(0.0915) q[8];
cx q[3], q[8];

// Edge 0-4
cx q[0], q[9];
rz(0.0893) q[9];
cx q[0], q[9];
cx q[4], q[9];
rz(0.0893) q[9];
cx q[4], q[9];

// Edge 1-3
cx q[1], q[10];
rz(0.0938) q[10];
cx q[1], q[10];
cx q[3], q[10];
rz(0.0938) q[10];
cx q[3], q[10];

// Edge 1-4
cx q[1], q[11];
rz(0.0886) q[11];
cx q[1], q[11];
cx q[4], q[11];
rz(0.0886) q[11];
cx q[4], q[11];

// Edge 1-6
cx q[1], q[12];
rz(0.0921) q[12];
cx q[1], q[12];
cx q[6], q[12];
rz(0.0921) q[12];
cx q[6], q[12];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.1789) q[0];
h q[0];
h q[1];
rz(0.1842) q[1];
h q[1];
h q[2];
rz(0.1725) q[2];
h q[2];
h q[3];
rz(0.1867) q[3];
h q[3];
h q[4];
rz(0.1811) q[4];
h q[4];
h q[5];
rz(0.1758) q[5];
h q[5];
h q[6];
rz(0.1796) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge 2-3
cx q[2], q[7];
rz(0.0942) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.0942) q[7];
cx q[3], q[7];

// Edge 2-5
cx q[2], q[8];
rz(0.0907) q[8];
cx q[2], q[8];
cx q[5], q[8];
rz(0.0907) q[8];
cx q[5], q[8];

// Edge 2-6
cx q[2], q[9];
rz(0.0931) q[9];
cx q[2], q[9];
cx q[6], q[9];
rz(0.0931) q[9];
cx q[6], q[9];

// Edge 3-5
cx q[3], q[10];
rz(0.0898) q[10];
cx q[3], q[10];
cx q[5], q[10];
rz(0.0898) q[10];
cx q[5], q[10];

// Edge 3-6
cx q[3], q[11];
rz(0.0926) q[11];
cx q[3], q[11];
cx q[6], q[11];
rz(0.0926) q[11];
cx q[6], q[11];

// Edge 4-5
cx q[4], q[12];
rz(0.0883) q[12];
cx q[4], q[12];
cx q[5], q[12];
rz(0.0883) q[12];
cx q[5], q[12];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.1923) q[0];
h q[0];
h q[1];
rz(0.1876) q[1];
h q[1];
h q[2];
rz(0.1951) q[2];
h q[2];
h q[3];
rz(0.1894) q[3];
h q[3];
h q[4];
rz(0.1938) q[4];
h q[4];
h q[5];
rz(0.1882) q[5];
h q[5];
h q[6];
rz(0.1917) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge 5-6
cx q[5], q[7];
rz(0.0919) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(0.0919) q[7];
cx q[6], q[7];

// Additional edge constraints reinforcement
cx q[0], q[8];
rz(0.0458) q[8];
cx q[0], q[8];
cx q[1], q[9];
rz(0.0443) q[9];
cx q[1], q[9];
cx q[2], q[10];
rz(0.0462) q[10];
cx q[2], q[10];
cx q[3], q[11];
rz(0.0451) q[11];
cx q[3], q[11];
cx q[4], q[12];
rz(0.0447) q[12];
cx q[4], q[12];

// Layer 4 - Final mixer and optimization
h q[0];
rz(0.2057) q[0];
h q[0];
h q[1];
rz(0.2019) q[1];
h q[1];
h q[2];
rz(0.2083) q[2];
h q[2];
h q[3];
rz(0.2036) q[3];
h q[3];
h q[4];
rz(0.2071) q[4];
h q[4];
h q[5];
rz(0.2028) q[5];
h q[5];
h q[6];
rz(0.2064) q[6];
h q[6];

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
c[11] = measure q[11];
c[12] = measure q[12];