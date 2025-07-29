OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Initialize left nodes (0-8)
for i in [0:8] {
    h q[i];
}

// Initialize right nodes (9-13)
for i in [9:13] {
    x q[i];
    h q[i];
}

// Apply weighted edges with optimal parameters
// Edge 0-9 (weight 2)
cx q[0], q[9];
rz(0.3927) q[9];
cx q[0], q[9];

// Edge 1-10 (weight 5)
cx q[1], q[10];
rz(0.9817) q[10];
cx q[1], q[10];

// Edge 1-13 (weight 15)
cx q[1], q[13];
rz(2.9452) q[13];
cx q[1], q[13];

// Edge 2-11 (weight 8)
cx q[2], q[11];
rz(1.5708) q[11];
cx q[2], q[11];

// Edge 3-12 (weight 6)
cx q[3], q[12];
rz(1.1781) q[12];
cx q[3], q[12];

// Edge 4-13 (weight 7)
cx q[4], q[13];
rz(1.3744) q[13];
cx q[4], q[13];

// Edge 4-9 (weight 16)
cx q[4], q[9];
rz(3.1416) q[9];
cx q[4], q[9];

// Edge 7-9 (weight 12)
cx q[7], q[9];
rz(2.3562) q[9];
cx q[7], q[9];

// Edge 7-13 (weight 16)
cx q[7], q[13];
rz(3.1416) q[13];
cx q[7], q[13];

// Edge 8-12 (weight 14)
cx q[8], q[12];
rz(2.7489) q[12];
cx q[8], q[12];

// Measurement
for i in [0:13] {
    c[i] = measure q[i];
}