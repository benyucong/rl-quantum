OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem unitary (edge interactions)
// Edge 0-5 (capacity 1)
cx q[0], q[5];
rz(0.314) q[5];
cx q[0], q[5];

// Edge 0-6 (capacity 4)
cx q[0], q[6];
rz(1.256) q[6];
cx q[0], q[6];

// Edge 1-3 (capacity 2)
cx q[1], q[3];
rz(0.628) q[3];
cx q[1], q[3];

// Edge 2-4 (capacity 2)
cx q[2], q[4];
rz(0.628) q[4];
cx q[2], q[4];

// Edge 3-1 (capacity 3)
cx q[3], q[1];
rz(0.942) q[1];
cx q[3], q[1];

// Edge 3-5 (capacity 1)
cx q[3], q[5];
rz(0.314) q[5];
cx q[3], q[5];

// Edge 4-3 (capacity 1)
cx q[4], q[3];
rz(0.314) q[3];
cx q[4], q[3];

// Layer 1: Mixing unitary
rx(1.047) q[0];
rx(1.047) q[1];
rx(1.047) q[2];
rx(1.047) q[3];
rx(1.047) q[4];
rx(1.047) q[5];
rx(1.047) q[6];

// Layer 2: Problem unitary
cx q[0], q[5];
rz(0.314) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(1.256) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.628) q[3];
cx q[1], q[3];
cx q[2], q[4];
rz(0.628) q[4];
cx q[2], q[4];
cx q[3], q[1];
rz(0.942) q[1];
cx q[3], q[1];
cx q[3], q[5];
rz(0.314) q[5];
cx q[3], q[5];
cx q[4], q[3];
rz(0.314) q[3];
cx q[4], q[3];

// Layer 2: Mixing unitary
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];

// Layer 3: Problem unitary
cx q[0], q[5];
rz(0.314) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(1.256) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.628) q[3];
cx q[1], q[3];
cx q[2], q[4];
rz(0.628) q[4];
cx q[2], q[4];
cx q[3], q[1];
rz(0.942) q[1];
cx q[3], q[1];
cx q[3], q[5];
rz(0.314) q[5];
cx q[3], q[5];
cx q[4], q[3];
rz(0.314) q[3];
cx q[4], q[3];

// Layer 3: Final mixing
rx(0.524) q[0];
rx(0.524) q[1];
rx(0.524) q[2];
rx(0.524) q[3];
rx(0.524) q[4];
rx(0.524) q[5];
rx(0.524) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];