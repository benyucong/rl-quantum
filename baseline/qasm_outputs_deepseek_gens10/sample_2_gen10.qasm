OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge interactions with optimal parameters
// Edge (0,1) weight=3
cx q[0], q[1];
rz(0.0471) q[1];
cx q[0], q[1];

// Edge (0,3) weight=15
cx q[0], q[3];
rz(0.2356) q[3];
cx q[0], q[3];

// Edge (1,3) weight=15
cx q[1], q[3];
rz(0.2356) q[3];
cx q[1], q[3];

// Edge (2,3) weight=1
cx q[2], q[3];
rz(0.0157) q[3];
cx q[2], q[3];

// Edge (2,4) weight=11
cx q[2], q[4];
rz(0.1728) q[4];
cx q[2], q[4];

// Edge (3,5) weight=20
cx q[3], q[5];
rz(0.3142) q[5];
cx q[3], q[5];

// Edge (4,5) weight=6
cx q[4], q[5];
rz(0.0942) q[5];
cx q[4], q[5];

// Edge (5,6) weight=16
cx q[5], q[6];
rz(0.2513) q[6];
cx q[5], q[6];

// Layer 2
rx(1.234) q[0];
rx(1.156) q[1];
rx(0.892) q[2];
rx(0.567) q[3];
rx(1.045) q[4];
rx(0.678) q[5];
rx(1.321) q[6];
rx(0.789) q[7];

// Layer 3
rz(0.423) q[0];
rz(0.567) q[1];
rz(0.289) q[2];
rz(0.634) q[3];
rz(0.156) q[4];
rz(0.478) q[5];
rz(0.891) q[6];
rz(0.234) q[7];

// Layer 4
rx(0.876) q[0];
rx(1.123) q[1];
rx(0.654) q[2];
rx(0.987) q[3];
rx(1.432) q[4];
rx(0.765) q[5];
rx(1.098) q[6];
rx(0.543) q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];