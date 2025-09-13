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
rz(0.7854) q[0];
rz(0.5236) q[1];
rz(1.0472) q[2];
rz(0.7854) q[3];
rz(1.3089) q[4];
rz(0.7854) q[5];
rz(0.5236) q[6];
rz(1.0472) q[7];

cx q[0], q[6];
rz(0.3927) q[6];
cx q[0], q[6];

cx q[1], q[3];
rz(0.5890) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.5890) q[4];
cx q[1], q[4];

cx q[1], q[7];
rz(0.7854) q[7];
cx q[1], q[7];

cx q[2], q[1];
rz(1.1781) q[1];
cx q[2], q[1];

cx q[2], q[5];
rz(0.3927) q[5];
cx q[2], q[5];

cx q[2], q[7];
rz(0.9817) q[7];
cx q[2], q[7];

cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];

cx q[4], q[1];
rz(0.7854) q[1];
cx q[4], q[1];

cx q[4], q[2];
rz(0.9817) q[2];
cx q[4], q[2];

cx q[4], q[7];
rz(0.9817) q[7];
cx q[4], q[7];

cx q[5], q[4];
rz(1.3744) q[4];
cx q[5], q[4];

cx q[5], q[6];
rz(0.5890) q[6];
cx q[5], q[6];

cx q[6], q[4];
rz(0.3927) q[4];
cx q[6], q[4];

// First mixing layer
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

// Layer 2: Second cost Hamiltonian
rz(0.6545) q[0];
rz(0.4363) q[1];
rz(0.8727) q[2];
rz(0.6545) q[3];
rz(1.0909) q[4];
rz(0.6545) q[5];
rz(0.4363) q[6];
rz(0.8727) q[7];

cx q[0], q[6];
rz(0.3273) q[6];
cx q[0], q[6];

cx q[1], q[3];
rz(0.4909) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.4909) q[4];
cx q[1], q[4];

cx q[1], q[7];
rz(0.6545) q[7];
cx q[1], q[7];

cx q[2], q[1];
rz(0.9818) q[1];
cx q[2], q[1];

cx q[2], q[5];
rz(0.3273) q[5];
cx q[2], q[5];

cx q[2], q[7];
rz(0.8182) q[7];
cx q[2], q[7];

cx q[3], q[4];
rz(0.6545) q[4];
cx q[3], q[4];

cx q[4], q[1];
rz(0.6545) q[1];
cx q[4], q[1];

cx q[4], q[2];
rz(0.8182) q[2];
cx q[4], q[2];

cx q[4], q[7];
rz(0.8182) q[7];
cx q[4], q[7];

cx q[5], q[4];
rz(1.1455) q[4];
cx q[5], q[4];

cx q[5], q[6];
rz(0.4909) q[6];
cx q[5], q[6];

cx q[6], q[4];
rz(0.3273) q[4];
cx q[6], q[4];

// Second mixing layer
h q[0];
rz(1.3089) q[0];
h q[0];
h q[1];
rz(1.3089) q[1];
h q[1];
h q[2];
rz(1.3089) q[2];
h q[2];
h q[3];
rz(1.3089) q[3];
h q[3];
h q[4];
rz(1.3089) q[4];
h q[4];
h q[5];
rz(1.3089) q[5];
h q[5];
h q[6];
rz(1.3089) q[6];
h q[6];
h q[7];
rz(1.3089) q[7];
h q[7];

// Layer 3: Final cost Hamiltonian
rz(0.5236) q[0];
rz(0.3491) q[1];
rz(0.6981) q[2];
rz(0.5236) q[3];
rz(0.8727) q[4];
rz(0.5236) q[5];
rz(0.3491) q[6];
rz(0.6981) q[7];

cx q[0], q[6];
rz(0.2618) q[6];
cx q[0], q[6];

cx q[1], q[3];
rz(0.3927) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.3927) q[4];
cx q[1], q[4];

cx q[1], q[7];
rz(0.5236) q[7];
cx q[1], q[7];

cx q[2], q[1];
rz(0.7854) q[1];
cx q[2], q[1];

cx q[2], q[5];
rz(0.2618) q[5];
cx q[2], q[5];

cx q[2], q[7];
rz(0.6545) q[7];
cx q[2], q[7];

cx q[3], q[4];
rz(0.5236) q[4];
cx q[3], q[4];

cx q[4], q[1];
rz(0.5236) q[1];
cx q[4], q[1];

cx q[4], q[2];
rz(0.6545) q[2];
cx q[4], q[2];

cx q[4], q[7];
rz(0.6545) q[7];
cx q[4], q[7];

cx q[5], q[4];
rz(0.9163) q[4];
cx q[5], q[4];

cx q[5], q[6];
rz(0.3927) q[6];
cx q[5], q[6];

cx q[6], q[4];
rz(0.2618) q[4];
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