OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1 - Problem unitary with optimal parameters
// Edge (0,1) weight 5
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge (0,2) weight 14
cx q[0], q[2];
rz(1.0996) q[2];
cx q[0], q[2];

// Edge (0,6) weight 19
cx q[0], q[6];
rz(1.4923) q[6];
cx q[0], q[6];

// Edge (1,4) weight 14
cx q[1], q[4];
rz(1.0996) q[4];
cx q[1], q[4];

// Edge (2,3) weight 4
cx q[2], q[3];
rz(0.3142) q[3];
cx q[2], q[3];

// Edge (3,6) weight 20
cx q[3], q[6];
rz(1.5708) q[6];
cx q[3], q[6];

// Edge (3,4) weight 12
cx q[3], q[4];
rz(0.9425) q[4];
cx q[3], q[4];

// Edge (4,5) weight 9
cx q[4], q[5];
rz(0.7069) q[5];
cx q[4], q[5];

// Layer 1 - Mixer unitary
rx(1.2566) q[0];
rx(1.2566) q[1];
rx(1.2566) q[2];
rx(1.2566) q[3];
rx(1.2566) q[4];
rx(1.2566) q[5];
rx(1.2566) q[6];
rx(1.2566) q[7];

// Layer 2 - Problem unitary with optimal parameters
// Edge (0,1) weight 5
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge (0,2) weight 14
cx q[0], q[2];
rz(2.1991) q[2];
cx q[0], q[2];

// Edge (0,6) weight 19
cx q[0], q[6];
rz(2.9845) q[6];
cx q[0], q[6];

// Edge (1,4) weight 14
cx q[1], q[4];
rz(2.1991) q[4];
cx q[1], q[4];

// Edge (2,3) weight 4
cx q[2], q[3];
rz(0.6283) q[3];
cx q[2], q[3];

// Edge (3,6) weight 20
cx q[3], q[6];
rz(3.1416) q[6];
cx q[3], q[6];

// Edge (3,4) weight 12
cx q[3], q[4];
rz(1.8850) q[4];
cx q[3], q[4];

// Edge (4,5) weight 9
cx q[4], q[5];
rz(1.4137) q[5];
cx q[4], q[5];

// Layer 2 - Mixer unitary
rx(2.5133) q[0];
rx(2.5133) q[1];
rx(2.5133) q[2];
rx(2.5133) q[3];
rx(2.5133) q[4];
rx(2.5133) q[5];
rx(2.5133) q[6];
rx(2.5133) q[7];

// Layer 3 - Problem unitary with optimal parameters
// Edge (0,1) weight 5
cx q[0], q[1];
rz(1.1781) q[1];
cx q[0], q[1];

// Edge (0,2) weight 14
cx q[0], q[2];
rz(3.2987) q[2];
cx q[0], q[2];

// Edge (0,6) weight 19
cx q[0], q[6];
rz(4.4768) q[6];
cx q[0], q[6];

// Edge (1,4) weight 14
cx q[1], q[4];
rz(3.2987) q[4];
cx q[1], q[4];

// Edge (2,3) weight 4
cx q[2], q[3];
rz(0.9425) q[3];
cx q[2], q[3];

// Edge (3,6) weight 20
cx q[3], q[6];
rz(4.7124) q[6];
cx q[3], q[6];

// Edge (3,4) weight 12
cx q[3], q[4];
rz(2.8274) q[4];
cx q[3], q[4];

// Edge (4,5) weight 9
cx q[4], q[5];
rz(2.1206) q[5];
cx q[4], q[5];

// Layer 3 - Mixer unitary
rx(3.7699) q[0];
rx(3.7699) q[1];
rx(3.7699) q[2];
rx(3.7699) q[3];
rx(3.7699) q[4];
rx(3.7699) q[5];
rx(3.7699) q[6];
rx(3.7699) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];