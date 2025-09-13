OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard and first mixing
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

// Layer 1: Problem-specific phase operations
// Edge (0,1) capacity 3
cx q[0], q[1];
rz(0.1413) q[1];
cx q[0], q[1];

// Edge (0,3) capacity 3
cx q[0], q[3];
rz(0.1413) q[3];
cx q[0], q[3];

// Edge (0,5) capacity 4
cx q[0], q[5];
rz(0.1884) q[5];
cx q[0], q[5];

// Edge (0,9) capacity 1
cx q[0], q[9];
rz(0.0471) q[9];
cx q[0], q[9];

// Edge (2,7) capacity 2
cx q[2], q[7];
rz(0.0942) q[7];
cx q[2], q[7];

// Edge (2,8) capacity 4
cx q[2], q[8];
rz(0.1884) q[8];
cx q[2], q[8];

// Edge (2,10) capacity 2
cx q[2], q[10];
rz(0.0942) q[10];
cx q[2], q[10];

// Edge (3,1) capacity 3
cx q[3], q[1];
rz(0.1413) q[1];
cx q[3], q[1];

// Edge (3,6) capacity 3
cx q[3], q[6];
rz(0.1413) q[6];
cx q[3], q[6];

// Edge (3,9) capacity 3
cx q[3], q[9];
rz(0.1413) q[9];
cx q[3], q[9];

// Edge (4,2) capacity 4
cx q[4], q[2];
rz(0.1884) q[2];
cx q[4], q[2];

// Edge (4,6) capacity 1
cx q[4], q[6];
rz(0.0471) q[6];
cx q[4], q[6];

// Edge (4,10) capacity 1
cx q[4], q[10];
rz(0.0471) q[10];
cx q[4], q[10];

// Edge (5,2) capacity 3
cx q[5], q[2];
rz(0.1413) q[2];
cx q[5], q[2];

// Edge (5,7) capacity 2
cx q[5], q[7];
rz(0.0942) q[7];
cx q[5], q[7];

// Edge (5,9) capacity 1
cx q[5], q[9];
rz(0.0471) q[9];
cx q[5], q[9];

// Edge (5,10) capacity 1
cx q[5], q[10];
rz(0.0471) q[10];
cx q[5], q[10];

// Edge (6,4) capacity 3
cx q[6], q[4];
rz(0.1413) q[4];
cx q[6], q[4];

// Edge (6,7) capacity 1
cx q[6], q[7];
rz(0.0471) q[7];
cx q[6], q[7];

// Edge (7,1) capacity 1
cx q[7], q[1];
rz(0.0471) q[1];
cx q[7], q[1];

// Edge (7,6) capacity 2
cx q[7], q[6];
rz(0.0942) q[6];
cx q[7], q[6];

// Edge (7,9) capacity 2
cx q[7], q[9];
rz(0.0942) q[9];
cx q[7], q[9];

// Edge (7,10) capacity 2
cx q[7], q[10];
rz(0.0942) q[10];
cx q[7], q[10];

// Edge (8,1) capacity 4
cx q[8], q[1];
rz(0.1884) q[1];
cx q[8], q[1];

// Edge (8,2) capacity 4
cx q[8], q[2];
rz(0.1884) q[2];
cx q[8], q[2];

// Edge (8,5) capacity 2
cx q[8], q[5];
rz(0.0942) q[5];
cx q[8], q[5];

// Edge (9,5) capacity 3
cx q[9], q[5];
rz(0.1413) q[5];
cx q[9], q[5];

// Layer 2: Mixing and second phase
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

// Repeat edge operations with optimized parameters
cx q[0], q[1];
rz(0.1272) q[1];
cx q[0], q[1];
cx q[0], q[3];
rz(0.1272) q[3];
cx q[0], q[3];
cx q[0], q[5];
rz(0.1696) q[5];
cx q[0], q[5];
cx q[0], q[9];
rz(0.0424) q[9];
cx q[0], q[9];
cx q[2], q[7];
rz(0.0848) q[7];
cx q[2], q[7];
cx q[2], q[8];
rz(0.1696) q[8];
cx q[2], q[8];
cx q[2], q[10];
rz(0.0848) q[10];
cx q[2], q[10];
cx q[3], q[1];
rz(0.1272) q[1];
cx q[3], q[1];
cx q[3], q[6];
rz(0.1272) q[6];
cx q[3], q[6];
cx q[3], q[9];
rz(0.1272) q[9];
cx q[3], q[9];
cx q[4], q[2];
rz(0.1696) q[2];
cx q[4], q[2];
cx q[4], q[6];
rz(0.0424) q[6];
cx q[4], q[6];
cx q[4], q[10];
rz(0.0424) q[10];
cx q[4], q[10];
cx q[5], q[2];
rz(0.1272) q[2];
cx q[5], q[2];
cx q[5], q[7];
rz(0.0848) q[7];
cx q[5], q[7];
cx q[5], q[9];
rz(0.0424) q[9];
cx q[5], q[9];
cx q[5], q[10];
rz(0.0424) q[10];
cx q[5], q[10];
cx q[6], q[4];
rz(0.1272) q[4];
cx q[6], q[4];
cx q[6], q[7];
rz(0.0424) q[7];
cx q[6], q[7];
cx q[7], q[1];
rz(0.0424) q[1];
cx q[7], q[1];
cx q[7], q[6];
rz(0.0848) q[6];
cx q[7], q[6];
cx q[7], q[9];
rz(0.0848) q[9];
cx q[7], q[9];
cx q[7], q[10];
rz(0.0848) q[10];
cx q[7], q[10];
cx q[8], q[1];
rz(0.1696) q[1];
cx q[8], q[1];
cx q[8], q[2];
rz(0.1696) q[2];
cx q[8], q[2];
cx q[8], q[5];
rz(0.0848) q[5];
cx q[8], q[5];
cx q[9], q[5];
rz(0.1272) q[5];
cx q[9], q[5];

// Layer 3: Final mixing and measurement
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