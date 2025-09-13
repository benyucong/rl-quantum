OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialization and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Edge constraints and flow conservation
// Edge 0→2 (capacity 1)
rz(0.7854) q[0];
rz(0.7854) q[2];
cx q[0], q[2];
rz(-0.3927) q[2];
cx q[0], q[2];

// Edge 1→2 (capacity 4)
rz(1.0472) q[1];
rz(1.0472) q[2];
cx q[1], q[2];
rz(-0.5236) q[2];
cx q[1], q[2];

// Edge 2→4 (capacity 6)
rz(1.3089) q[2];
rz(1.3089) q[4];
cx q[2], q[4];
rz(-0.6545) q[4];
cx q[2], q[4];

// Edge 3→2 (capacity 2)
rz(0.5236) q[3];
rz(0.5236) q[2];
cx q[3], q[2];
rz(-0.2618) q[2];
cx q[3], q[2];

// Layer 2: Flow conservation and optimization
// Source constraint (node 0)
rz(0.3927) q[0];
rz(0.3927) q[5];
cx q[0], q[5];
rz(-0.1963) q[5];
cx q[0], q[5];

// Sink constraint (node 4)
rz(0.6545) q[4];
rz(0.6545) q[6];
cx q[4], q[6];
rz(-0.3273) q[6];
cx q[4], q[6];

// Intermediate node constraints
rz(0.5236) q[2];
rz(0.5236) q[7];
cx q[2], q[7];
rz(-0.2618) q[7];
cx q[2], q[7];

// Layer 3: Global optimization
rz(0.3491) q[0];
rz(0.3491) q[1];
rz(0.3491) q[2];
rz(0.3491) q[3];
rz(0.3491) q[4];
rz(0.3491) q[5];
rz(0.3491) q[6];
rz(0.3491) q[7];
rz(0.3491) q[8];

cx q[0], q[8];
rz(-0.1745) q[8];
cx q[0], q[8];

cx q[1], q[8];
rz(-0.1745) q[8];
cx q[1], q[8];

cx q[2], q[8];
rz(-0.1745) q[8];
cx q[2], q[8];

cx q[3], q[8];
rz(-0.1745) q[8];
cx q[3], q[8];

cx q[4], q[8];
rz(-0.1745) q[8];
cx q[4], q[8];

// Layer 4: Final optimization and measurement
rz(0.2618) q[0];
rz(0.2618) q[1];
rz(0.2618) q[2];
rz(0.2618) q[3];
rz(0.2618) q[4];
rz(0.2618) q[5];
rz(0.2618) q[6];
rz(0.2618) q[7];
rz(0.2618) q[8];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];