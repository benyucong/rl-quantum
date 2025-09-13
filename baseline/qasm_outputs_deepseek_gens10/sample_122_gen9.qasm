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

// Capacity constraints phase (Layer 1)
// Edge 0-2 (capacity 3)
cx q[0], q[6];
rz(0.5236) q[6];
cx q[0], q[6];
cx q[2], q[6];
rz(0.5236) q[6];
cx q[2], q[6];

// Edge 1-5 (capacity 3)
cx q[1], q[7];
rz(0.5236) q[7];
cx q[1], q[7];
cx q[5], q[7];
rz(0.5236) q[7];
cx q[5], q[7];

// Edge 2-5 (capacity 4)
cx q[2], q[8];
rz(0.3927) q[8];
cx q[2], q[8];
cx q[5], q[8];
rz(0.3927) q[8];
cx q[5], q[8];

// Edge 4-1 (capacity 4)
cx q[4], q[9];
rz(0.3927) q[9];
cx q[4], q[9];
cx q[1], q[9];
rz(0.3927) q[9];
cx q[1], q[9];

// Edge 4-3 (capacity 3)
cx q[4], q[10];
rz(0.5236) q[10];
cx q[4], q[10];
cx q[3], q[10];
rz(0.5236) q[10];
cx q[3], q[10];

// Edge 4-5 (capacity 6)
cx q[4], q[11];
rz(0.2618) q[11];
cx q[4], q[11];
cx q[5], q[11];
rz(0.2618) q[11];
cx q[5], q[11];

// Layer 2: Mixing and flow conservation
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

// Flow conservation constraints (Layer 2)
// Node 0 (source)
rz(0.7854) q[0];

// Node 1
cx q[4], q[12];
cx q[1], q[12];
rz(0.3927) q[12];
cx q[1], q[12];
cx q[4], q[12];

// Node 2
cx q[0], q[13];
cx q[2], q[13];
rz(0.3927) q[13];
cx q[2], q[13];
cx q[0], q[13];

// Node 3
cx q[4], q[14];
cx q[3], q[14];
rz(0.3927) q[14];
cx q[3], q[14];
cx q[4], q[14];

// Node 4
rz(0.3927) q[4];

// Node 5 (sink)
rz(0.7854) q[5];

// Layer 3: Final mixing and measurement
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

// Final phase adjustments
rz(0.1963) q[0];
rz(0.1963) q[1];
rz(0.1963) q[2];
rz(0.1963) q[3];
rz(0.1963) q[4];
rz(0.1963) q[5];

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