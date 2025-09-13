OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

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

// Capacity constraints and flow conservation
// Edge 0->1 (capacity 5)
rz(0.314) q[0];
rz(0.314) q[1];
cx q[0], q[1];
rz(-0.157) q[1];
cx q[0], q[1];

// Edge 0->3 (capacity 2)
rz(0.785) q[0];
rz(0.785) q[3];
cx q[0], q[3];
rz(-0.392) q[3];
cx q[0], q[3];

// Edge 1->2 (capacity 3)
rz(0.524) q[1];
rz(0.524) q[2];
cx q[1], q[2];
rz(-0.262) q[2];
cx q[1], q[2];

// Edge 1->3 (capacity 1)
rz(1.571) q[1];
rz(1.571) q[3];
cx q[1], q[3];
rz(-0.785) q[3];
cx q[1], q[3];

// Edge 2->1 (capacity 2)
rz(0.785) q[2];
rz(0.785) q[1];
cx q[2], q[1];
rz(-0.392) q[1];
cx q[2], q[1];

// Edge 2->3 (capacity 3)
rz(0.524) q[2];
rz(0.524) q[3];
cx q[2], q[3];
rz(-0.262) q[3];
cx q[2], q[3];

// Layer 2: Additional mixing and optimization
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

// Flow conservation constraints
// Source node 0
rz(0.628) q[0];
rz(0.628) q[1];
rz(0.628) q[3];
cx q[0], q[1];
cx q[0], q[3];
rz(-0.314) q[1];
rz(-0.314) q[3];
cx q[0], q[1];
cx q[0], q[3];

// Sink node 3
rz(0.628) q[3];
rz(0.628) q[1];
rz(0.628) q[2];
cx q[3], q[1];
cx q[3], q[2];
rz(-0.314) q[1];
rz(-0.314) q[2];
cx q[3], q[1];
cx q[3], q[2];

// Layer 3: Final optimization and measurement preparation
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

// Final flow optimization
rz(0.392) q[0];
rz(0.392) q[1];
rz(0.392) q[2];
rz(0.392) q[3];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
rz(-0.196) q[1];
rz(-0.196) q[2];
rz(-0.196) q[3];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];

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
c[11] = measure q[11];