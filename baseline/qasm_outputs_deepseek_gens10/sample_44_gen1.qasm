OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Edge interactions with optimal parameters
// Edge (0,5): weight 4
rz(0.6283) q[0];
rz(0.6283) q[5];
cx q[0], q[5];
rz(-0.6283) q[5];
cx q[0], q[5];

// Edge (0,6): weight 16
rz(2.5133) q[0];
rz(2.5133) q[6];
cx q[0], q[6];
rz(-2.5133) q[6];
cx q[0], q[6];

// Edge (1,6): weight 7
rz(1.0996) q[1];
rz(1.0996) q[6];
cx q[1], q[6];
rz(-1.0996) q[6];
cx q[1], q[6];

// Edge (1,8): weight 13
rz(2.0420) q[1];
rz(2.0420) q[8];
cx q[1], q[8];
rz(-2.0420) q[8];
cx q[1], q[8];

// Edge (1,7): weight 11
rz(1.7279) q[1];
rz(1.7279) q[7];
cx q[1], q[7];
rz(-1.7279) q[7];
cx q[1], q[7];

// Edge (2,7): weight 4
rz(0.6283) q[2];
rz(0.6283) q[7];
cx q[2], q[7];
rz(-0.6283) q[7];
cx q[2], q[7];

// Edge (2,5): weight 17
rz(2.6704) q[2];
rz(2.6704) q[5];
cx q[2], q[5];
rz(-2.6704) q[5];
cx q[2], q[5];

// Edge (3,8): weight 7
rz(1.0996) q[3];
rz(1.0996) q[8];
cx q[3], q[8];
rz(-1.0996) q[8];
cx q[3], q[8];

// Edge (3,5): weight 18
rz(2.8274) q[3];
rz(2.8274) q[5];
cx q[3], q[5];
rz(-2.8274) q[5];
cx q[3], q[5];

// Layer 2: Mixing and optimization
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 3: Problem re-encoding with adjusted parameters
rz(0.9425) q[0];
rz(0.9425) q[5];
cx q[0], q[5];
rz(-0.9425) q[5];
cx q[0], q[5];

rz(3.7699) q[0];
rz(3.7699) q[6];
cx q[0], q[6];
rz(-3.7699) q[6];
cx q[0], q[6];

rz(1.6494) q[1];
rz(1.6494) q[6];
cx q[1], q[6];
rz(-1.6494) q[6];
cx q[1], q[6];

rz(3.0630) q[1];
rz(3.0630) q[8];
cx q[1], q[8];
rz(-3.0630) q[8];
cx q[1], q[8];

rz(2.5918) q[1];
rz(2.5918) q[7];
cx q[1], q[7];
rz(-2.5918) q[7];
cx q[1], q[7];

rz(0.9425) q[2];
rz(0.9425) q[7];
cx q[2], q[7];
rz(-0.9425) q[7];
cx q[2], q[7];

rz(4.0056) q[2];
rz(4.0056) q[5];
cx q[2], q[5];
rz(-4.0056) q[5];
cx q[2], q[5];

rz(1.6494) q[3];
rz(1.6494) q[8];
cx q[3], q[8];
rz(-1.6494) q[8];
cx q[3], q[8];

rz(4.2411) q[3];
rz(4.2411) q[5];
cx q[3], q[5];
rz(-4.2411) q[5];
cx q[3], q[5];

// Layer 4: Final optimization and measurement preparation
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(1.1781) q[3];
rz(1.1781) q[4];
rz(1.1781) q[5];
rz(1.1781) q[6];
rz(1.1781) q[7];
rz(1.1781) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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