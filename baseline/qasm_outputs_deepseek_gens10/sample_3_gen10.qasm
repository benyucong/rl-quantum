OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Initial Hadamard gates on all qubits
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

// Layer 2: Problem-specific entangling gates with optimal parameters
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
// Edge (1,3)
cx q[1], q[10];
rz(0.1863) q[10];
cx q[1], q[10];
// Edge (1,4)
cx q[1], q[11];
rz(0.2127) q[11];
cx q[1], q[11];
// Edge (1,6)
cx q[1], q[12];
rz(0.2039) q[12];
cx q[1], q[12];
// Edge (2,3)
cx q[2], q[8];
rz(0.1924) q[8];
cx q[2], q[8];
// Edge (2,5)
cx q[2], q[9];
rz(0.2188) q[9];
cx q[2], q[9];
// Edge (2,6)
cx q[2], q[12];
rz(0.2100) q[12];
cx q[2], q[12];
// Edge (3,5)
cx q[3], q[9];
rz(0.2242) q[9];
cx q[3], q[9];
// Edge (3,6)
cx q[3], q[12];
rz(0.2154) q[12];
cx q[3], q[12];
// Edge (4,5)
cx q[4], q[9];
rz(0.2316) q[9];
cx q[4], q[9];
// Edge (5,6)
cx q[5], q[12];
rz(0.2228) q[12];
cx q[5], q[12];

// Layer 3: Mixer layer with optimal parameters
rx(0.1571) q[0];
rx(0.1429) q[1];
rx(0.1714) q[2];
rx(0.1357) q[3];
rx(0.1643) q[4];
rx(0.1786) q[5];
rx(0.1500) q[6];
rx(0.1286) q[7];
rx(0.1214) q[8];
rx(0.1857) q[9];
rx(0.1143) q[10];
rx(0.1071) q[11];
rx(0.1929) q[12];

// Layer 4: Final optimization layer
rz(0.0943) q[0];
rz(0.0886) q[1];
rz(0.1029) q[2];
rz(0.0829) q[3];
rz(0.0971) q[4];
rz(0.1057) q[5];
rz(0.0914) q[6];
rz(0.0771) q[7];
rz(0.0743) q[8];
rz(0.1100) q[9];
rz(0.0686) q[10];
rz(0.0657) q[11];
rz(0.1143) q[12];

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
c[11] = measure q[11];
c[12] = measure q[12];