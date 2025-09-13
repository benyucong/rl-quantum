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

rz(0.2147) q[0];
rz(0.1983) q[1];
rz(0.2251) q[2];
rz(0.1928) q[3];
rz(0.2089) q[4];
rz(0.2216) q[5];
rz(0.2034) q[6];
rz(0.2172) q[7];
rz(0.1998) q[8];
rz(0.2125) q[9];
rz(0.2057) q[10];
rz(0.2193) q[11];
rz(0.2011) q[12];

// Layer 1 - Problem Hamiltonian (edge constraints)
// Edge 0-1
cx q[0], q[7];
rz(0.0452) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.0452) q[7];
cx q[1], q[7];

// Edge 0-3
cx q[0], q[8];
rz(0.0428) q[8];
cx q[0], q[8];
cx q[3], q[8];
rz(0.0428) q[8];
cx q[3], q[8];

// Edge 0-4
cx q[0], q[9];
rz(0.0436) q[9];
cx q[0], q[9];
cx q[4], q[9];
rz(0.0436) q[9];
cx q[4], q[9];

// Edge 1-3
cx q[1], q[10];
rz(0.0419) q[10];
cx q[1], q[10];
cx q[3], q[10];
rz(0.0419) q[10];
cx q[3], q[10];

// Edge 1-4
cx q[1], q[11];
rz(0.0423) q[11];
cx q[1], q[11];
cx q[4], q[11];
rz(0.0423) q[11];
cx q[4], q[11];

// Edge 1-6
cx q[1], q[12];
rz(0.0441) q[12];
cx q[1], q[12];
cx q[6], q[12];
rz(0.0441) q[12];
cx q[6], q[12];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.1892) q[0];
h q[0];
h q[1];
rz(0.1867) q[1];
h q[1];
h q[2];
rz(0.1914) q[2];
h q[2];
h q[3];
rz(0.1853) q[3];
h q[3];
h q[4];
rz(0.1881) q[4];
h q[4];
h q[5];
rz(0.1908) q[5];
h q[5];
h q[6];
rz(0.1876) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge 2-3
cx q[2], q[7];
rz(0.0398) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.0398) q[7];
cx q[3], q[7];

// Edge 2-5
cx q[2], q[8];
rz(0.0407) q[8];
cx q[2], q[8];
cx q[5], q[8];
rz(0.0407) q[8];
cx q[5], q[8];

// Edge 2-6
cx q[2], q[9];
rz(0.0415) q[9];
cx q[2], q[9];
cx q[6], q[9];
rz(0.0415) q[9];
cx q[6], q[9];

// Edge 3-5
cx q[3], q[10];
rz(0.0389) q[10];
cx q[3], q[10];
cx q[5], q[10];
rz(0.0389) q[10];
cx q[5], q[10];

// Edge 3-6
cx q[3], q[11];
rz(0.0394) q[11];
cx q[3], q[11];
cx q[6], q[11];
rz(0.0394) q[11];
cx q[6], q[11];

// Edge 4-5
cx q[4], q[12];
rz(0.0402) q[12];
cx q[4], q[12];
cx q[5], q[12];
rz(0.0402) q[12];
cx q[5], q[12];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.1724) q[0];
h q[0];
h q[1];
rz(0.1702) q[1];
h q[1];
h q[2];
rz(0.1745) q[2];
h q[2];
h q[3];
rz(0.1689) q[3];
h q[3];
h q[4];
rz(0.1714) q[4];
h q[4];
h q[5];
rz(0.1739) q[5];
h q[5];
h q[6];
rz(0.1709) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge 5-6
cx q[5], q[7];
rz(0.0367) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(0.0367) q[7];
cx q[6], q[7];

// Additional edge constraints reinforcement
cx q[0], q[8];
rz(0.0352) q[8];
cx q[0], q[8];
cx q[1], q[9];
rz(0.0358) q[9];
cx q[1], q[9];
cx q[2], q[10];
rz(0.0349) q[10];
cx q[2], q[10];
cx q[3], q[11];
rz(0.0341) q[11];
cx q[3], q[11];
cx q[4], q[12];
rz(0.0355) q[12];
cx q[4], q[12];

// Layer 4 - Final Mixer Hamiltonian
h q[0];
rz(0.1578) q[0];
h q[0];
h q[1];
rz(0.1557) q[1];
h q[1];
h q[2];
rz(0.1596) q[2];
h q[2];
h q[3];
rz(0.1544) q[3];
h q[3];
h q[4];
rz(0.1567) q[4];
h q[4];
h q[5];
rz(0.1591) q[5];
h q[5];
h q[6];
rz(0.1563) q[6];
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