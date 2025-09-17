OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initialization and first parameterized rotations
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
rz(0.314) q[0];
rz(0.628) q[1];
rz(0.942) q[2];
rz(1.256) q[3];
rz(1.570) q[4];
rz(1.884) q[5];
rz(2.198) q[6];
rz(2.512) q[7];
rz(2.826) q[8];
rz(3.140) q[9];
rz(3.454) q[10];

// Layer 2: Flow conservation constraints and edge interactions
// Source node 0
cx q[0], q[5];
rz(0.785) q[5];
cx q[0], q[5];

// Node 2-3 interactions
cx q[2], q[3];
rz(0.524) q[3];
cx q[2], q[3];

// Node 3 interactions
cx q[3], q[1];
rz(0.698) q[1];
cx q[3], q[1];

cx q[3], q[2];
rz(0.262) q[2];
cx q[3], q[2];

cx q[3], q[5];
rz(0.698) q[5];
cx q[3], q[5];

// Node 4 interactions
cx q[4], q[2];
rz(0.524) q[2];
cx q[4], q[2];

// Layer 3: Additional flow optimization and capacity constraints
rz(0.392) q[0];
rz(0.523) q[1];
rz(0.654) q[2];
rz(0.785) q[3];
rz(0.916) q[4];
rz(1.047) q[5];
rz(1.178) q[6];
rz(1.309) q[7];
rz(1.440) q[8];
rz(1.571) q[9];
rz(1.702) q[10];

// Capacity constraint interactions
cx q[0], q[6];
rz(0.349) q[6];
cx q[0], q[6];

cx q[2], q[7];
rz(0.262) q[7];
cx q[2], q[7];

cx q[3], q[8];
rz(0.349) q[8];
cx q[3], q[8];

cx q[3], q[9];
rz(0.131) q[9];
cx q[3], q[9];

cx q[3], q[10];
rz(0.349) q[10];
cx q[3], q[10];

cx q[4], q[7];
rz(0.262) q[7];
cx q[4], q[7];

// Layer 4: Final optimization and measurement preparation
rz(0.196) q[0];
rz(0.327) q[1];
rz(0.458) q[2];
rz(0.589) q[3];
rz(0.720) q[4];
rz(0.851) q[5];
rz(0.982) q[6];
rz(1.113) q[7];
rz(1.244) q[8];
rz(1.375) q[9];
rz(1.506) q[10];

// Final flow conservation verification
cx q[0], q[5];
rz(0.436) q[5];
cx q[0], q[5];

cx q[3], q[1];
rz(0.436) q[1];
cx q[3], q[1];

cx q[3], q[5];
rz(0.436) q[5];
cx q[3], q[5];

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
c[9] = measure q[9];
c[10] = measure q[10];