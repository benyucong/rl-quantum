OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

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
h q[11];

// Layer 1: Problem-specific entangling gates
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
cx q[0], q[4];
rz(0.1987) q[4];
cx q[0], q[4];
cx q[0], q[6];
rz(0.2312) q[6];
cx q[0], q[6];
cx q[1], q[4];
rz(0.1856) q[4];
cx q[1], q[4];
cx q[1], q[6];
rz(0.2078) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.1923) q[3];
cx q[2], q[3];
cx q[2], q[5];
rz(0.2034) q[5];
cx q[2], q[5];
cx q[2], q[6];
rz(0.2198) q[6];
cx q[2], q[6];
cx q[3], q[4];
rz(0.1765) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(0.1942) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(0.2011) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(0.2256) q[6];
cx q[5], q[6];

// Layer 2: Mixer and additional rotations
rx(0.4321) q[0];
rx(0.4156) q[1];
rx(0.3987) q[2];
rx(0.4213) q[3];
rx(0.4078) q[4];
rx(0.4234) q[5];
rx(0.4367) q[6];
rx(0.3892) q[7];
rx(0.4123) q[8];
rx(0.4015) q[9];
rx(0.4189) q[10];
rx(0.3956) q[11];

// Layer 3: Final parameterized rotations and measurements
rz(0.1567) q[0];
rz(0.1423) q[1];
rz(0.1689) q[2];
rz(0.1354) q[3];
rz(0.1521) q[4];
rz(0.1478) q[5];
rz(0.1634) q[6];
rz(0.1389) q[7];
rz(0.1492) q[8];
rz(0.1417) q[9];
rz(0.1573) q[10];
rz(0.1328) q[11];

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