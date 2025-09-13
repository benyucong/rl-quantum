OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// First QAOA layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];

// First QAOA layer - Problem Hamiltonian
// Edge (0,1) weight 4
cx q[0], q[8];
rz(0.6283) q[8];
cx q[0], q[8];
cx q[1], q[8];
rz(0.6283) q[8];
cx q[1], q[8];

// Edge (0,7) weight 11
cx q[0], q[8];
rz(1.7279) q[8];
cx q[0], q[8];
cx q[7], q[8];
rz(1.7279) q[8];
cx q[7], q[8];

// Edge (1,4) weight 20
cx q[1], q[8];
rz(3.1416) q[8];
cx q[1], q[8];
cx q[4], q[8];
rz(3.1416) q[8];
cx q[4], q[8];

// Edge (1,7) weight 15
cx q[1], q[8];
rz(2.3562) q[8];
cx q[1], q[8];
cx q[7], q[8];
rz(2.3562) q[8];
cx q[7], q[8];

// Edge (2,3) weight 9
cx q[2], q[8];
rz(1.4137) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(1.4137) q[8];
cx q[3], q[8];

// Edge (2,4) weight 15
cx q[2], q[8];
rz(2.3562) q[8];
cx q[2], q[8];
cx q[4], q[8];
rz(2.3562) q[8];
cx q[4], q[8];

// Edge (3,5) weight 13
cx q[3], q[8];
rz(2.0420) q[8];
cx q[3], q[8];
cx q[5], q[8];
rz(2.0420) q[8];
cx q[5], q[8];

// Edge (4,5) weight 10
cx q[4], q[8];
rz(1.5708) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(1.5708) q[8];
cx q[5], q[8];

// Edge (6,7) weight 7
cx q[6], q[8];
rz(1.0996) q[8];
cx q[6], q[8];
cx q[7], q[8];
rz(1.0996) q[8];
cx q[7], q[8];

// Second QAOA layer - Mixer Hamiltonian
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(1.1781) q[3];
rz(1.1781) q[4];
rz(1.1781) q[5];
rz(1.1781) q[6];
rz(1.1781) q[7];
rz(1.1781) q[8];

// Second QAOA layer - Problem Hamiltonian
// Edge (0,1) weight 4
cx q[0], q[8];
rz(0.9425) q[8];
cx q[0], q[8];
cx q[1], q[8];
rz(0.9425) q[8];
cx q[1], q[8];

// Edge (0,7) weight 11
cx q[0], q[8];
rz(2.5918) q[8];
cx q[0], q[8];
cx q[7], q[8];
rz(2.5918) q[8];
cx q[7], q[8];

// Edge (1,4) weight 20
cx q[1], q[8];
rz(4.7124) q[8];
cx q[1], q[8];
cx q[4], q[8];
rz(4.7124) q[8];
cx q[4], q[8];

// Edge (1,7) weight 15
cx q[1], q[8];
rz(3.5343) q[8];
cx q[1], q[8];
cx q[7], q[8];
rz(3.5343) q[8];
cx q[7], q[8];

// Edge (2,3) weight 9
cx q[2], q[8];
rz(2.1206) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(2.1206) q[8];
cx q[3], q[8];

// Edge (2,4) weight 15
cx q[2], q[8];
rz(3.5343) q[8];
cx q[2], q[8];
cx q[4], q[8];
rz(3.5343) q[8];
cx q[4], q[8];

// Edge (3,5) weight 13
cx q[3], q[8];
rz(3.0630) q[8];
cx q[3], q[8];
cx q[5], q[8];
rz(3.0630) q[8];
cx q[5], q[8];

// Edge (4,5) weight 10
cx q[4], q[8];
rz(2.3562) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(2.3562) q[8];
cx q[5], q[8];

// Edge (6,7) weight 7
cx q[6], q[8];
rz(1.6494) q[8];
cx q[6], q[8];
cx q[7], q[8];
rz(1.6494) q[8];
cx q[7], q[8];

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