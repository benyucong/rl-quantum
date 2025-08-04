OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Edge interactions (capacity-weighted)
cx q[0], q[4];
rz(0.5236) q[4];  // 6/12 ≈ 0.5236 rad
cx q[0], q[4];

cx q[1], q[3];
rz(0.4363) q[3];  // 5/12 ≈ 0.4363 rad
cx q[1], q[3];

cx q[2], q[4];
rz(0.5236) q[4];  // 6/12 ≈ 0.5236 rad
cx q[2], q[4];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Reverse edges and other interactions
cx q[3], q[1];
rz(0.2618) q[1];  // 3/12 ≈ 0.2618 rad
cx q[3], q[1];

cx q[3], q[2];
rz(0.2618) q[2];  // 3/12 ≈ 0.2618 rad
cx q[3], q[2];

cx q[3], q[5];
rz(0.0873) q[5];  // 1/12 ≈ 0.0873 rad
cx q[3], q[5];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Final edge
cx q[4], q[5];
rz(0.0873) q[5];  // 1/12 ≈ 0.0873 rad
cx q[4], q[5];

// Layer 4 - measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];