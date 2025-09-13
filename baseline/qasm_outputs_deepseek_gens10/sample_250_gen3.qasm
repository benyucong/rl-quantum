OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2: Problem unitary with optimal parameters
// Edge (0,1)
cx q[0], q[1];
rz(0.314) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.471) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.471) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.471) q[6];
cx q[1], q[6];

// Edge (2,5)
cx q[2], q[5];
rz(0.314) q[5];
cx q[2], q[5];

// Edge (3,4)
cx q[3], q[4];
rz(0.314) q[4];
cx q[3], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.471) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.314) q[6];
cx q[4], q[6];

// Layer 3: Mixer unitary with optimal parameters
rx(1.256) q[0];
rx(1.884) q[1];
rx(1.256) q[2];
rx(0.628) q[3];
rx(0.628) q[4];
rx(1.256) q[5];
rx(1.256) q[6];

// Layer 4: Final problem unitary with optimal parameters
// Edge (0,1)
cx q[0], q[1];
rz(0.157) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.235) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.235) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.235) q[6];
cx q[1], q[6];

// Edge (2,5)
cx q[2], q[5];
rz(0.157) q[5];
cx q[2], q[5];

// Edge (3,4)
cx q[3], q[4];
rz(0.157) q[4];
cx q[3], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.235) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.157) q[6];
cx q[4], q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];