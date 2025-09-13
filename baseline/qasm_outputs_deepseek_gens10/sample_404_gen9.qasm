OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initial Hadamard and problem-specific rotations
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

// Problem-specific rotations for min-cut with source=0, sink=11
rz(0.314) q[0];
rz(0.271) q[1];
rz(0.229) q[2];
rz(0.186) q[3];
rz(0.143) q[4];
rz(0.100) q[5];
rz(0.057) q[6];
rz(0.014) q[7];
rz(-0.029) q[8];
rz(-0.072) q[9];
rz(-0.115) q[10];
rz(-0.158) q[11];

// Layer 2: Entangling operations based on graph edges
// Edge 0-2 (capacity 2)
cx q[0], q[2];
rz(-0.042) q[2];
cx q[0], q[2];

// Edge 0-3 (capacity 1)
cx q[0], q[3];
rz(-0.021) q[3];
cx q[0], q[3];

// Edge 0-6 (capacity 3)
cx q[0], q[6];
rz(-0.063) q[6];
cx q[0], q[6];

// Edge 0-7 (capacity 3)
cx q[0], q[7];
rz(-0.063) q[7];
cx q[0], q[7];

// Edge 1-3 (capacity 2)
cx q[1], q[3];
rz(-0.042) q[3];
cx q[1], q[3];

// Edge 1-5 (capacity 2)
cx q[1], q[5];
rz(-0.042) q[5];
cx q[1], q[5];

// Edge 1-8 (capacity 4)
cx q[1], q[8];
rz(-0.084) q[8];
cx q[1], q[8];

// Edge 2-10 (capacity 3)
cx q[2], q[10];
rz(-0.063) q[10];
cx q[2], q[10];

// Edge 3-1 (capacity 1)
cx q[3], q[1];
rz(-0.021) q[1];
cx q[3], q[1];

// Edge 3-6 (capacity 2)
cx q[3], q[6];
rz(-0.042) q[6];
cx q[3], q[6];

// Edge 3-8 (capacity 1)
cx q[3], q[8];
rz(-0.021) q[8];
cx q[3], q[8];

// Edge 3-9 (capacity 1)
cx q[3], q[9];
rz(-0.021) q[9];
cx q[3], q[9];

// Edge 3-11 (capacity 1)
cx q[3], q[11];
rz(-0.021) q[11];
cx q[3], q[11];

// Edge 4-3 (capacity 1)
cx q[4], q[3];
rz(-0.021) q[3];
cx q[4], q[3];

// Edge 4-6 (capacity 1)
cx q[4], q[6];
rz(-0.021) q[6];
cx q[4], q[6];

// Edge 4-7 (capacity 3)
cx q[4], q[7];
rz(-0.063) q[7];
cx q[4], q[7];

// Edge 4-11 (capacity 3)
cx q[4], q[11];
rz(-0.063) q[11];
cx q[4], q[11];

// Edge 5-3 (capacity 3)
cx q[5], q[3];
rz(-0.063) q[3];
cx q[5], q[3];

// Edge 5-9 (capacity 4)
cx q[5], q[9];
rz(-0.084) q[9];
cx q[5], q[9];

// Edge 5-10 (capacity 3)
cx q[5], q[10];
rz(-0.063) q[10];
cx q[5], q[10];

// Edge 5-11 (capacity 4)
cx q[5], q[11];
rz(-0.084) q[11];
cx q[5], q[11];

// Edge 6-8 (capacity 3)
cx q[6], q[8];
rz(-0.063) q[8];
cx q[6], q[8];

// Edge 6-11 (capacity 1)
cx q[6], q[11];
rz(-0.021) q[11];
cx q[6], q[11];

// Edge 7-3 (capacity 2)
cx q[7], q[3];
rz(-0.042) q[3];
cx q[7], q[3];

// Edge 7-8 (capacity 3)
cx q[7], q[8];
rz(-0.063) q[8];
cx q[7], q[8];

// Edge 7-11 (capacity 4)
cx q[7], q[11];
rz(-0.084) q[11];
cx q[7], q[11];

// Edge 8-1 (capacity 4)
cx q[8], q[1];
rz(-0.084) q[1];
cx q[8], q[1];

// Edge 8-3 (capacity 1)
cx q[8], q[3];
rz(-0.021) q[3];
cx q[8], q[3];

// Edge 8-10 (capacity 3)
cx q[8], q[10];
rz(-0.063) q[10];
cx q[8], q[10];

// Edge 9-2 (capacity 2)
cx q[9], q[2];
rz(-0.042) q[2];
cx q[9], q[2];

// Edge 9-3 (capacity 4)
cx q[9], q[3];
rz(-0.084) q[3];
cx q[9], q[3];

// Edge 9-5 (capacity 1)
cx q[9], q[5];
rz(-0.021) q[5];
cx q[9], q[5];

// Edge 9-8 (capacity 4)
cx q[9], q[8];
rz(-0.084) q[8];
cx q[9], q[8];

// Edge 9-10 (capacity 3)
cx q[9], q[10];
rz(-0.063) q[10];
cx q[9], q[10];

// Edge 10-4 (capacity 3)
cx q[10], q[4];
rz(-0.063) q[4];
cx q[10], q[4];

// Edge 10-8 (capacity 1)
cx q[10], q[8];
rz(-0.021) q[8];
cx q[10], q[8];

// Edge 10-9 (capacity 4)
cx q[10], q[9];
rz(-0.084) q[9];
cx q[10], q[9];

// Edge 10-11 (capacity 4)
cx q[10], q[11];
rz(-0.084) q[11];
cx q[10], q[11];

// Layer 3: Final mixing and measurement preparation
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

// Final parameterized rotations
rz(0.157) q[0];
rz(0.136) q[1];
rz(0.115) q[2];
rz(0.093) q[3];
rz(0.072) q[4];
rz(0.050) q[5];
rz(0.029) q[6];
rz(0.007) q[7];
rz(-0.014) q[8];
rz(-0.036) q[9];
rz(-0.057) q[10];
rz(-0.079) q[11];

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