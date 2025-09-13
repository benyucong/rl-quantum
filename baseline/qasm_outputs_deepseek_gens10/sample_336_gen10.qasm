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
// Edge 0-2 (capacity 2)
cx q[0], q[2];
rz(0.314) q[2];
cx q[0], q[2];

// Edge 0-3 (capacity 4)
cx q[0], q[3];
rz(0.628) q[3];
cx q[0], q[3];

// Edge 0-4 (capacity 3)
cx q[0], q[4];
rz(0.471) q[4];
cx q[0], q[4];

// Edge 0-6 (capacity 2)
cx q[0], q[6];
rz(0.314) q[6];
cx q[0], q[6];

// Edge 1-2 (capacity 3)
cx q[1], q[2];
rz(0.471) q[2];
cx q[1], q[2];

// Edge 1-4 (capacity 3)
cx q[1], q[4];
rz(0.471) q[4];
cx q[1], q[4];

// Edge 2-6 (capacity 1)
cx q[2], q[6];
rz(0.157) q[6];
cx q[2], q[6];

// Edge 3-5 (capacity 5)
cx q[3], q[5];
rz(0.785) q[5];
cx q[3], q[5];

// Layer 2: Mixing and optimization
h q[0];
rz(0.942) q[0];
h q[0];
h q[1];
rz(0.942) q[1];
h q[1];
h q[2];
rz(1.256) q[2];
h q[2];
h q[3];
rz(1.413) q[3];
h q[3];
h q[4];
rz(1.256) q[4];
h q[4];
h q[5];
rz(0.628) q[5];
h q[5];
h q[6];
rz(0.942) q[6];
h q[6];

// Layer 3: Final optimization and measurement preparation
h q[0];
rz(0.628) q[0];
h q[0];
h q[1];
rz(0.628) q[1];
h q[1];
h q[2];
rz(0.942) q[2];
h q[2];
h q[3];
rz(1.099) q[3];
h q[3];
h q[4];
rz(0.942) q[4];
h q[4];
h q[5];
rz(0.471) q[5];
h q[5];
h q[6];
rz(0.628) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];