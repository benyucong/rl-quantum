OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
cx q[0], q[1];
rz(0.7854) q[1];  // π/4 for capacity 2 edge
cx q[0], q[1];
cx q[0], q[3];
rz(1.5708) q[3];  // π/2 for capacity 1 edge
cx q[0], q[3];
cx q[1], q[3];
rz(1.0472) q[3];  // π/3 for capacity 3 edge
cx q[1], q[3];
cx q[1], q[4];
rz(0.7854) q[4];  // π/4 for capacity 2 edge
cx q[1], q[4];
cx q[2], q[1];
rz(0.5236) q[1];  // π/6 for capacity 4 edge
cx q[2], q[1];
cx q[3], q[1];
rz(1.5708) q[1];  // π/2 for capacity 1 edge
cx q[3], q[1];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[0], q[3];
rz(1.5708) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(1.0472) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];
cx q[2], q[1];
rz(0.5236) q[1];
cx q[2], q[1];
cx q[3], q[1];
rz(1.5708) q[1];
cx q[3], q[1];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[0], q[3];
rz(1.5708) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(1.0472) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];
cx q[2], q[1];
rz(0.5236) q[1];
cx q[2], q[1];
cx q[3], q[1];
rz(1.5708) q[1];
cx q[3], q[1];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];