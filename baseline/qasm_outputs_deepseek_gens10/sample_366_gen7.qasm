OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

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
h q[11];

// First layer parameterized rotations
rz(0.3142) q[0];
rz(0.6283) q[1];
rz(0.9425) q[2];
rz(1.2566) q[3];
rz(1.5708) q[4];
rz(1.8850) q[5];
rz(2.1991) q[6];
rz(2.5133) q[7];
rz(2.8274) q[8];
rz(3.1416) q[9];
rz(3.4558) q[10];
rz(3.7699) q[11];

// First layer entangling gates (flow constraints)
cx q[0], q[4];  // Edge 0->1
cx q[0], q[9];  // Edge 0->3
cx q[4], q[5];  // Edge 1->2
cx q[4], q[10]; // Edge 1->3
cx q[5], q[4];  // Edge 2->1
cx q[5], q[11]; // Edge 2->3

// Layer 2: Second parameterized rotations
rz(0.4712) q[0];
rz(0.9425) q[1];
rz(1.4137) q[2];
rz(1.8850) q[3];
rz(2.3562) q[4];
rz(2.8274) q[5];
rz(3.2987) q[6];
rz(3.7699) q[7];
rz(4.2412) q[8];
rz(4.7124) q[9];
rz(5.1836) q[10];
rz(5.6549) q[11];

// Second layer entangling gates (capacity constraints)
cx q[4], q[0];  // Capacity constraint 0->1
cx q[9], q[0];  // Capacity constraint 0->3
cx q[5], q[4];  // Capacity constraint 1->2
cx q[10], q[4]; // Capacity constraint 1->3
cx q[4], q[5];  // Capacity constraint 2->1
cx q[11], q[5]; // Capacity constraint 2->3

// Layer 3: Final parameterized rotations
rz(0.6283) q[0];
rz(1.2566) q[1];
rz(1.8850) q[2];
rz(2.5133) q[3];
rz(3.1416) q[4];
rz(3.7699) q[5];
rz(4.3982) q[6];
rz(5.0265) q[7];
rz(5.6549) q[8];
rz(6.2832) q[9];
rz(6.9115) q[10];
rz(7.5398) q[11];

// Final entangling gates (flow conservation)
cx q[4], q[0];  // Flow conservation at node 1
cx q[5], q[4];  // Flow conservation at node 2
cx q[9], q[0];  // Flow conservation at node 3
cx q[10], q[4]; // Flow conservation at node 3
cx q[11], q[5]; // Flow conservation at node 3

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