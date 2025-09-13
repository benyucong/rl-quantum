OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,1)
cx q[0], q[1];
rz(0.314) q[1];
cx q[0], q[1];

// Edge (0,4)
cx q[0], q[4];
rz(0.271) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.289) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.226) q[2];
cx q[1], q[2];

// Edge (2,3)
cx q[2], q[3];
rz(0.198) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.243) q[4];
cx q[2], q[4];

// Layer 3: Mixer layer with optimal parameters
h q[0];
rz(0.157) q[0];
h q[0];

h q[1];
rz(0.135) q[1];
h q[1];

h q[2];
rz(0.113) q[2];
h q[2];

h q[3];
rz(0.099) q[3];
h q[3];

h q[4];
rz(0.121) q[4];
h q[4];

h q[5];
rz(0.144) q[5];
h q[5];

// Layer 4: Final parameterized rotations
rx(0.428) q[0];
rx(0.392) q[1];
rx(0.367) q[2];
rx(0.341) q[3];
rx(0.405) q[4];
rx(0.416) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];