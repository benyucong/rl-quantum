OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initial Hadamard gates
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

// Layer 2: Mixer unitaries with optimal parameters
rz(0.3142) q[0];
rz(0.6283) q[1];
rz(0.9425) q[2];
rz(1.2566) q[3];
rz(1.5708) q[4];
rz(1.8850) q[5];
rz(2.1991) q[6];
rz(2.5133) q[7];
rz(2.8274) q[8];
rz(3.1416) q[9];

// Layer 3: Problem-specific entangling gates with capacity-weighted angles
// Edges from source (0) to neighbors
cx q[0], q[1];
rz(0.7854) q[1];  // capacity 5
cx q[0], q[1];
cx q[0], q[2];
rz(0.6283) q[2];  // capacity 4
cx q[0], q[2];
cx q[0], q[3];
rz(0.1571) q[3];  // capacity 1
cx q[0], q[3];
cx q[0], q[4];
rz(0.1571) q[4];  // capacity 1
cx q[0], q[4];
cx q[0], q[8];
rz(0.6283) q[8];  // capacity 4
cx q[0], q[8];

// Other significant edges
cx q[1], q[2];
rz(0.7854) q[2];  // capacity 5
cx q[1], q[2];
cx q[2], q[9];
rz(0.3142) q[9];  // capacity 2
cx q[2], q[9];
cx q[6], q[9];
rz(0.6283) q[9];  // capacity 4
cx q[6], q[9];
cx q[7], q[9];
rz(0.4712) q[9];  // capacity 3
cx q[7], q[9];

// Layer 4: Final mixer and optimization
rz(0.3927) q[0];
rz(0.7854) q[1];
rz(1.1781) q[2];
rz(1.5708) q[3];
rz(1.9635) q[4];
rz(2.3562) q[5];
rz(2.7489) q[6];
rz(3.1416) q[7];
rz(3.5343) q[8];
rz(3.9270) q[9];

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