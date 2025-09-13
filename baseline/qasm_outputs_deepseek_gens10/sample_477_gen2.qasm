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

// Apply RZZ gates for edge constraints with optimal parameters
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-1.5708) q[1];
cx q[0], q[1];

rz(0.9425) q[0];
rz(0.9425) q[7];
cx q[0], q[7];
rz(-1.8850) q[7];
cx q[0], q[7];

rz(0.7854) q[2];
rz(0.7854) q[3];
cx q[2], q[3];
rz(-1.5708) q[3];
cx q[2], q[3];

rz(0.8481) q[2];
rz(0.8481) q[6];
cx q[2], q[6];
rz(-1.6962) q[6];
cx q[2], q[6];

rz(0.8481) q[2];
rz(0.8481) q[4];
cx q[2], q[4];
rz(-1.6962) q[4];
cx q[2], q[4];

rz(0.1571) q[4];
rz(0.1571) q[5];
cx q[4], q[5];
rz(-0.3142) q[5];
cx q[4], q[5];

rz(1.0996) q[5];
rz(1.0996) q[7];
cx q[5], q[7];
rz(-2.1992) q[7];
cx q[5], q[7];

rz(0.5498) q[6];
rz(0.5498) q[7];
cx q[6], q[7];
rz(-1.0996) q[7];
cx q[6], q[7];

rz(1.1781) q[6];
rz(1.1781) q[8];
cx q[6], q[8];
rz(-2.3562) q[8];
cx q[6], q[8];

// Layer 2: Mixing and optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Second layer of RZZ gates with optimized parameters
rz(0.3927) q[0];
rz(0.3927) q[1];
cx q[0], q[1];
rz(-0.7854) q[1];
cx q[0], q[1];

rz(0.4712) q[0];
rz(0.4712) q[7];
cx q[0], q[7];
rz(-0.9425) q[7];
cx q[0], q[7];

rz(0.3927) q[2];
rz(0.3927) q[3];
cx q[2], q[3];
rz(-0.7854) q[3];
cx q[2], q[3];

rz(0.4241) q[2];
rz(0.4241) q[6];
cx q[2], q[6];
rz(-0.8481) q[6];
cx q[2], q[6];

rz(0.4241) q[2];
rz(0.4241) q[4];
cx q[2], q[4];
rz(-0.8481) q[4];
cx q[2], q[4];

rz(0.0785) q[4];
rz(0.0785) q[5];
cx q[4], q[5];
rz(-0.1571) q[5];
cx q[4], q[5];

rz(0.5498) q[5];
rz(0.5498) q[7];
cx q[5], q[7];
rz(-1.0996) q[7];
cx q[5], q[7];

rz(0.2749) q[6];
rz(0.2749) q[7];
cx q[6], q[7];
rz(-0.5498) q[7];
cx q[6], q[7];

rz(0.5890) q[6];
rz(0.5890) q[8];
cx q[6], q[8];
rz(-1.1781) q[8];
cx q[6], q[8];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];