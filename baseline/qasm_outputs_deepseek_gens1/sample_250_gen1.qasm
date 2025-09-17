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
// Edge (0,1)
cx q[0], q[1];
rz(0.314) q[1];
cx q[0], q[1];
// Edge (1,2)
cx q[1], q[2];
rz(0.271) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.289) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.302) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.257) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.295) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.283) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.268) q[6];
cx q[4], q[6];

// Layer 1: Mixer unitary
rz(0.142) q[0];
rz(0.168) q[1];
rz(0.135) q[2];
rz(0.157) q[3];
rz(0.149) q[4];
rz(0.163) q[5];
rz(0.176) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.284) q[0];
rz(0.336) q[1];
rz(0.270) q[2];
rz(0.314) q[3];
rz(0.298) q[4];
rz(0.326) q[5];
rz(0.352) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2: Problem unitary
cx q[0], q[1];
rz(0.628) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(0.542) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(0.578) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(0.604) q[6];
cx q[1], q[6];
cx q[2], q[5];
rz(0.514) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(0.590) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(0.566) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(0.536) q[6];
cx q[4], q[6];

// Layer 2: Mixer unitary
rz(0.284) q[0];
rz(0.336) q[1];
rz(0.270) q[2];
rz(0.314) q[3];
rz(0.298) q[4];
rz(0.326) q[5];
rz(0.352) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.568) q[0];
rz(0.672) q[1];
rz(0.540) q[2];
rz(0.628) q[3];
rz(0.596) q[4];
rz(0.652) q[5];
rz(0.704) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 3: Problem unitary
cx q[0], q[1];
rz(0.942) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(0.813) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(0.867) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(0.906) q[6];
cx q[1], q[6];
cx q[2], q[5];
rz(0.771) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(0.885) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(0.849) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(0.804) q[6];
cx q[4], q[6];

// Layer 3: Mixer unitary
rz(0.426) q[0];
rz(0.504) q[1];
rz(0.405) q[2];
rz(0.471) q[3];
rz(0.447) q[4];
rz(0.489) q[5];
rz(0.528) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.852) q[0];
rz(1.008) q[1];
rz(0.810) q[2];
rz(0.942) q[3];
rz(0.894) q[4];
rz(0.978) q[5];
rz(1.056) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 4: Problem unitary
cx q[0], q[1];
rz(1.256) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(1.084) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(1.156) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(1.208) q[6];
cx q[1], q[6];
cx q[2], q[5];
rz(1.028) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(1.180) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(1.132) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(1.072) q[6];
cx q[4], q[6];

// Layer 4: Mixer unitary
rz(0.568) q[0];
rz(0.672) q[1];
rz(0.540) q[2];
rz(0.628) q[3];
rz(0.596) q[4];
rz(0.652) q[5];
rz(0.704) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(1.136) q[0];
rz(1.344) q[1];
rz(1.080) q[2];
rz(1.256) q[3];
rz(1.192) q[4];
rz(1.304) q[5];
rz(1.408) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];