OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

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
h q[12];
h q[13];

// Parameterized rotations for flow encoding
rx(0.7854) q[0];
rz(0.5236) q[0];
rx(0.7854) q[1];
rz(0.5236) q[1];
rx(1.0472) q[2];
rz(0.7854) q[2];
rx(0.3927) q[3];
rz(0.2618) q[3];
rx(1.0472) q[4];
rz(0.7854) q[4];
rx(0.7854) q[5];
rz(0.5236) q[5];
rx(0.7854) q[6];
rz(0.5236) q[6];
rx(0.3927) q[7];
rz(0.2618) q[7];
rx(1.0472) q[8];
rz(0.7854) q[8];
rx(0.7854) q[9];
rz(0.5236) q[9];
rx(0.3927) q[10];
rz(0.2618) q[10];
rx(0.3927) q[11];
rz(0.2618) q[11];
rx(0.7854) q[12];
rz(0.5236) q[12];
rx(0.7854) q[13];
rz(0.5236) q[13];

// Layer 2: Entangling operations for flow constraints
// Source node 0 constraints
cx q[0], q[7];
cx q[0], q[8];
cx q[0], q[9];

// Sink node 6 constraints
cx q[6], q[10];
cx q[6], q[11];

// Edge capacity constraints
// Edge 0->1 (capacity 1)
cx q[1], q[12];
rz(-0.5236) q[12];
cx q[1], q[12];

// Edge 0->2 (capacity 1)
cx q[2], q[13];
rz(-0.5236) q[13];
cx q[2], q[13];

// Edge 0->4 (capacity 2)
cx q[4], q[7];
rz(-0.2618) q[7];
cx q[4], q[7];
cx q[4], q[8];
rz(-0.2618) q[8];
cx q[4], q[8];

// Edge 1->6 (capacity 1)
cx q[6], q[10];
rz(-0.5236) q[10];
cx q[6], q[10];

// Edge 2->1 (capacity 2)
cx q[1], q[9];
rz(-0.2618) q[9];
cx q[1], q[9];
cx q[1], q[12];
rz(-0.2618) q[12];
cx q[1], q[12];

// Edge 2->4 (capacity 1)
cx q[4], q[8];
rz(-0.5236) q[8];
cx q[4], q[8];

// Edge 4->2 (capacity 2)
cx q[2], q[13];
rz(-0.2618) q[13];
cx q[2], q[13];
cx q[2], q[9];
rz(-0.2618) q[9];
cx q[2], q[9];

// Edge 4->6 (capacity 1)
cx q[6], q[11];
rz(-0.5236) q[11];
cx q[6], q[11];

// Layer 3: Final parameterized rotations and measurement
rx(0.3927) q[0];
rz(0.2618) q[0];
rx(0.3927) q[1];
rz(0.2618) q[1];
rx(0.7854) q[2];
rz(0.5236) q[2];
rx(0.1963) q[3];
rz(0.1309) q[3];
rx(0.7854) q[4];
rz(0.5236) q[4];
rx(0.3927) q[5];
rz(0.2618) q[5];
rx(0.3927) q[6];
rz(0.2618) q[6];
rx(0.1963) q[7];
rz(0.1309) q[7];
rx(0.7854) q[8];
rz(0.5236) q[8];
rx(0.3927) q[9];
rz(0.2618) q[9];
rx(0.1963) q[10];
rz(0.1309) q[10];
rx(0.1963) q[11];
rz(0.1309) q[11];
rx(0.3927) q[12];
rz(0.2618) q[12];
rx(0.3927) q[13];
rz(0.2618) q[13];

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
c[12] = measure q[12];
c[13] = measure q[13];