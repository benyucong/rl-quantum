OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initialization and flow encoding
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

// Edge 0->1 (capacity 5)
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-0.7854) q[1];
cx q[0], q[1];

// Edge 0->3 (capacity 2)
rz(0.3927) q[2];
rz(0.3927) q[3];
cx q[2], q[3];
rz(-0.3927) q[3];
cx q[2], q[3];

// Edge 1->2 (capacity 3)
rz(0.5890) q[4];
rz(0.5890) q[5];
cx q[4], q[5];
rz(-0.5890) q[5];
cx q[4], q[5];

// Edge 1->3 (capacity 1)
rz(0.1963) q[6];
rz(0.1963) q[7];
cx q[6], q[7];
rz(-0.1963) q[7];
cx q[6], q[7];

// Edge 2->1 (capacity 2)
rz(0.3927) q[8];
rz(0.3927) q[9];
cx q[8], q[9];
rz(-0.3927) q[9];
cx q[8], q[9];

// Edge 2->3 (capacity 3)
rz(0.5890) q[10];
rz(0.5890) q[11];
cx q[10], q[11];
rz(-0.5890) q[11];
cx q[10], q[11];

// Layer 2: Flow conservation constraints
// Node 0 (source) constraint
cx q[0], q[12];
cx q[2], q[12];
rz(1.5708) q[12];
cx q[2], q[12];
cx q[0], q[12];

// Node 1 constraint
cx q[0], q[13];
cx q[4], q[13];
cx q[6], q[13];
cx q[8], q[13];
rz(1.5708) q[13];
cx q[8], q[13];
cx q[6], q[13];
cx q[4], q[13];
cx q[0], q[13];

// Node 2 constraint
cx q[4], q[14];
cx q[10], q[14];
cx q[8], q[14];
rz(1.5708) q[14];
cx q[8], q[14];
cx q[10], q[14];
cx q[4], q[14];

// Node 3 (sink) constraint
cx q[2], q[15];
cx q[6], q[15];
cx q[10], q[15];
rz(1.5708) q[15];
cx q[10], q[15];
cx q[6], q[15];
cx q[2], q[15];

// Layer 3: Amplitude amplification and measurement
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
h q[15];

x q[0];
x q[1];
x q[2];
x q[3];
x q[4];
x q[5];
x q[6];
x q[7];
x q[8];
x q[9];
x q[10];
x q[11];
x q[12];
x q[13];
x q[14];
x q[15];

h q[15];
cx q[0], q[15];
cx q[1], q[15];
cx q[2], q[15];
cx q[3], q[15];
cx q[4], q[15];
cx q[5], q[15];
cx q[6], q[15];
cx q[7], q[15];
cx q[8], q[15];
cx q[9], q[15];
cx q[10], q[15];
cx q[11], q[15];
cx q[12], q[15];
cx q[13], q[15];
cx q[14], q[15];
h q[15];

x q[0];
x q[1];
x q[2];
x q[3];
x q[4];
x q[5];
x q[6];
x q[7];
x q[8];
x q[9];
x q[10];
x q[11];
x q[12];
x q[13];
x q[14];
x q[15];

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
h q[15];

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