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

// Layer 2 - Applying controlled rotations based on the edges and capacities
cx q[0], q[2]; // 0 -> 2 capacity 3
rz(1.444) q[2]; // rotation to encode capacity 3
cx q[0], q[2];

cx q[1], q[3]; // 1 -> 3 capacity 5
rz(1.678) q[3]; // rotation to encode capacity 5
cx q[1], q[3];

cx q[2], q[3]; // 2 -> 3 capacity 2
rz(1.256) q[3]; // rotation to encode capacity 2
cx q[2], q[3];

cx q[2], q[4]; // 2 -> 4 capacity 2
rz(1.276) q[4]; // rotation to encode capacity 2
cx q[2], q[4];

cx q[3], q[1]; // 3 -> 1 capacity 6
rz(1.619) q[1]; // rotation to encode capacity 6
cx q[3], q[1];

cx q[3], q[2]; // 3 -> 2 capacity 4
rz(1.371) q[2]; // rotation to encode capacity 4
cx q[3], q[2];

// Layer 3 - Finalize the state
h q[0];
rz(0.456) q[0];
h q[0];
h q[1];
rz(0.678) q[1];
h q[1];
h q[2];
rz(0.789) q[2];
h q[2];
h q[3];
rz(0.345) q[3];
h q[3];
h q[4];
rz(0.567) q[4];
h q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];