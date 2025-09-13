OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem unitary with optimal parameters
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.2251) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.2318) q[6];
cx q[0], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.1876) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.2034) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.2092) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1763) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1921) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1979) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.1837) q[6];
cx q[5], q[6];

// Layer 1 - Mixer unitary
rx(1.4231) q[0];
rx(1.3872) q[1];
rx(1.4015) q[2];
rx(1.3958) q[3];
rx(1.4093) q[4];
rx(1.4176) q[5];
rx(1.4119) q[6];

// Layer 2 - Problem unitary with optimal parameters
// Edge (0,1)
cx q[0], q[1];
rz(0.1082) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.0994) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.1126) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1159) q[6];
cx q[0], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.0938) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1017) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1046) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.0882) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.0961) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.0990) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.0919) q[6];
cx q[5], q[6];

// Layer 2 - Mixer unitary
rx(0.7116) q[0];
rx(0.6936) q[1];
rx(0.7008) q[2];
rx(0.6979) q[3];
rx(0.7047) q[4];
rx(0.7088) q[5];
rx(0.7060) q[6];

// Layer 3 - Problem unitary with optimal parameters
// Edge (0,1)
cx q[0], q[1];
rz(0.0541) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.0497) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.0563) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.0580) q[6];
cx q[0], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.0469) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.0509) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.0523) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.0441) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.0481) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.0495) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.0460) q[6];
cx q[5], q[6];

// Layer 3 - Mixer unitary
rx(0.3558) q[0];
rx(0.3468) q[1];
rx(0.3504) q[2];
rx(0.3490) q[3];
rx(0.3524) q[4];
rx(0.3544) q[5];
rx(0.3530) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];