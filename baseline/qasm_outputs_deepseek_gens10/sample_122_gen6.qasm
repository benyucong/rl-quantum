OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

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
h q[13];
h q[14];

// Capacity constraints for edges (0,2)
rz(0.7854) q[0];
rz(0.7854) q[2];
cx q[0], q[2];
rz(-0.3927) q[2];
cx q[0], q[2];

// Capacity constraints for edges (1,5)
rz(0.7854) q[1];
rz(0.7854) q[5];
cx q[1], q[5];
rz(-0.3927) q[5];
cx q[1], q[5];

// Capacity constraints for edges (2,5)
rz(1.0472) q[2];
rz(1.0472) q[5];
cx q[2], q[5];
rz(-0.5236) q[5];
cx q[2], q[5];

// Capacity constraints for edges (4,1)
rz(1.0472) q[4];
rz(1.0472) q[1];
cx q[4], q[1];
rz(-0.5236) q[1];
cx q[4], q[1];

// Capacity constraints for edges (4,3)
rz(0.7854) q[4];
rz(0.7854) q[3];
cx q[4], q[3];
rz(-0.3927) q[3];
cx q[4], q[3];

// Capacity constraints for edges (4,5)
rz(1.5708) q[4];
rz(1.5708) q[5];
cx q[4], q[5];
rz(-0.7854) q[5];
cx q[4], q[5];

// Layer 2: Flow conservation constraints
// Node 0: source (no conservation)
// Node 1: conservation
cx q[4], q[1];
cx q[1], q[5];
rz(0.5236) q[1];
cx q[1], q[5];
cx q[4], q[1];

// Node 2: conservation
cx q[0], q[2];
cx q[2], q[5];
rz(0.5236) q[2];
cx q[2], q[5];
cx q[0], q[2];

// Node 3: conservation
cx q[4], q[3];
rz(0.3927) q[3];
cx q[4], q[3];

// Node 4: conservation
cx q[4], q[1];
cx q[4], q[3];
cx q[4], q[5];
rz(0.7854) q[4];
cx q[4], q[5];
cx q[4], q[3];
cx q[4], q[1];

// Node 5: sink (no conservation)

// Layer 3: Final mixing and optimization
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
h q[13];
h q[14];

// Final phase adjustments for optimal flow
rz(0.3927) q[0];
rz(0.5236) q[1];
rz(0.5236) q[2];
rz(0.3927) q[3];
rz(0.7854) q[4];
rz(1.3090) q[5];

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
c[12] = measure q[12];
c[13] = measure q[13];
c[14] = measure q[14];