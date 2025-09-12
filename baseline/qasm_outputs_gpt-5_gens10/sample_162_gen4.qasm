OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];

// Entanglement 
cx q[0], q[2];
cx q[1], q[4];
cx q[2], q[3];
cx q[3], q[4];
cx q[3], q[5];
cx q[3], q[6];
cx q[5], q[6];

// Layer 2
rz(0.2452) q[0];
rz(0.2452) q[1];
rz(0.2452) q[2];
rz(0.2452) q[3];
rz(0.2452) q[4];
rz(0.2452) q[5];
rz(0.2452) q[6];

// Entanglement 
cx q[4], q[3];
cx q[3], q[2];
cx q[5], q[6];

// Layer 3
rx(-1.5323) q[0];
rx(-1.5323) q[1];
rx(-1.5323) q[2];
rx(-1.5323) q[3];
rx(-1.5323) q[4];
rx(-1.5323) q[5];
rx(-1.5323) q[6];

// Final circuit measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];