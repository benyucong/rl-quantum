OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Layer 1: Initial Hadamard and mixing
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
h q[14];
h q[15];

// Layer 1: Problem-specific phase encoding
// Edge 0-1 (weight 10)
cx q[0], q[1];
rz(0.314) q[1];
cx q[0], q[1];

// Edge 1-2 (weight 7)
cx q[1], q[2];
rz(0.220) q[2];
cx q[1], q[2];

// Edge 1-3 (weight 43)
cx q[1], q[3];
rz(1.351) q[3];
cx q[1], q[3];

// Edge 1-4 (weight 42)
cx q[1], q[4];
rz(1.319) q[4];
cx q[1], q[4];

// Edge 2-3 (weight 5)
cx q[2], q[3];
rz(0.157) q[3];
cx q[2], q[3];

// Edge 2-4 (weight 45)
cx q[2], q[4];
rz(1.414) q[4];
cx q[2], q[4];

// Edge 3-4 (weight 7)
cx q[3], q[4];
rz(0.220) q[4];
cx q[3], q[4];

// Edge 4-5 (weight 8)
cx q[4], q[5];
rz(0.251) q[5];
cx q[4], q[5];

// Layer 2: Mixing and constraints
// Mixing layer
rx(1.047) q[0];
rx(1.047) q[1];
rx(1.047) q[2];
rx(1.047) q[3];
rx(1.047) q[4];
rx(1.047) q[5];
rx(1.047) q[6];
rx(1.047) q[7];
rx(1.047) q[8];
rx(1.047) q[9];
rx(1.047) q[10];
rx(1.047) q[11];
rx(1.047) q[12];
rx(1.047) q[13];
rx(1.047) q[14];
rx(1.047) q[15];

// Path constraints (start at 0, end at 5)
rz(0.785) q[0];  // Start node constraint
rz(0.785) q[5];  // End node constraint

// Layer 3: Final mixing and measurement
// Final mixing
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];
rx(0.785) q[7];
rx(0.785) q[8];
rx(0.785) q[9];
rx(0.785) q[10];
rx(0.785) q[11];
rx(0.785) q[12];
rx(0.785) q[13];
rx(0.785) q[14];
rx(0.785) q[15];

// Measurement
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
c[14] = measure q[14];
c[15] = measure q[15];