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
rz(0.2076) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.2194) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.2228) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.2059) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.1927) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.2014) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.2182) q[6];
cx q[5], q[6];

// Layer 3: Mixer layer with optimal parameters
rz(0.1845) q[0];
rz(0.1763) q[1];
rz(0.1921) q[2];
rz(0.1987) q[3];
rz(0.1812) q[4];
rz(0.1894) q[5];
rz(0.1956) q[6];
rz(0.1879) q[7];
rz(0.1823) q[8];
rz(0.1901) q[9];
rz(0.1938) q[10];

// Layer 4: Final Hadamard layer
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