OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and problem-specific unitaries
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Edge (0,5)
cx q[0], q[5];
rz(0.214) q[5];
cx q[0], q[5];

// Edge (0,7)
cx q[0], q[7];
rz(0.198) q[7];
cx q[0], q[7];

// Edge (1,5)
cx q[1], q[5];
rz(0.225) q[5];
cx q[1], q[5];

// Edge (1,7)
cx q[1], q[7];
rz(0.207) q[7];
cx q[1], q[7];

// Edge (2,5)
cx q[2], q[5];
rz(0.231) q[5];
cx q[2], q[5];

// Edge (3,7)
cx q[3], q[7];
rz(0.219) q[7];
cx q[3], q[7];

// Edge (4,6)
cx q[4], q[6];
rz(0.192) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.243) q[6];
cx q[5], q[6];

// Edge (5,7)
cx q[5], q[7];
rz(0.236) q[7];
cx q[5], q[7];

// Layer 2: Mixer and additional optimization
h q[0];
rz(0.428) q[0];
h q[0];
h q[1];
rz(0.450) q[1];
h q[1];
h q[2];
rz(0.462) q[2];
h q[2];
h q[3];
rz(0.438) q[3];
h q[3];
h q[4];
rz(0.384) q[4];
h q[4];
h q[5];
rz(0.486) q[5];
h q[5];
h q[6];
rz(0.486) q[6];
h q[6];
h q[7];
rz(0.486) q[7];
h q[7];
h q[8];
rz(0.400) q[8];
h q[8];

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