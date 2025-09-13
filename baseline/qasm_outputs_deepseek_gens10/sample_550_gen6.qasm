OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
// Layer 1: Initial Hadamard on left nodes
h q[0];
h q[1];
h q[2];
// Layer 1: Entanglement and phase encoding based on edge weights
// Edge (0,3): weight 4
cx q[0], q[3];
rz(0.6283) q[3];
cx q[0], q[3];
// Edge (0,5): weight 14
cx q[0], q[5];
rz(2.1991) q[5];
cx q[0], q[5];
// Edge (0,6): weight 19
cx q[0], q[6];
rz(2.9845) q[6];
cx q[0], q[6];
// Edge (0,4): weight 14
cx q[0], q[4];
rz(2.1991) q[4];
cx q[0], q[4];
// Edge (0,7): weight 16
cx q[0], q[7];
rz(2.5133) q[7];
cx q[0], q[7];
// Edge (1,4): weight 7
cx q[1], q[4];
rz(1.0996) q[4];
cx q[1], q[4];
// Edge (1,7): weight 13
cx q[1], q[7];
rz(2.0420) q[7];
cx q[1], q[7];
// Edge (2,5): weight 6
cx q[2], q[5];
rz(0.9425) q[5];
cx q[2], q[5];
// Layer 1: Mixing
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
// Layer 2: Repeat with optimized parameters
// Edge (0,3): weight 4
cx q[0], q[3];
rz(0.6283) q[3];
cx q[0], q[3];
// Edge (0,5): weight 14
cx q[0], q[5];
rz(2.1991) q[5];
cx q[0], q[5];
// Edge (0,6): weight 19
cx q[0], q[6];
rz(2.9845) q[6];
cx q[0], q[6];
// Edge (0,4): weight 14
cx q[0], q[4];
rz(2.1991) q[4];
cx q[0], q[4];
// Edge (0,7): weight 16
cx q[0], q[7];
rz(2.5133) q[7];
cx q[0], q[7];
// Edge (1,4): weight 7
cx q[1], q[4];
rz(1.0996) q[4];
cx q[1], q[4];
// Edge (1,7): weight 13
cx q[1], q[7];
rz(2.0420) q[7];
cx q[1], q[7];
// Edge (2,5): weight 6
cx q[2], q[5];
rz(0.9425) q[5];
cx q[2], q[5];
// Layer 2: Final mixing
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];