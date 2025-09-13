OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;
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
// Layer 2: Problem constraints and flow conservation
// Edge 0→5 (capacity 3)
rz(0.7854) q[0];
rz(0.7854) q[5];
cx q[0], q[5];
rz(-0.3927) q[5];
cx q[0], q[5];
// Edge 1→2 (capacity 3)
rz(0.7854) q[1];
rz(0.7854) q[2];
cx q[1], q[2];
rz(-0.3927) q[2];
cx q[1], q[2];
// Edge 1→5 (capacity 1)
rz(0.2618) q[1];
rz(0.2618) q[5];
cx q[1], q[5];
rz(-0.1309) q[5];
cx q[1], q[5];
// Edge 2→4 (capacity 1)
rz(0.2618) q[2];
rz(0.2618) q[4];
cx q[2], q[4];
rz(-0.1309) q[4];
cx q[2], q[4];
// Edge 3→2 (capacity 3)
rz(0.7854) q[3];
rz(0.7854) q[2];
cx q[3], q[2];
rz(-0.3927) q[2];
cx q[3], q[2];
// Edge 3→5 (capacity 2)
rz(0.5236) q[3];
rz(0.5236) q[5];
cx q[3], q[5];
rz(-0.2618) q[5];
cx q[3], q[5];
// Layer 3: Flow conservation constraints
// Source node 0 constraint
rz(1.0472) q[0];
// Sink node 5 constraint
rz(-1.0472) q[5];
// Intermediate node constraints
rz(0.3491) q[1];
rz(0.3491) q[2];
rz(0.3491) q[3];
rz(0.3491) q[4];
// Layer 4: Final mixing and measurement
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