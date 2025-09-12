OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// First layer: Prepare the entanglement and encode the initial state
h q[0];
h q[1];
h q[2];
h q[3];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
rx(1.1342) q[0];
ry(0.7694) q[1];
rx(1.4235) q[2];
ry(0.5998) q[3];

// Second layer: Apply a further transformation with controlled rotations
cx q[0], q[2];
rz(0.0545) q[2];
cx q[0], q[2];
cx q[1], q[3];
rz(0.0453) q[3];
cx q[1], q[3];
rx(1.2219) q[0];
ry(1.3425) q[1];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];