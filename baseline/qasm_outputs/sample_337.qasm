OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Initialize left nodes
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Initialize right nodes
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];

// Apply controlled-phase gates for edges with optimal parameters
// Edge 0-7 (weight 7)
cp(1.4286) q[0], q[7];
// Edge 1-8 (weight 8)
cp(1.25) q[1], q[8];
// Edge 2-9 (weight 6)
cp(1.6667) q[2], q[9];
// Edge 2-8 (weight 15)
cp(0.6667) q[2], q[8];
// Edge 2-12 (weight 17)
cp(0.5882) q[2], q[12];
// Edge 2-13 (weight 14)
cp(0.7143) q[2], q[13];
// Edge 3-10 (weight 5)
cp(2.0) q[3], q[10];
// Edge 3-13 (weight 20)
cp(0.5) q[3], q[13];
// Edge 4-11 (weight 5)
cp(2.0) q[4], q[11];
// Edge 5-12 (weight 1)
cp(10.0) q[5], q[12];
// Edge 6-13 (weight 3)
cp(3.3333) q[6], q[13];
// Edge 6-8 (weight 17)
cp(0.5882) q[6], q[8];

// Measure all qubits
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