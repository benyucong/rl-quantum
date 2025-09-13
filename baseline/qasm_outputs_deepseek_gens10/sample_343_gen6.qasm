OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

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
h q[11];
h q[12];

// Layer 1: Problem-specific entangling gates with optimal parameters
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
rz(0.1831) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.2056) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.1924) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.1897) q[5];
cx q[1], q[5];

// Edge (2,3)
cx q[2], q[3];
rz(0.1765) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.1812) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.1798) q[5];
cx q[2], q[5];

// Edge (3,4)
cx q[3], q[4];
rz(0.1689) q[4];
cx q[3], q[4];

// Edge (4,5)
cx q[4], q[5];
rz(0.1623) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.1547) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1572) q[6];
cx q[5], q[6];

// Layer 2: Mixer layer with optimal parameters
h q[0];
rz(0.4289) q[0];
h q[0];

h q[1];
rz(0.4127) q[1];
h q[1];

h q[2];
rz(0.3965) q[2];
h q[2];

h q[3];
rz(0.3842) q[3];
h q[3];

h q[4];
rz(0.3728) q[4];
h q[4];

h q[5];
rz(0.3614) q[5];
h q[5];

h q[6];
rz(0.3491) q[6];
h q[6];

h q[7];
rz(0.3368) q[7];
h q[7];

h q[8];
rz(0.3246) q[8];
h q[8];

h q[9];
rz(0.3123) q[9];
h q[9];

h q[10];
rz(0.3001) q[10];
h q[10];

h q[11];
rz(0.2878) q[11];
h q[11];

h q[12];
rz(0.2756) q[12];
h q[12];

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