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
// Edge 0-1 (capacity 4)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge 0-3 (capacity 1)
cx q[0], q[3];
rz(0.1963) q[3];
cx q[0], q[3];
// Edge 0-4 (capacity 2)
cx q[0], q[4];
rz(0.3927) q[4];
cx q[0], q[4];
// Edge 1-4 (capacity 1)
cx q[1], q[4];
rz(0.1963) q[4];
cx q[1], q[4];
// Edge 1-5 (capacity 3)
cx q[1], q[5];
rz(0.5890) q[5];
cx q[1], q[5];
// Edge 2-3 (capacity 2)
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];
// Edge 2-5 (capacity 1)
cx q[2], q[5];
rz(0.1963) q[5];
cx q[2], q[5];
// Edge 2-6 (capacity 6)
cx q[2], q[6];
rz(1.1781) q[6];
cx q[2], q[6];
// Edge 3-1 (capacity 2)
cx q[3], q[1];
rz(0.3927) q[1];
cx q[3], q[1];
// Edge 3-7 (capacity 5)
cx q[3], q[7];
rz(0.9817) q[7];
cx q[3], q[7];
// Edge 4-2 (capacity 2)
cx q[4], q[2];
rz(0.3927) q[2];
cx q[4], q[2];
// Edge 4-7 (capacity 4)
cx q[4], q[7];
rz(0.7854) q[7];
cx q[4], q[7];
// Edge 5-2 (capacity 3)
cx q[5], q[2];
rz(0.5890) q[2];
cx q[5], q[2];
// Edge 5-4 (capacity 2)
cx q[5], q[4];
rz(0.3927) q[4];
cx q[5], q[4];
// Edge 6-2 (capacity 1)
cx q[6], q[2];
rz(0.1963) q[2];
cx q[6], q[2];

// First mixing layer
h q[0];
rz(0.5236) q[0];
h q[0];
h q[1];
rz(0.5236) q[1];
h q[1];
h q[2];
rz(0.5236) q[2];
h q[2];
h q[3];
rz(0.5236) q[3];
h q[3];
h q[4];
rz(0.5236) q[4];
h q[4];
h q[5];
rz(0.5236) q[5];
h q[5];
h q[6];
rz(0.5236) q[6];
h q[6];
h q[7];
rz(0.5236) q[7];
h q[7];

// Layer 2: Second cost Hamiltonian
// Edge 0-1 (capacity 4)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge 0-3 (capacity 1)
cx q[0], q[3];
rz(0.1963) q[3];
cx q[0], q[3];
// Edge 0-4 (capacity 2)
cx q[0], q[4];
rz(0.3927) q[4];
cx q[0], q[4];
// Edge 1-4 (capacity 1)
cx q[1], q[4];
rz(0.1963) q[4];
cx q[1], q[4];
// Edge 1-5 (capacity 3)
cx q[1], q[5];
rz(0.5890) q[5];
cx q[1], q[5];
// Edge 2-3 (capacity 2)
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];
// Edge 2-5 (capacity 1)
cx q[2], q[5];
rz(0.1963) q[5];
cx q[2], q[5];
// Edge 2-6 (capacity 6)
cx q[2], q[6];
rz(1.1781) q[6];
cx q[2], q[6];
// Edge 3-1 (capacity 2)
cx q[3], q[1];
rz(0.3927) q[1];
cx q[3], q[1];
// Edge 3-7 (capacity 5)
cx q[3], q[7];
rz(0.9817) q[7];
cx q[3], q[7];
// Edge 4-2 (capacity 2)
cx q[4], q[2];
rz(0.3927) q[2];
cx q[4], q[2];
// Edge 4-7 (capacity 4)
cx q[4], q[7];
rz(0.7854) q[7];
cx q[4], q[7];
// Edge 5-2 (capacity 3)
cx q[5], q[2];
rz(0.5890) q[2];
cx q[5], q[2];
// Edge 5-4 (capacity 2)
cx q[5], q[4];
rz(0.3927) q[4];
cx q[5], q[4];
// Edge 6-2 (capacity 1)
cx q[6], q[2];
rz(0.1963) q[2];
cx q[6], q[2];

// Second mixing layer
h q[0];
rz(0.5236) q[0];
h q[0];
h q[1];
rz(0.5236) q[1];
h q[1];
h q[2];
rz(0.5236) q[2];
h q[2];
h q[3];
rz(0.5236) q[3];
h q[3];
h q[4];
rz(0.5236) q[4];
h q[4];
h q[5];
rz(0.5236) q[5];
h q[5];
h q[6];
rz(0.5236) q[6];
h q[6];
h q[7];
rz(0.5236) q[7];
h q[7];

// Layer 3: Third cost Hamiltonian
// Edge 0-1 (capacity 4)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge 0-3 (capacity 1)
cx q[0], q[3];
rz(0.1963) q[3];
cx q[0], q[3];
// Edge 0-4 (capacity 2)
cx q[0], q[4];
rz(0.3927) q[4];
cx q[0], q[4];
// Edge 1-4 (capacity 1)
cx q[1], q[4];
rz(0.1963) q[4];
cx q[1], q[4];
// Edge 1-5 (capacity 3)
cx q[1], q[5];
rz(0.5890) q[5];
cx q[1], q[5];
// Edge 2-3 (capacity 2)
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];
// Edge 2-5 (capacity 1)
cx q[2], q[5];
rz(0.1963) q[5];
cx q[2], q[5];
// Edge 2-6 (capacity 6)
cx q[2], q[6];
rz(1.1781) q[6];
cx q[2], q[6];
// Edge 3-1 (capacity 2)
cx q[3], q[1];
rz(0.3927) q[1];
cx q[3], q[1];
// Edge 3-7 (capacity 5)
cx q[3], q[7];
rz(0.9817) q[7];
cx q[3], q[7];
// Edge 4-2 (capacity 2)
cx q[4], q[2];
rz(0.3927) q[2];
cx q[4], q[2];
// Edge 4-7 (capacity 4)
cx q[4], q[7];
rz(0.7854) q[7];
cx q[4], q[7];
// Edge 5-2 (capacity 3)
cx q[5], q[2];
rz(0.5890) q[2];
cx q[5], q[2];
// Edge 5-4 (capacity 2)
cx q[5], q[4];
rz(0.3927) q[4];
cx q[5], q[4];
// Edge 6-2 (capacity 1)
cx q[6], q[2];
rz(0.1963) q[2];
cx q[6], q[2];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];