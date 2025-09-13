OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

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

// Layer 2: Flow constraints and capacity encoding
// Edge 0→5 (capacity 2)
rz(0.7854) q[0];
rz(0.7854) q[5];
cx q[0], q[5];
rz(-0.3927) q[5];
cx q[0], q[5];

// Edge 2→3 (capacity 2)
rz(0.7854) q[2];
rz(0.7854) q[3];
cx q[2], q[3];
rz(-0.3927) q[3];
cx q[2], q[3];

// Edge 3→1 (capacity 3)
rz(1.0472) q[3];
rz(1.0472) q[1];
cx q[3], q[1];
rz(-0.5236) q[1];
cx q[3], q[1];

// Edge 3→2 (capacity 1)
rz(0.5236) q[3];
rz(0.5236) q[2];
cx q[3], q[2];
rz(-0.2618) q[2];
cx q[3], q[2];

// Edge 3→5 (capacity 3)
rz(1.0472) q[3];
rz(1.0472) q[5];
cx q[3], q[5];
rz(-0.5236) q[5];
cx q[3], q[5];

// Edge 4→2 (capacity 2)
rz(0.7854) q[4];
rz(0.7854) q[2];
cx q[4], q[2];
rz(-0.3927) q[2];
cx q[4], q[2];

// Layer 3: Flow conservation constraints
// Node 0 conservation
rz(0.5236) q[0];
rz(0.5236) q[5];
cx q[0], q[5];
rz(-0.2618) q[5];
cx q[0], q[5];

// Node 1 conservation
rz(0.5236) q[3];
rz(0.5236) q[1];
cx q[3], q[1];
rz(-0.2618) q[1];
cx q[3], q[1];

// Node 2 conservation
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
cx q[2], q[3];
rz(-0.1963) q[3];
cx q[2], q[3];
cx q[4], q[2];
rz(-0.1963) q[2];
cx q[4], q[2];

// Node 3 conservation
rz(0.5236) q[2];
rz(0.5236) q[3];
rz(0.5236) q[1];
rz(0.5236) q[5];
cx q[2], q[3];
rz(-0.1309) q[3];
cx q[2], q[3];
cx q[3], q[1];
rz(-0.1309) q[1];
cx q[3], q[1];
cx q[3], q[5];
rz(-0.1309) q[5];
cx q[3], q[5];

// Layer 4: Final optimization and measurement
rz(0.3142) q[0];
rz(0.3142) q[1];
rz(0.3142) q[2];
rz(0.3142) q[3];
rz(0.3142) q[4];
rz(0.3142) q[5];
rz(0.3142) q[6];
rz(0.3142) q[7];
rz(0.3142) q[8];
rz(0.3142) q[9];
rz(0.3142) q[10];

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