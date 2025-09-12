OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// First layer of parameterized rotations based on weights
rx(1.3213) q[0];
rz(2.0472) q[0];
rx(1.2389) q[1];
rz(0.8263) q[1];
rx(0.9787) q[2];
rz(1.5429) q[2];
rx(1.6643) q[3];
rz(1.5697) q[3];
rx(0.7854) q[4];
rz(1.4376) q[4];
rx(1.9828) q[5];
rz(0.9244) q[5];
rx(1.5634) q[6];
rz(0.1682) q[6];
rx(1.6513) q[7];
rz(1.1738) q[7];
rx(0.8451) q[8];
rz(1.0564) q[8];

// Entangling gates based on edges
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[8];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];
cx q[4], q[6];
cx q[5], q[7];
cx q[6], q[7];

// Second layer of parameterized rotations
rx(1.3546) q[0];
rz(2.1273) q[0];
rx(1.0493) q[1];
rz(0.7321) q[1];
rx(1.6578) q[2];
rz(0.9534) q[2];
rx(1.5732) q[3];
rz(1.0412) q[3];
rx(1.4438) q[4];
rz(1.2947) q[4];
rx(1.2345) q[5];
rz(0.8524) q[5];
rx(1.9758) q[6];
rz(1.4012) q[6];
rx(1.5624) q[7];
rz(0.4391) q[7];
rx(0.9786) q[8];
rz(2.0023) q[8];

// Measure qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];