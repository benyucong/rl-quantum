OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Problem unitary (k-clique constraints for k=3)
// Edge (0,1) constraint
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge (0,2) constraint
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];

// Edge (0,4) constraint
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];

// Edge (0,5) constraint
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];

// Edge (1,2) constraint
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];

// Edge (5,3) constraint
cx q[5], q[3];
rz(0.7854) q[3];
cx q[5], q[3];

// Layer 1: Mixing unitary
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];

// Layer 2: Problem unitary
cx q[0], q[1];
rz(0.5236) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];

cx q[0], q[4];
rz(0.5236) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.5236) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.5236) q[2];
cx q[1], q[2];

cx q[5], q[3];
rz(0.5236) q[3];
cx q[5], q[3];

// Layer 2: Mixing unitary
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];

// Layer 3: Problem unitary
cx q[0], q[1];
rz(0.3491) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.3491) q[2];
cx q[0], q[2];

cx q[0], q[4];
rz(0.3491) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.3491) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.3491) q[2];
cx q[1], q[2];

cx q[5], q[3];
rz(0.3491) q[3];
cx q[5], q[3];

// Layer 3: Mixing unitary
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];

// Layer 4: Problem unitary
cx q[0], q[1];
rz(0.2618) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.2618) q[2];
cx q[0], q[2];

cx q[0], q[4];
rz(0.2618) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.2618) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.2618) q[2];
cx q[1], q[2];

cx q[5], q[3];
rz(0.2618) q[3];
cx q[5], q[3];

// Layer 4: Mixing unitary
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];