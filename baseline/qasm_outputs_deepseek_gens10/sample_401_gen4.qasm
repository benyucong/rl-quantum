OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialization and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Flow constraints and capacity encoding
// Edge 0->3 (capacity 4)
rz(0.7854) q[0];
rz(0.7854) q[3];
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];

// Edge 1->2 (capacity 6)
rz(1.0472) q[1];
rz(1.0472) q[2];
cx q[1], q[2];
rz(0.5236) q[2];
cx q[1], q[2];

// Edge 2->3 (capacity 3)
rz(0.5236) q[2];
rz(0.5236) q[3];
cx q[2], q[3];
rz(0.2618) q[3];
cx q[2], q[3];

// Layer 3: Flow conservation constraints
// Node 0: source (no conservation)
// Node 1: conservation (in=0, out=1->2)
rz(0.5236) q[1];
rz(0.5236) q[2];
cx q[1], q[2];
rz(0.2618) q[2];
cx q[1], q[2];

// Node 2: conservation (in=1->2, out=2->3)
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
cx q[1], q[2];
cx q[2], q[3];
rz(0.3927) q[2];
rz(0.3927) q[3];
cx q[2], q[3];
cx q[1], q[2];

// Node 3: sink (no conservation)

// Layer 4: Final optimization and measurement
rz(0.3927) q[0];
rz(0.5236) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.3927) q[4];
rz(0.5236) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];