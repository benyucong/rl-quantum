OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initial Hadamard and parameterized rotations
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

// Edge interactions with optimal parameters
// Edge 0-6 (capacity 4)
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];

// Edge 3-8 (capacity 2)
cx q[3], q[8];
rz(0.3927) q[8];
cx q[3], q[8];

// Edge 4-8 (capacity 4)
cx q[4], q[8];
rz(0.7854) q[8];
cx q[4], q[8];

// Edge 5-10 (capacity 2)
cx q[5], q[10];
rz(0.3927) q[10];
cx q[5], q[10];

// Edge 6-1 (capacity 4)
cx q[6], q[1];
rz(0.7854) q[1];
cx q[6], q[1];

// Edge 6-2 (capacity 2)
cx q[6], q[2];
rz(0.3927) q[2];
cx q[6], q[2];

// Edge 6-4 (capacity 1)
cx q[6], q[4];
rz(0.1963) q[4];
cx q[6], q[4];

// Edge 6-9 (capacity 2)
cx q[6], q[9];
rz(0.3927) q[9];
cx q[6], q[9];

// Edge 6-11 (capacity 1)
cx q[6], q[11];
rz(0.1963) q[11];
cx q[6], q[11];

// Edge 7-9 (capacity 1)
cx q[7], q[9];
rz(0.1963) q[9];
cx q[7], q[9];

// Edge 8-5 (capacity 2)
cx q[8], q[5];
rz(0.3927) q[5];
cx q[8], q[5];

// Edge 9-6 (capacity 2)
cx q[9], q[6];
rz(0.3927) q[6];
cx q[9], q[6];

// Edge 10-1 (capacity 3)
cx q[10], q[1];
rz(0.5890) q[1];
cx q[10], q[1];

// Edge 10-4 (capacity 2)
cx q[10], q[4];
rz(0.3927) q[4];
cx q[10], q[4];

// Edge 10-8 (capacity 1)
cx q[10], q[8];
rz(0.1963) q[8];
cx q[10], q[8];

// Layer 2: Mixing and parameterized rotations
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
h q[8];
rz(0.5236) q[8];
h q[8];
h q[9];
rz(0.5236) q[9];
h q[9];
h q[10];
rz(0.5236) q[10];
h q[10];
h q[11];
rz(0.5236) q[11];
h q[11];

// Layer 3: Repeat edge interactions with optimized parameters
cx q[0], q[6];
rz(0.6545) q[6];
cx q[0], q[6];
cx q[3], q[8];
rz(0.3273) q[8];
cx q[3], q[8];
cx q[4], q[8];
rz(0.6545) q[8];
cx q[4], q[8];
cx q[5], q[10];
rz(0.3273) q[10];
cx q[5], q[10];
cx q[6], q[1];
rz(0.6545) q[1];
cx q[6], q[1];
cx q[6], q[2];
rz(0.3273) q[2];
cx q[6], q[2];
cx q[6], q[4];
rz(0.1636) q[4];
cx q[6], q[4];
cx q[6], q[9];
rz(0.3273) q[9];
cx q[6], q[9];
cx q[6], q[11];
rz(0.1636) q[11];
cx q[6], q[11];
cx q[7], q[9];
rz(0.1636) q[9];
cx q[7], q[9];
cx q[8], q[5];
rz(0.3273) q[5];
cx q[8], q[5];
cx q[9], q[6];
rz(0.3273) q[6];
cx q[9], q[6];
cx q[10], q[1];
rz(0.4909) q[1];
cx q[10], q[1];
cx q[10], q[4];
rz(0.3273) q[4];
cx q[10], q[4];
cx q[10], q[8];
rz(0.1636) q[8];
cx q[10], q[8];

// Layer 4: Final mixing and rotations
h q[0];
rz(0.4363) q[0];
h q[0];
h q[1];
rz(0.4363) q[1];
h q[1];
h q[2];
rz(0.4363) q[2];
h q[2];
h q[3];
rz(0.4363) q[3];
h q[3];
h q[4];
rz(0.4363) q[4];
h q[4];
h q[5];
rz(0.4363) q[5];
h q[5];
h q[6];
rz(0.4363) q[6];
h q[6];
h q[7];
rz(0.4363) q[7];
h q[7];
h q[8];
rz(0.4363) q[8];
h q[8];
h q[9];
rz(0.4363) q[9];
h q[9];
h q[10];
rz(0.4363) q[10];
h q[10];
h q[11];
rz(0.4363) q[11];
h q[11];

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