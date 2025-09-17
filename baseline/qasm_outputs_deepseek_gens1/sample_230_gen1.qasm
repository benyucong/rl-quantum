OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply weighted edges with optimal parameters
// Edge 0-3 (weight 4)
rz(0.6283) q[0];
rz(0.6283) q[3];
cx q[0], q[3];
rz(-0.1571) q[3];
cx q[0], q[3];

// Edge 0-4 (weight 19)
rz(2.9845) q[0];
rz(2.9845) q[4];
cx q[0], q[4];
rz(-0.7461) q[4];
cx q[0], q[4];

// Edge 0-6 (weight 20)
rz(3.1416) q[0];
rz(3.1416) q[6];
cx q[0], q[6];
rz(-0.7854) q[6];
cx q[0], q[6];

// Edge 0-7 (weight 14)
rz(2.1991) q[0];
rz(2.1991) q[7];
cx q[0], q[7];
rz(-0.5498) q[7];
cx q[0], q[7];

// Edge 1-4 (weight 2)
rz(0.3142) q[1];
rz(0.3142) q[4];
cx q[1], q[4];
rz(-0.0785) q[4];
cx q[1], q[4];

// Edge 1-3 (weight 11)
rz(1.7279) q[1];
rz(1.7279) q[3];
cx q[1], q[3];
rz(-0.4320) q[3];
cx q[1], q[3];

// Edge 1-6 (weight 13)
rz(2.0420) q[1];
rz(2.0420) q[6];
cx q[1], q[6];
rz(-0.5105) q[6];
cx q[1], q[6];

// Edge 2-5 (weight 3)
rz(0.4712) q[2];
rz(0.4712) q[5];
cx q[2], q[5];
rz(-0.1178) q[5];
cx q[2], q[5];

// Layer 2: Mixing and optimization
h q[0];
rz(1.2566) q[0];
h q[0];
h q[1];
rz(1.2566) q[1];
h q[1];
h q[2];
rz(1.2566) q[2];
h q[2];
h q[3];
rz(1.2566) q[3];
h q[3];
h q[4];
rz(1.2566) q[4];
h q[4];
h q[5];
rz(1.2566) q[5];
h q[5];
h q[6];
rz(1.2566) q[6];
h q[6];
h q[7];
rz(1.2566) q[7];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];