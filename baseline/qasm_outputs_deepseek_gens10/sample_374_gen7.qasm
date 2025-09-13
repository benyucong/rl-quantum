OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First cost Hamiltonian layer
// Edge (0,1) with capacity 2
cx q[0], q[1];
rz(0.314) q[1];
cx q[0], q[1];

// Edge (0,2) with capacity 6
cx q[0], q[2];
rz(0.942) q[2];
cx q[0], q[2];

// Edge (0,5) with capacity 4
cx q[0], q[5];
rz(0.628) q[5];
cx q[0], q[5];

// Edge (0,6) with capacity 4
cx q[0], q[6];
rz(0.628) q[6];
cx q[0], q[6];

// Edge (1,2) with capacity 3
cx q[1], q[2];
rz(0.471) q[2];
cx q[1], q[2];

// Edge (1,5) with capacity 3
cx q[1], q[5];
rz(0.471) q[5];
cx q[1], q[5];

// Edge (1,6) with capacity 4
cx q[1], q[6];
rz(0.628) q[6];
cx q[1], q[6];

// Edge (2,3) with capacity 2
cx q[2], q[3];
rz(0.314) q[3];
cx q[2], q[3];

// Edge (2,5) with capacity 2
cx q[2], q[5];
rz(0.314) q[5];
cx q[2], q[5];

// Edge (2,6) with capacity 1
cx q[2], q[6];
rz(0.157) q[6];
cx q[2], q[6];

// Edge (2,7) with capacity 4
cx q[2], q[7];
rz(0.628) q[7];
cx q[2], q[7];

// Edge (3,6) with capacity 5
cx q[3], q[6];
rz(0.785) q[6];
cx q[3], q[6];

// Edge (4,3) with capacity 3
cx q[4], q[3];
rz(0.471) q[3];
cx q[4], q[3];

// Edge (4,6) with capacity 6
cx q[4], q[6];
rz(0.942) q[6];
cx q[4], q[6];

// Edge (5,1) with capacity 1
cx q[5], q[1];
rz(0.157) q[1];
cx q[5], q[1];

// Edge (5,6) with capacity 2
cx q[5], q[6];
rz(0.314) q[6];
cx q[5], q[6];

// Edge (6,3) with capacity 1
cx q[6], q[3];
rz(0.157) q[3];
cx q[6], q[3];

// Edge (6,4) with capacity 1
cx q[6], q[4];
rz(0.157) q[4];
cx q[6], q[4];

// First mixing layer
rx(1.256) q[0];
rx(1.256) q[1];
rx(1.256) q[2];
rx(1.256) q[3];
rx(1.256) q[4];
rx(1.256) q[5];
rx(1.256) q[6];
rx(1.256) q[7];

// Layer 2: Second cost Hamiltonian
// Repeat edge interactions with optimized parameters
cx q[0], q[1];
rz(0.471) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(1.413) q[2];
cx q[0], q[2];

cx q[0], q[5];
rz(0.942) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(0.942) q[6];
cx q[0], q[6];

cx q[1], q[2];
rz(0.707) q[2];
cx q[1], q[2];

cx q[1], q[5];
rz(0.707) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(0.942) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(0.471) q[3];
cx q[2], q[3];

cx q[2], q[5];
rz(0.471) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.236) q[6];
cx q[2], q[6];

cx q[2], q[7];
rz(0.942) q[7];
cx q[2], q[7];

cx q[3], q[6];
rz(1.178) q[6];
cx q[3], q[6];

cx q[4], q[3];
rz(0.707) q[3];
cx q[4], q[3];

cx q[4], q[6];
rz(1.413) q[6];
cx q[4], q[6];

cx q[5], q[1];
rz(0.236) q[1];
cx q[5], q[1];

cx q[5], q[6];
rz(0.471) q[6];
cx q[5], q[6];

cx q[6], q[3];
rz(0.236) q[3];
cx q[6], q[3];

cx q[6], q[4];
rz(0.236) q[4];
cx q[6], q[4];

// Second mixing layer
rx(1.884) q[0];
rx(1.884) q[1];
rx(1.884) q[2];
rx(1.884) q[3];
rx(1.884) q[4];
rx(1.884) q[5];
rx(1.884) q[6];
rx(1.884) q[7];

// Layer 3: Final cost Hamiltonian
// Final edge interactions with optimized parameters
cx q[0], q[1];
rz(0.628) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(1.885) q[2];
cx q[0], q[2];

cx q[0], q[5];
rz(1.257) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(1.257) q[6];
cx q[0], q[6];

cx q[1], q[2];
rz(0.942) q[2];
cx q[1], q[2];

cx q[1], q[5];
rz(0.942) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(1.257) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(0.628) q[3];
cx q[2], q[3];

cx q[2], q[5];
rz(0.628) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.314) q[6];
cx q[2], q[6];

cx q[2], q[7];
rz(1.257) q[7];
cx q[2], q[7];

cx q[3], q[6];
rz(1.571) q[6];
cx q[3], q[6];

cx q[4], q[3];
rz(0.942) q[3];
cx q[4], q[3];

cx q[4], q[6];
rz(1.885) q[6];
cx q[4], q[6];

cx q[5], q[1];
rz(0.314) q[1];
cx q[5], q[1];

cx q[5], q[6];
rz(0.628) q[6];
cx q[5], q[6];

cx q[6], q[3];
rz(0.314) q[3];
cx q[6], q[3];

cx q[6], q[4];
rz(0.314) q[4];
cx q[6], q[4];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];