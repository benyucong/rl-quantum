OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

// Layer 1 - Initialization and first mixing
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

// Layer 2 - Problem-specific unitaries with optimal parameters
// Edge 0-2 (capacity 3)
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];

// Edge 1-5 (capacity 3)
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];

// Edge 2-5 (capacity 4)
cx q[2], q[5];
rz(0.9273) q[5];
cx q[2], q[5];

// Edge 4-1 (capacity 4)
cx q[4], q[1];
rz(0.9273) q[1];
cx q[4], q[1];

// Edge 4-3 (capacity 3)
cx q[4], q[3];
rz(0.7854) q[3];
cx q[4], q[3];

// Edge 4-5 (capacity 6)
cx q[4], q[5];
rz(1.1781) q[5];
cx q[4], q[5];

// Layer 3 - Final mixing and measurement
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