OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

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

// Capacity constraints phase (edge 0-1)
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-1.5708) q[1];
cx q[0], q[1];

// Capacity constraints phase (edge 0-2)
rz(0.7854) q[0];
rz(0.7854) q[2];
cx q[0], q[2];
rz(-1.5708) q[2];
cx q[0], q[2];

// Capacity constraints phase (edge 0-4)
rz(1.1781) q[0];
rz(1.1781) q[4];
cx q[0], q[4];
rz(-2.3562) q[4];
cx q[0], q[4];

// Capacity constraints phase (edge 1-6)
rz(0.7854) q[1];
rz(0.7854) q[6];
cx q[1], q[6];
rz(-1.5708) q[6];
cx q[1], q[6];

// Capacity constraints phase (edge 2-1)
rz(1.1781) q[2];
rz(1.1781) q[1];
cx q[2], q[1];
rz(-2.3562) q[1];
cx q[2], q[1];

// Capacity constraints phase (edge 2-4)
rz(0.7854) q[2];
rz(0.7854) q[4];
cx q[2], q[4];
rz(-1.5708) q[4];
cx q[2], q[4];

// Capacity constraints phase (edge 3-5)
rz(0.7854) q[3];
rz(0.7854) q[5];
cx q[3], q[5];
rz(-1.5708) q[5];
cx q[3], q[5];

// Capacity constraints phase (edge 4-2)
rz(1.1781) q[4];
rz(1.1781) q[2];
cx q[4], q[2];
rz(-2.3562) q[2];
cx q[4], q[2];

// Capacity constraints phase (edge 4-6)
rz(0.7854) q[4];
rz(0.7854) q[6];
cx q[4], q[6];
rz(-1.5708) q[6];
cx q[4], q[6];

// Capacity constraints phase (edge 5-1)
rz(0.7854) q[5];
rz(0.7854) q[1];
cx q[5], q[1];
rz(-1.5708) q[1];
cx q[5], q[1];

// Capacity constraints phase (edge 5-3)
rz(0.7854) q[5];
rz(0.7854) q[3];
cx q[5], q[3];
rz(-1.5708) q[3];
cx q[5], q[3];

// Layer 2: Mixing and conservation constraints
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

// Flow conservation at node 1
cx q[0], q[7];
cx q[2], q[7];
cx q[5], q[7];
cx q[1], q[7];
rz(1.5708) q[7];
cx q[1], q[7];
cx q[5], q[7];
cx q[2], q[7];
cx q[0], q[7];

// Flow conservation at node 2
cx q[0], q[8];
cx q[4], q[8];
cx q[2], q[8];
rz(1.5708) q[8];
cx q[2], q[8];
cx q[4], q[8];
cx q[0], q[8];

// Flow conservation at node 4
cx q[0], q[9];
cx q[2], q[9];
cx q[4], q[9];
rz(1.5708) q[9];
cx q[4], q[9];
cx q[2], q[9];
cx q[0], q[9];

// Flow conservation at node 5
cx q[3], q[10];
cx q[5], q[10];
rz(1.5708) q[10];
cx q[5], q[10];
cx q[3], q[10];

// Flow conservation at node 3
cx q[5], q[11];
cx q[3], q[11];
rz(1.5708) q[11];
cx q[3], q[11];
cx q[5], q[11];

// Layer 3: Final mixing and source/sink constraints
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

// Source constraint (node 0)
rz(2.3562) q[0];
cx q[0], q[12];
rz(-1.1781) q[12];
cx q[0], q[12];

// Sink constraint (node 6)
rz(2.3562) q[6];
cx q[6], q[13];
rz(-1.1781) q[13];
cx q[6], q[13];

// Final measurements
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