OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Edge interactions with optimal parameters
// Edge 0→2 (capacity 1)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];

// Edge 0→6 (capacity 1)
cx q[0], q[6];
rz(0.1987) q[6];
cx q[0], q[6];

// Edge 1→3 (capacity 1)
cx q[1], q[3];
rz(0.2053) q[3];
cx q[1], q[3];

// Edge 2→4 (capacity 2)
cx q[2], q[4];
rz(0.4231) q[4];
cx q[2], q[4];

// Edge 3→1 (capacity 2)
cx q[3], q[1];
rz(0.4189) q[1];
cx q[3], q[1];

// Edge 3→2 (capacity 2)
cx q[3], q[2];
rz(0.4127) q[2];
cx q[3], q[2];

// Edge 3→4 (capacity 1)
cx q[3], q[4];
rz(0.2076) q[4];
cx q[3], q[4];

// Edge 5→1 (capacity 2)
cx q[5], q[1];
rz(0.4215) q[1];
cx q[5], q[1];

// Layer 2: Mixing and optimization
h q[0];
rz(0.3852) q[0];
h q[0];
h q[1];
rz(0.3768) q[1];
h q[1];
h q[2];
rz(0.3921) q[2];
h q[2];
h q[3];
rz(0.3815) q[3];
h q[3];
h q[4];
rz(0.3794) q[4];
h q[4];
h q[5];
rz(0.3876) q[5];
h q[5];
h q[6];
rz(0.3843) q[6];
h q[6];

// Layer 3: Final optimization and measurement preparation
h q[0];
rz(0.1927) q[0];
h q[0];
h q[1];
rz(0.1884) q[1];
h q[1];
h q[2];
rz(0.1961) q[2];
h q[2];
h q[3];
rz(0.1908) q[3];
h q[3];
h q[4];
rz(0.1897) q[4];
h q[4];
h q[5];
rz(0.1938) q[5];
h q[5];
h q[6];
rz(0.1922) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];