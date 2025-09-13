OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
// Layer 1: Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
// Edge cost terms (0-1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge cost terms (0-2)
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
// Edge cost terms (1-2)
cx q[1], q[2];
rz(0.3927) q[2];
cx q[1], q[2];
// Edge cost terms (1-4)
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];
// Edge cost terms (1-6)
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];
// Edge cost terms (2-7)
cx q[2], q[7];
rz(0.7854) q[7];
cx q[2], q[7];
// Edge cost terms (3-4)
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];
// Edge cost terms (3-5)
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];
// Edge cost terms (4-5)
cx q[4], q[5];
rz(0.3927) q[5];
cx q[4], q[5];
// Edge cost terms (6-7)
cx q[6], q[7];
rz(0.7854) q[7];
cx q[6], q[7];
// Layer 1 mixing
h q[0];
rz(1.5708) q[0];
h q[0];
h q[1];
rz(1.5708) q[1];
h q[1];
h q[2];
rz(1.5708) q[2];
h q[2];
h q[3];
rz(1.5708) q[3];
h q[3];
h q[4];
rz(1.5708) q[4];
h q[4];
h q[5];
rz(1.5708) q[5];
h q[5];
h q[6];
rz(1.5708) q[6];
h q[6];
h q[7];
rz(1.5708) q[7];
h q[7];
// Layer 2: Repeat cost terms with optimized parameters
// Edge cost terms (0-1)
cx q[0], q[1];
rz(0.5236) q[1];
cx q[0], q[1];
// Edge cost terms (0-2)
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];
// Edge cost terms (1-2)
cx q[1], q[2];
rz(0.2618) q[2];
cx q[1], q[2];
// Edge cost terms (1-4)
cx q[1], q[4];
rz(0.5236) q[4];
cx q[1], q[4];
// Edge cost terms (1-6)
cx q[1], q[6];
rz(0.5236) q[6];
cx q[1], q[6];
// Edge cost terms (2-7)
cx q[2], q[7];
rz(0.5236) q[7];
cx q[2], q[7];
// Edge cost terms (3-4)
cx q[3], q[4];
rz(0.5236) q[4];
cx q[3], q[4];
// Edge cost terms (3-5)
cx q[3], q[5];
rz(0.5236) q[5];
cx q[3], q[5];
// Edge cost terms (4-5)
cx q[4], q[5];
rz(0.2618) q[5];
cx q[4], q[5];
// Edge cost terms (6-7)
cx q[6], q[7];
rz(0.5236) q[7];
cx q[6], q[7];
// Layer 2 mixing
h q[0];
rz(1.0472) q[0];
h q[0];
h q[1];
rz(1.0472) q[1];
h q[1];
h q[2];
rz(1.0472) q[2];
h q[2];
h q[3];
rz(1.0472) q[3];
h q[3];
h q[4];
rz(1.0472) q[4];
h q[4];
h q[5];
rz(1.0472) q[5];
h q[5];
h q[6];
rz(1.0472) q[6];
h q[6];
h q[7];
rz(1.0472) q[7];
h q[7];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];