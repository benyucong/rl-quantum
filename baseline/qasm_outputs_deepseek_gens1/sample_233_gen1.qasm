OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge interactions - Layer 1
// Component 1: 0-1-2
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];

// Component 2: 3-4-5
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Component 3: 6-7-8 (using q[6] and q[7] for 6-7, q[7] represents 6-8)
cx q[6], q[7];
rz(0.7854) q[7];
cx q[6], q[7];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge interactions - Layer 2
cx q[0], q[1];
rz(1.1781) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(1.1781) q[2];
cx q[1], q[2];

cx q[3], q[4];
rz(1.1781) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(1.1781) q[5];
cx q[4], q[5];

cx q[6], q[7];
rz(1.1781) q[7];
cx q[6], q[7];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge interactions - Layer 3
cx q[0], q[1];
rz(1.5708) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(1.5708) q[2];
cx q[1], q[2];

cx q[3], q[4];
rz(1.5708) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(1.5708) q[5];
cx q[4], q[5];

cx q[6], q[7];
rz(1.5708) q[7];
cx q[6], q[7];

// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge interactions - Layer 4
cx q[0], q[1];
rz(1.9635) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(1.9635) q[2];
cx q[1], q[2];

cx q[3], q[4];
rz(1.9635) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(1.9635) q[5];
cx q[4], q[5];

cx q[6], q[7];
rz(1.9635) q[7];
cx q[6], q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];