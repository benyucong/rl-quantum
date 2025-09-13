OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
rz(0.3927) q[6];
rz(0.3927) q[7];

// Problem Hamiltonian for edge cover (Layer 1)
// Edge (0,1)
cx q[0], q[1];
rz(0.3142) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.3142) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.3142) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.3142) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.3142) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.3142) q[4];
cx q[1], q[4];
// Edge (2,4)
cx q[2], q[4];
rz(0.3142) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.3142) q[4];
cx q[3], q[4];

// Mixer Hamiltonian (Layer 1)
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];
rx(0.5236) q[7];

// Layer 2: Parameterized rotations
rx(0.6545) q[0];
rx(0.6545) q[1];
rx(0.6545) q[2];
rx(0.6545) q[3];
rx(0.6545) q[4];
rx(0.6545) q[5];
rx(0.6545) q[6];
rx(0.6545) q[7];
rz(0.3273) q[0];
rz(0.3273) q[1];
rz(0.3273) q[2];
rz(0.3273) q[3];
rz(0.3273) q[4];
rz(0.3273) q[5];
rz(0.3273) q[6];
rz(0.3273) q[7];

// Problem Hamiltonian for edge cover (Layer 2)
// Edge (0,1)
cx q[0], q[1];
rz(0.2618) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.2618) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2618) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.2618) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2618) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2618) q[4];
cx q[1], q[4];
// Edge (2,4)
cx q[2], q[4];
rz(0.2618) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.2618) q[4];
cx q[3], q[4];

// Mixer Hamiltonian (Layer 2)
rx(0.4363) q[0];
rx(0.4363) q[1];
rx(0.4363) q[2];
rx(0.4363) q[3];
rx(0.4363) q[4];
rx(0.4363) q[5];
rx(0.4363) q[6];
rx(0.4363) q[7];

// Layer 3: Parameterized rotations
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];
rx(0.5236) q[7];
rz(0.2618) q[0];
rz(0.2618) q[1];
rz(0.2618) q[2];
rz(0.2618) q[3];
rz(0.2618) q[4];
rz(0.2618) q[5];
rz(0.2618) q[6];
rz(0.2618) q[7];

// Problem Hamiltonian for edge cover (Layer 3)
// Edge (0,1)
cx q[0], q[1];
rz(0.2094) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.2094) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2094) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.2094) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2094) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2094) q[4];
cx q[1], q[4];
// Edge (2,4)
cx q[2], q[4];
rz(0.2094) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.2094) q[4];
cx q[3], q[4];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];