OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

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
h q[9];
h q[10];
h q[11];
h q[12];

// Layer 2: Flow constraints and capacity encoding
// Edge 0→4 (capacity 3)
rz(0.7854) q[0];
rz(1.0472) q[4];
cx q[0], q[4];
rz(-0.3927) q[4];
cx q[0], q[4];

// Edge 0→5 (capacity 2)
rz(0.5236) q[0];
rz(0.7854) q[5];
cx q[0], q[5];
rz(-0.2618) q[5];
cx q[0], q[5];

// Edge 1→2 (capacity 1)
rz(0.2618) q[1];
rz(0.5236) q[2];
cx q[1], q[2];
rz(-0.1309) q[2];
cx q[1], q[2];

// Edge 2→3 (capacity 1)
rz(0.2618) q[2];
rz(0.5236) q[3];
cx q[2], q[3];
rz(-0.1309) q[3];
cx q[2], q[3];

// Edge 3→5 (capacity 1)
rz(0.2618) q[3];
rz(0.5236) q[5];
cx q[3], q[5];
rz(-0.1309) q[5];
cx q[3], q[5];

// Edge 4→2 (capacity 3)
rz(0.7854) q[4];
rz(1.0472) q[2];
cx q[4], q[2];
rz(-0.3927) q[2];
cx q[4], q[2];

// Edge 4→6 (capacity 1)
rz(0.2618) q[4];
rz(0.5236) q[6];
cx q[4], q[6];
rz(-0.1309) q[6];
cx q[4], q[6];

// Edge 5→2 (capacity 1)
rz(0.2618) q[5];
rz(0.5236) q[2];
cx q[5], q[2];
rz(-0.1309) q[2];
cx q[5], q[2];

// Edge 5→3 (capacity 2)
rz(0.5236) q[5];
rz(0.7854) q[3];
cx q[5], q[3];
rz(-0.2618) q[3];
cx q[5], q[3];

// Layer 3: Flow conservation constraints
// Node 0 (source)
rz(1.0472) q[0];
rz(0.7854) q[4];
rz(0.5236) q[5];

// Node 1
rz(0.2618) q[1];
rz(0.5236) q[2];

// Node 2
rz(0.5236) q[2];
rz(0.5236) q[3];
rz(1.0472) q[4];
rz(0.5236) q[5];

// Node 3
rz(0.5236) q[3];
rz(0.7854) q[5];

// Node 4
rz(0.7854) q[4];
rz(1.0472) q[2];
rz(0.5236) q[6];

// Node 5
rz(0.7854) q[5];
rz(0.5236) q[2];
rz(0.7854) q[3];

// Node 6 (sink)
rz(0.5236) q[6];

// Layer 4: Final optimization and measurement
rz(0.3927) q[0];
rz(0.1309) q[1];
rz(0.6545) q[2];
rz(0.5236) q[3];
rz(0.9163) q[4];
rz(0.7854) q[5];
rz(0.2618) q[6];
rz(0.1963) q[7];
rz(0.0654) q[8];
rz(0.3273) q[9];
rz(0.2618) q[10];
rz(0.4582) q[11];
rz(0.3927) q[12];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];