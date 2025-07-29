OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// First layer
cx q[0], q[1];
rz(0.7854) q[1];  // π/4 for capacity 3
cx q[0], q[1];
cx q[1], q[2];
rz(0.6435) q[2];  // π/5 for capacity 4
cx q[1], q[2];
cx q[1], q[5];
rz(0.5236) q[5];  // π/6 for capacity 5
cx q[1], q[5];
cx q[2], q[6];
rz(3.1416) q[6];  // π for capacity 1
cx q[2], q[6];
cx q[3], q[1];
rz(0.7854) q[1];  // π/4 for capacity 3
cx q[3], q[1];
cx q[3], q[2];
rz(0.7854) q[2];  // π/4 for capacity 3
cx q[3], q[2];
cx q[4], q[1];
rz(0.6435) q[1];  // π/5 for capacity 4
cx q[4], q[1];
cx q[4], q[3];
rz(0.6435) q[3];  // π/5 for capacity 4
cx q[4], q[3];
cx q[5], q[3];
rz(1.5708) q[3];  // π/2 for capacity 2
cx q[5], q[3];

// Second layer
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(0.6435) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(0.5236) q[5];
cx q[1], q[5];
cx q[2], q[6];
rz(3.1416) q[6];
cx q[2], q[6];
cx q[3], q[1];
rz(0.7854) q[1];
cx q[3], q[1];
cx q[3], q[2];
rz(0.7854) q[2];
cx q[3], q[2];
cx q[4], q[1];
rz(0.6435) q[1];
cx q[4], q[1];
cx q[4], q[3];
rz(0.6435) q[3];
cx q[4], q[3];
cx q[5], q[3];
rz(1.5708) q[3];
cx q[5], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];