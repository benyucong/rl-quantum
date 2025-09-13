OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Problem-specific phase separation
// Edge (0,1) with weight 3
cx q[0], q[7];
rz(0.0942) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.0942) q[7];
cx q[1], q[7];

// Edge (0,5) with weight 14
cx q[0], q[7];
rz(0.4398) q[7];
cx q[0], q[7];
cx q[5], q[7];
rz(0.4398) q[7];
cx q[5], q[7];

// Edge (1,4) with weight 15
cx q[1], q[7];
rz(0.4712) q[7];
cx q[1], q[7];
cx q[4], q[7];
rz(0.4712) q[7];
cx q[4], q[7];

// Edge (1,3) with weight 11
cx q[1], q[7];
rz(0.3456) q[7];
cx q[1], q[7];
cx q[3], q[7];
rz(0.3456) q[7];
cx q[3], q[7];

// Edge (2,3) with weight 10
cx q[2], q[7];
rz(0.3142) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.3142) q[7];
cx q[3], q[7];

// Edge (4,5) with weight 6
cx q[4], q[7];
rz(0.1885) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.1885) q[7];
cx q[5], q[7];

// Edge (4,6) with weight 20
cx q[4], q[7];
rz(0.6283) q[7];
cx q[4], q[7];
cx q[6], q[7];
rz(0.6283) q[7];
cx q[6], q[7];

// Edge (5,6) with weight 16
cx q[5], q[7];
rz(0.5027) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(0.5027) q[7];
cx q[6], q[7];

// Layer 3: Mixing layer
rx(1.2566) q[0];
rx(1.2566) q[1];
rx(1.2566) q[2];
rx(1.2566) q[3];
rx(1.2566) q[4];
rx(1.2566) q[5];
rx(1.2566) q[6];
rx(1.2566) q[7];

// Layer 4: Final phase separation
// Edge (0,1) with weight 3
cx q[0], q[7];
rz(0.1885) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.1885) q[7];
cx q[1], q[7];

// Edge (0,5) with weight 14
cx q[0], q[7];
rz(0.8796) q[7];
cx q[0], q[7];
cx q[5], q[7];
rz(0.8796) q[7];
cx q[5], q[7];

// Edge (1,4) with weight 15
cx q[1], q[7];
rz(0.9425) q[7];
cx q[1], q[7];
cx q[4], q[7];
rz(0.9425) q[7];
cx q[4], q[7];

// Edge (1,3) with weight 11
cx q[1], q[7];
rz(0.6912) q[7];
cx q[1], q[7];
cx q[3], q[7];
rz(0.6912) q[7];
cx q[3], q[7];

// Edge (2,3) with weight 10
cx q[2], q[7];
rz(0.6283) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.6283) q[7];
cx q[3], q[7];

// Edge (4,5) with weight 6
cx q[4], q[7];
rz(0.3770) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.3770) q[7];
cx q[5], q[7];

// Edge (4,6) with weight 20
cx q[4], q[7];
rz(1.2566) q[7];
cx q[4], q[7];
cx q[6], q[7];
rz(1.2566) q[7];
cx q[6], q[7];

// Edge (5,6) with weight 16
cx q[5], q[7];
rz(1.0053) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(1.0053) q[7];
cx q[6], q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];