OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;
// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Layer 1: Problem unitary for edges
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1987) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.2251) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2318) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.1863) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2039) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2192) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2276) q[5];
cx q[1], q[5];
// Edge (2,5)
cx q[2], q[5];
rz(0.1924) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.1758) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.2083) q[5];
cx q[4], q[5];
// Layer 1: Mixer unitary
h q[0];
rz(0.4321) q[0];
h q[0];
h q[1];
rz(0.4157) q[1];
h q[1];
h q[2];
rz(0.3982) q[2];
h q[2];
h q[3];
rz(0.3876) q[3];
h q[3];
h q[4];
rz(0.4219) q[4];
h q[4];
h q[5];
rz(0.4392) q[5];
h q[5];
// Layer 2: Problem unitary for edges
// Edge (0,1)
cx q[0], q[1];
rz(0.3128) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.2954) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.3287) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.3372) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.2819) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.3016) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.3214) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.3328) q[5];
cx q[1], q[5];
// Edge (2,5)
cx q[2], q[5];
rz(0.2891) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.2673) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.3157) q[5];
cx q[4], q[5];
// Layer 2: Mixer unitary
h q[0];
rz(0.6284) q[0];
h q[0];
h q[1];
rz(0.6129) q[1];
h q[1];
h q[2];
rz(0.5947) q[2];
h q[2];
h q[3];
rz(0.5832) q[3];
h q[3];
h q[4];
rz(0.6178) q[4];
h q[4];
h q[5];
rz(0.6351) q[5];
h q[5];
// Layer 3: Problem unitary for edges
// Edge (0,1)
cx q[0], q[1];
rz(0.4186) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.4012) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.4345) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.4430) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.3878) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.4075) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.4273) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.4387) q[5];
cx q[1], q[5];
// Edge (2,5)
cx q[2], q[5];
rz(0.3950) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.3732) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.4216) q[5];
cx q[4], q[5];
// Layer 3: Mixer unitary
h q[0];
rz(0.8247) q[0];
h q[0];
h q[1];
rz(0.8092) q[1];
h q[1];
h q[2];
rz(0.7910) q[2];
h q[2];
h q[3];
rz(0.7795) q[3];
h q[3];
h q[4];
rz(0.8141) q[4];
h q[4];
h q[5];
rz(0.8314) q[5];
h q[5];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];