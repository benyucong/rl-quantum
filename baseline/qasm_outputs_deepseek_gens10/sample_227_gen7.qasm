OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];

// Layer 1: Problem-specific entangling gates (edge cover constraints)
// Edge (0,5)
cx q[0], q[5];
rz(0.5236) q[5];
cx q[0], q[5];

// Edge (1,3)
cx q[1], q[3];
rz(0.5236) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.5236) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.5236) q[5];
cx q[1], q[5];

// Edge (2,3)
cx q[2], q[3];
rz(0.5236) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.5236) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.5236) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.5236) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.5236) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.5236) q[5];
cx q[4], q[5];

// Layer 2: Mixer and parameterized rotations
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];

// Layer 2: Problem-specific entangling gates
cx q[0], q[5];
rz(0.3491) q[5];
cx q[0], q[5];

cx q[1], q[3];
rz(0.3491) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.3491) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(0.3491) q[5];
cx q[1], q[5];

cx q[2], q[3];
rz(0.3491) q[3];
cx q[2], q[3];

cx q[2], q[6];
rz(0.3491) q[6];
cx q[2], q[6];

cx q[3], q[4];
rz(0.3491) q[4];
cx q[3], q[4];

cx q[3], q[5];
rz(0.3491) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(0.3491) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.3491) q[5];
cx q[4], q[5];

// Layer 3: Final mixer and parameterized rotations
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

// Layer 3: Final problem-specific entangling gates
cx q[0], q[5];
rz(0.2618) q[5];
cx q[0], q[5];

cx q[1], q[3];
rz(0.2618) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.2618) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(0.2618) q[5];
cx q[1], q[5];

cx q[2], q[3];
rz(0.2618) q[3];
cx q[2], q[3];

cx q[2], q[6];
rz(0.2618) q[6];
cx q[2], q[6];

cx q[3], q[4];
rz(0.2618) q[4];
cx q[3], q[4];

cx q[3], q[5];
rz(0.2618) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(0.2618) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.2618) q[5];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];