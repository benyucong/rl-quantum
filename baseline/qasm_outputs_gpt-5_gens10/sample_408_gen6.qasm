OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialization and H gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Apply CX gates based on the bipartite graph edges
cx q[0], q[3]; // Edge: 0 -- 3
cx q[0], q[4]; // Edge: 0 -- 4
cx q[0], q[5]; // Edge: 0 -- 5
cx q[1], q[4]; // Edge: 1 -- 4
cx q[1], q[6]; // Edge: 1 -- 6
cx q[2], q[5]; // Edge: 2 -- 5
cx q[2], q[4]; // Edge: 2 -- 4
cx q[2], q[8]; // Edge: 2 -- 8

// Layer 3: RZ rotations to optimize the state
rz(1.5708) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(1.5708) q[6];
rz(1.5708) q[8];

// Layer 4: Final CX gates to entangle states
cx q[0], q[3];
cx q[1], q[4];
cx q[2], q[5];
cx q[2], q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];