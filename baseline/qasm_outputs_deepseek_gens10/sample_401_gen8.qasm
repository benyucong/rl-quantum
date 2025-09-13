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

// Capacity constraints for edge 0→3 (capacity 4)
rz(0.7854) q[0];
rz(0.7854) q[3];
cx q[0], q[3];
rz(-0.3927) q[3];
cx q[0], q[3];

// Capacity constraints for edge 1→2 (capacity 6)
rz(1.0472) q[1];
rz(1.0472) q[2];
cx q[1], q[2];
rz(-0.5236) q[2];
cx q[1], q[2];

// Capacity constraints for edge 2→3 (capacity 3)
rz(0.5236) q[2];
rz(0.5236) q[3];
cx q[2], q[3];
rz(-0.2618) q[3];
cx q[2], q[3];

// Layer 2: Flow conservation and optimization
// Source node 0 constraint
rz(0.3927) q[0];
rz(0.3927) q[4];
cx q[0], q[4];
rz(-0.1964) q[4];
cx q[0], q[4];

// Sink node 3 constraint
rz(0.3927) q[3];
rz(0.3927) q[7];
cx q[3], q[7];
rz(-0.1964) q[7];
cx q[3], q[7];

// Intermediate node constraints
rz(0.2618) q[1];
rz(0.2618) q[5];
cx q[1], q[5];
rz(-0.1309) q[5];
cx q[1], q[5];

rz(0.2618) q[2];
rz(0.2618) q[6];
cx q[2], q[6];
rz(-0.1309) q[6];
cx q[2], q[6];

// Layer 3: Global optimization and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Max flow objective optimization
rz(0.6283) q[0];
rz(0.6283) q[3];
cx q[0], q[3];
rz(-0.3142) q[3];
cx q[0], q[3];

rz(0.9425) q[1];
rz(0.9425) q[2];
cx q[1], q[2];
rz(-0.4712) q[2];
cx q[1], q[2];

rz(0.4712) q[2];
rz(0.4712) q[3];
cx q[2], q[3];
rz(-0.2356) q[3];
cx q[2], q[3];

// Layer 4: Final optimization and measurement preparation
// Final flow conservation constraints
rz(0.3142) q[0];
rz(0.3142) q[4];
cx q[0], q[4];
rz(-0.1571) q[4];
cx q[0], q[4];

rz(0.3142) q[3];
rz(0.3142) q[7];
cx q[3], q[7];
rz(-0.1571) q[7];
cx q[3], q[7];

rz(0.2094) q[1];
rz(0.2094) q[5];
cx q[1], q[5];
rz(-0.1047) q[5];
cx q[1], q[5];

rz(0.2094) q[2];
rz(0.2094) q[6];
cx q[2], q[6];
rz(-0.1047) q[6];
cx q[2], q[6];

// Final mixing for measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];