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

// Edge interactions with optimal parameters
// Edge 0-5 (capacity 1)
cx q[0], q[5];
rz(0.1273) q[5];
cx q[0], q[5];

// Edge 0-6 (capacity 4)
cx q[0], q[6];
rz(0.5092) q[6];
cx q[0], q[6];

// Edge 1-3 (capacity 2)
cx q[1], q[3];
rz(0.2546) q[3];
cx q[1], q[3];

// Edge 2-4 (capacity 2)
cx q[2], q[4];
rz(0.2546) q[4];
cx q[2], q[4];

// Edge 3-1 (capacity 3)
cx q[3], q[1];
rz(0.3819) q[1];
cx q[3], q[1];

// Edge 3-5 (capacity 1)
cx q[3], q[5];
rz(0.1273) q[5];
cx q[3], q[5];

// Edge 4-3 (capacity 1)
cx q[4], q[3];
rz(0.1273) q[3];
cx q[4], q[3];

// Layer 2
h q[0];
rz(0.6365) q[0];
h q[0];
h q[1];
rz(0.6365) q[1];
h q[1];
h q[2];
rz(0.6365) q[2];
h q[2];
h q[3];
rz(0.6365) q[3];
h q[3];
h q[4];
rz(0.6365) q[4];
h q[4];
h q[5];
rz(0.6365) q[5];
h q[5];
h q[6];
rz(0.6365) q[6];
h q[6];

// Repeat edge interactions with optimized parameters
cx q[0], q[5];
rz(0.0955) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(0.3819) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.1910) q[3];
cx q[1], q[3];
cx q[2], q[4];
rz(0.1910) q[4];
cx q[2], q[4];
cx q[3], q[1];
rz(0.2865) q[1];
cx q[3], q[1];
cx q[3], q[5];
rz(0.0955) q[5];
cx q[3], q[5];
cx q[4], q[3];
rz(0.0955) q[3];
cx q[4], q[3];

// Layer 3
h q[0];
rz(0.4774) q[0];
h q[0];
h q[1];
rz(0.4774) q[1];
h q[1];
h q[2];
rz(0.4774) q[2];
h q[2];
h q[3];
rz(0.4774) q[3];
h q[3];
h q[4];
rz(0.4774) q[4];
h q[4];
h q[5];
rz(0.4774) q[5];
h q[5];
h q[6];
rz(0.4774) q[6];
h q[6];

// Final edge interactions
cx q[0], q[5];
rz(0.0637) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(0.2546) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.1273) q[3];
cx q[1], q[3];
cx q[2], q[4];
rz(0.1273) q[4];
cx q[2], q[4];
cx q[3], q[1];
rz(0.1910) q[1];
cx q[3], q[1];
cx q[3], q[5];
rz(0.0637) q[5];
cx q[3], q[5];
cx q[4], q[3];
rz(0.0637) q[3];
cx q[4], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];