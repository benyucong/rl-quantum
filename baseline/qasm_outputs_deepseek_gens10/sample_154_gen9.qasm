OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Problem unitary for vertex cover (layer 1)
rz(0.2145) q[0];
rz(0.3821) q[1];
rz(0.1567) q[2];
rz(0.2983) q[3];
rz(0.1742) q[4];
rz(0.3256) q[5];
rz(0.1894) q[6];

// Mixer unitary (layer 1)
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

// Layer 2
// Problem unitary for vertex cover (layer 2)
rz(0.1987) q[0];
rz(0.3542) q[1];
rz(0.1423) q[2];
rz(0.2765) q[3];
rz(0.1618) q[4];
rz(0.3021) q[5];
rz(0.1756) q[6];

// Mixer unitary (layer 2)
rx(0.6545) q[0];
rx(0.6545) q[1];
rx(0.6545) q[2];
rx(0.6545) q[3];
rx(0.6545) q[4];
rx(0.6545) q[5];
rx(0.6545) q[6];

// Layer 3
// Problem unitary for vertex cover (layer 3)
rz(0.1824) q[0];
rz(0.3268) q[1];
rz(0.1289) q[2];
rz(0.2547) q[3];
rz(0.1493) q[4];
rz(0.2786) q[5];
rz(0.1618) q[6];

// Mixer unitary (layer 3)
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Layer 4
// Problem unitary for vertex cover (layer 4)
rz(0.1661) q[0];
rz(0.2994) q[1];
rz(0.1155) q[2];
rz(0.2329) q[3];
rz(0.1368) q[4];
rz(0.2551) q[5];
rz(0.1480) q[6];

// Mixer unitary (layer 4)
rx(0.3927) q[0];
rx(0.3927) q[1];
rx(0.3927) q[2];
rx(0.3927) q[3];
rx(0.3927) q[4];
rx(0.3927) q[5];
rx(0.3927) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];