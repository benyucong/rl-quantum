OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard on all qubits
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

// Layer 2: Edge interactions based on capacities
// Edge (0,4) capacity 1
cx q[0], q[4];
rz(0.1273) q[4];
cx q[0], q[4];

// Edge (0,5) capacity 4
cx q[0], q[5];
rz(0.5092) q[5];
cx q[0], q[5];

// Edge (0,8) capacity 1
cx q[0], q[8];
rz(0.1273) q[8];
cx q[0], q[8];

// Edge (0,9) capacity 2
cx q[0], q[9];
rz(0.2546) q[9];
cx q[0], q[9];

// Edge (0,10) capacity 2
cx q[0], q[10];
rz(0.2546) q[10];
cx q[0], q[10];

// Edge (1,7) capacity 4
cx q[1], q[7];
rz(0.5092) q[7];
cx q[1], q[7];

// Edge (1,8) capacity 2
cx q[1], q[8];
rz(0.2546) q[8];
cx q[1], q[8];

// Edge (1,9) capacity 1
cx q[1], q[9];
rz(0.1273) q[9];
cx q[1], q[9];

// Edge (2,1) capacity 4
cx q[2], q[1];
rz(0.5092) q[1];
cx q[2], q[1];

// Edge (2,4) capacity 4
cx q[2], q[4];
rz(0.5092) q[4];
cx q[2], q[4];

// Edge (2,6) capacity 3
cx q[2], q[6];
rz(0.3819) q[6];
cx q[2], q[6];

// Edge (2,7) capacity 2
cx q[2], q[7];
rz(0.2546) q[7];
cx q[2], q[7];

// Edge (2,8) capacity 3
cx q[2], q[8];
rz(0.3819) q[8];
cx q[2], q[8];

// Edge (3,1) capacity 2
cx q[3], q[1];
rz(0.2546) q[1];
cx q[3], q[1];

// Edge (3,5) capacity 3
cx q[3], q[5];
rz(0.3819) q[5];
cx q[3], q[5];

// Edge (3,6) capacity 4
cx q[3], q[6];
rz(0.5092) q[6];
cx q[3], q[6];

// Edge (3,7) capacity 4
cx q[3], q[7];
rz(0.5092) q[7];
cx q[3], q[7];

// Edge (3,8) capacity 1
cx q[3], q[8];
rz(0.1273) q[8];
cx q[3], q[8];

// Edge (3,9) capacity 2
cx q[3], q[9];
rz(0.2546) q[9];
cx q[3], q[9];

// Edge (3,10) capacity 3
cx q[3], q[10];
rz(0.3819) q[10];
cx q[3], q[10];

// Edge (4,1) capacity 1
cx q[4], q[1];
rz(0.1273) q[1];
cx q[4], q[1];

// Edge (4,5) capacity 4
cx q[4], q[5];
rz(0.5092) q[5];
cx q[4], q[5];

// Edge (4,7) capacity 3
cx q[4], q[7];
rz(0.3819) q[7];
cx q[4], q[7];

// Edge (5,4) capacity 2
cx q[5], q[4];
rz(0.2546) q[4];
cx q[5], q[4];

// Edge (5,6) capacity 1
cx q[5], q[6];
rz(0.1273) q[6];
cx q[5], q[6];

// Edge (5,7) capacity 1
cx q[5], q[7];
rz(0.1273) q[7];
cx q[5], q[7];

// Edge (5,9) capacity 4
cx q[5], q[9];
rz(0.5092) q[9];
cx q[5], q[9];

// Edge (5,10) capacity 1
cx q[5], q[10];
rz(0.1273) q[10];
cx q[5], q[10];

// Edge (6,1) capacity 4
cx q[6], q[1];
rz(0.5092) q[1];
cx q[6], q[1];

// Edge (6,2) capacity 3
cx q[6], q[2];
rz(0.3819) q[2];
cx q[6], q[2];

// Edge (6,4) capacity 1
cx q[6], q[4];
rz(0.1273) q[4];
cx q[6], q[4];

// Edge (6,5) capacity 1
cx q[6], q[5];
rz(0.1273) q[5];
cx q[6], q[5];

// Edge (6,7) capacity 3
cx q[6], q[7];
rz(0.3819) q[7];
cx q[6], q[7];

// Edge (6,8) capacity 4
cx q[6], q[8];
rz(0.5092) q[8];
cx q[6], q[8];

// Edge (6,9) capacity 3
cx q[6], q[9];
rz(0.3819) q[9];
cx q[6], q[9];

// Edge (7,9) capacity 2
cx q[7], q[9];
rz(0.2546) q[9];
cx q[7], q[9];

// Edge (8,4) capacity 1
cx q[8], q[4];
rz(0.1273) q[4];
cx q[8], q[4];

// Edge (9,1) capacity 2
cx q[9], q[1];
rz(0.2546) q[1];
cx q[9], q[1];

// Edge (9,2) capacity 2
cx q[9], q[2];
rz(0.2546) q[2];
cx q[9], q[2];

// Edge (9,4) capacity 2
cx q[9], q[4];
rz(0.2546) q[4];
cx q[9], q[4];

// Edge (9,6) capacity 3
cx q[9], q[6];
rz(0.3819) q[6];
cx q[9], q[6];

// Edge (9,8) capacity 3
cx q[9], q[8];
rz(0.3819) q[8];
cx q[9], q[8];

// Layer 3: Mixing layer with Hadamards
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

// Layer 4: Final phase rotations
rz(0.1273) q[0];
rz(0.5092) q[1];
rz(0.3819) q[2];
rz(0.5092) q[3];
rz(0.5092) q[4];
rz(0.5092) q[5];
rz(0.5092) q[6];
rz(0.5092) q[7];
rz(0.5092) q[8];
rz(0.5092) q[9];
rz(0.2546) q[10];

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