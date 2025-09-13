OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem unitary for vertex cover
// Edge (0,2)
cx q[0], q[2];
rz(0.314) q[2];
cx q[0], q[2];
// Edge (1,2)
cx q[1], q[2];
rz(0.412) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.285) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.367) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.298) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.225) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.193) q[4];
cx q[2], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.176) q[6];
cx q[5], q[6];

// Layer 1: Mixer unitary
h q[0];
rz(0.842) q[0];
h q[0];
h q[1];
rz(1.127) q[1];
h q[1];
h q[2];
rz(1.356) q[2];
h q[2];
h q[3];
rz(0.973) q[3];
h q[3];
h q[4];
rz(0.715) q[4];
h q[4];
h q[5];
rz(0.891) q[5];
h q[5];
h q[6];
rz(0.768) q[6];
h q[6];

// Layer 2: Problem unitary
cx q[0], q[2];
rz(0.628) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.824) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.570) q[3];
cx q[1], q[3];
cx q[1], q[5];
rz(0.734) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(0.596) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.450) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.386) q[4];
cx q[2], q[4];
cx q[5], q[6];
rz(0.352) q[6];
cx q[5], q[6];

// Layer 2: Mixer unitary
h q[0];
rz(1.684) q[0];
h q[0];
h q[1];
rz(2.254) q[1];
h q[1];
h q[2];
rz(2.712) q[2];
h q[2];
h q[3];
rz(1.946) q[3];
h q[3];
h q[4];
rz(1.430) q[4];
h q[4];
h q[5];
rz(1.782) q[5];
h q[5];
h q[6];
rz(1.536) q[6];
h q[6];

// Layer 3: Problem unitary
cx q[0], q[2];
rz(0.942) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(1.236) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.855) q[3];
cx q[1], q[3];
cx q[1], q[5];
rz(1.101) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(0.894) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.675) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.579) q[4];
cx q[2], q[4];
cx q[5], q[6];
rz(0.528) q[6];
cx q[5], q[6];

// Layer 3: Mixer unitary
h q[0];
rz(2.526) q[0];
h q[0];
h q[1];
rz(3.381) q[1];
h q[1];
h q[2];
rz(4.068) q[2];
h q[2];
h q[3];
rz(2.919) q[3];
h q[3];
h q[4];
rz(2.145) q[4];
h q[4];
h q[5];
rz(2.673) q[5];
h q[5];
h q[6];
rz(2.304) q[6];
h q[6];

// Layer 4: Problem unitary
cx q[0], q[2];
rz(1.256) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(1.648) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(1.140) q[3];
cx q[1], q[3];
cx q[1], q[5];
rz(1.468) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(1.192) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.900) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.772) q[4];
cx q[2], q[4];
cx q[5], q[6];
rz(0.704) q[6];
cx q[5], q[6];

// Layer 4: Mixer unitary
h q[0];
rz(3.368) q[0];
h q[0];
h q[1];
rz(4.508) q[1];
h q[1];
h q[2];
rz(5.424) q[2];
h q[2];
h q[3];
rz(3.892) q[3];
h q[3];
h q[4];
rz(2.860) q[4];
h q[4];
h q[5];
rz(3.564) q[5];
h q[5];
h q[6];
rz(3.072) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];