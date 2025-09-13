OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard on all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Problem-specific phase rotations based on edge weights
rz(0.6283) q[0];  // Weight 4
rz(2.1991) q[1];  // Weight 7
rz(1.8849) q[2];  // Weight 6
rz(2.1991) q[3];  // Weight 7
rz(2.1991) q[4];  // Weight 7
rz(2.1991) q[5];  // Weight 7
rz(2.1991) q[6];  // Weight 7
rz(2.1991) q[7];  // Weight 7

// Layer 1: Mixer operations (partial mixing between bipartite sets)
cx q[0], q[3];
rz(-0.7854) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(-0.7854) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-0.7854) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(-0.7854) q[6];
cx q[0], q[6];
cx q[0], q[7];
rz(-0.7854) q[7];
cx q[0], q[7];
cx q[1], q[4];
rz(-0.7854) q[4];
cx q[1], q[4];
cx q[1], q[7];
rz(-0.7854) q[7];
cx q[1], q[7];
cx q[2], q[5];
rz(-0.7854) q[5];
cx q[2], q[5];

// Layer 2: Additional phase rotations
rz(1.2566) q[0];
rz(0.6283) q[1];
rz(0.9425) q[2];
rz(0.6283) q[3];
rz(0.6283) q[4];
rz(0.6283) q[5];
rz(0.6283) q[6];
rz(0.6283) q[7];

// Layer 2: Final mixer operations
cx q[0], q[3];
rz(-0.3927) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(-0.3927) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-0.3927) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(-0.3927) q[6];
cx q[0], q[6];
cx q[0], q[7];
rz(-0.3927) q[7];
cx q[0], q[7];
cx q[1], q[4];
rz(-0.3927) q[4];
cx q[1], q[4];
cx q[1], q[7];
rz(-0.3927) q[7];
cx q[1], q[7];
cx q[2], q[5];
rz(-0.3927) q[5];
cx q[2], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];