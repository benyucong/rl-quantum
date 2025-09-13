OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Layer 1: Initialization and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];

// Capacity constraints and flow conservation
// Edge 0-1 (capacity 1)
rz(0.2145) q[0];
rz(0.2145) q[1];
cx q[0], q[1];
rz(-0.2145) q[1];
cx q[0], q[1];

// Edge 0-2 (capacity 1)
rz(0.1987) q[0];
rz(0.1987) q[2];
cx q[0], q[2];
rz(-0.1987) q[2];
cx q[0], q[2];

// Edge 0-4 (capacity 2)
rz(0.3124) q[0];
rz(0.3124) q[4];
cx q[0], q[4];
rz(-0.3124) q[4];
cx q[0], q[4];

// Edge 1-6 (capacity 1)
rz(0.1876) q[1];
rz(0.1876) q[6];
cx q[1], q[6];
rz(-0.1876) q[6];
cx q[1], q[6];

// Edge 2-1 (capacity 2)
rz(0.2763) q[2];
rz(0.2763) q[1];
cx q[2], q[1];
rz(-0.2763) q[1];
cx q[2], q[1];

// Edge 2-4 (capacity 1)
rz(0.2031) q[2];
rz(0.2031) q[4];
cx q[2], q[4];
rz(-0.2031) q[4];
cx q[2], q[4];

// Edge 3-5 (capacity 1)
rz(0.1924) q[3];
rz(0.1924) q[5];
cx q[3], q[5];
rz(-0.1924) q[5];
cx q[3], q[5];

// Edge 4-2 (capacity 2)
rz(0.2897) q[4];
rz(0.2897) q[2];
cx q[4], q[2];
rz(-0.2897) q[2];
cx q[4], q[2];

// Edge 4-6 (capacity 1)
rz(0.1958) q[4];
rz(0.1958) q[6];
cx q[4], q[6];
rz(-0.1958) q[6];
cx q[4], q[6];

// Edge 5-1 (capacity 1)
rz(0.1842) q[5];
rz(0.1842) q[1];
cx q[5], q[1];
rz(-0.1842) q[1];
cx q[5], q[1];

// Edge 5-3 (capacity 1)
rz(0.1769) q[5];
rz(0.1769) q[3];
cx q[5], q[3];
rz(-0.1769) q[3];
cx q[5], q[3];

// Layer 2: Mixing and optimization
h q[0];
rz(0.4231) q[0];
h q[0];
h q[1];
rz(0.3987) q[1];
h q[1];
h q[2];
rz(0.4125) q[2];
h q[2];
h q[3];
rz(0.3678) q[3];
h q[3];
h q[4];
rz(0.4356) q[4];
h q[4];
h q[5];
rz(0.3789) q[5];
h q[5];
h q[6];
rz(0.3924) q[6];
h q[6];
h q[7];
rz(0.3542) q[7];
h q[7];
h q[8];
rz(0.3417) q[8];
h q[8];
h q[9];
rz(0.3286) q[9];
h q[9];
h q[10];
rz(0.3158) q[10];
h q[10];
h q[11];
rz(0.3024) q[11];
h q[11];
h q[12];
rz(0.2891) q[12];
h q[12];
h q[13];
rz(0.2759) q[13];
h q[13];

// Layer 3: Final optimization and measurement
h q[0];
rz(0.5127) q[0];
h q[0];
h q[1];
rz(0.4876) q[1];
h q[1];
h q[2];
rz(0.5034) q[2];
h q[2];
h q[3];
rz(0.4528) q[3];
h q[3];
h q[4];
rz(0.5289) q[4];
h q[4];
h q[5];
rz(0.4673) q[5];
h q[5];
h q[6];
rz(0.4821) q[6];
h q[6];
h q[7];
rz(0.4367) q[7];
h q[7];
h q[8];
rz(0.4215) q[8];
h q[8];
h q[9];
rz(0.4062) q[9];
h q[9];
h q[10];
rz(0.3918) q[10];
h q[10];
h q[11];
rz(0.3764) q[11];
h q[11];
h q[12];
rz(0.3619) q[12];
h q[12];
h q[13];
rz(0.3472) q[13];
h q[13];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];
c[13] = measure q[13];