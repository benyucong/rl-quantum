OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard and problem encoding
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

// Edge interactions based on capacities
rz(0.7854) q[4];  // capacity 1: 0→4
rz(3.1416) q[5];  // capacity 4: 0→5
rz(0.7854) q[8];  // capacity 1: 0→8
rz(1.5708) q[9];  // capacity 2: 0→9
rz(1.5708) q[10]; // capacity 2: 0→10
rz(3.1416) q[7];  // capacity 4: 1→7
rz(1.5708) q[8];  // capacity 2: 1→8
rz(0.7854) q[9];  // capacity 1: 1→9
rz(3.1416) q[1];  // capacity 4: 2→1
rz(3.1416) q[4];  // capacity 4: 2→4
rz(2.3562) q[6];  // capacity 3: 2→6
rz(1.5708) q[7];  // capacity 2: 2→7
rz(2.3562) q[8];  // capacity 3: 2→8
rz(1.5708) q[1];  // capacity 2: 3→1
rz(2.3562) q[5];  // capacity 3: 3→5
rz(3.1416) q[6];  // capacity 4: 3→6
rz(3.1416) q[7];  // capacity 4: 3→7
rz(0.7854) q[8];  // capacity 1: 3→8
rz(1.5708) q[9];  // capacity 2: 3→9
rz(2.3562) q[10]; // capacity 3: 3→10
rz(0.7854) q[1];  // capacity 1: 4→1
rz(3.1416) q[5];  // capacity 4: 4→5
rz(2.3562) q[7];  // capacity 3: 4→7
rz(1.5708) q[4];  // capacity 2: 5→4
rz(0.7854) q[6];  // capacity 1: 5→6
rz(0.7854) q[7];  // capacity 1: 5→7
rz(3.1416) q[9];  // capacity 4: 5→9
rz(0.7854) q[10]; // capacity 1: 5→10
rz(3.1416) q[1];  // capacity 4: 6→1
rz(2.3562) q[2];  // capacity 3: 6→2
rz(0.7854) q[4];  // capacity 1: 6→4
rz(0.7854) q[5];  // capacity 1: 6→5
rz(2.3562) q[7];  // capacity 3: 6→7
rz(3.1416) q[8];  // capacity 4: 6→8
rz(2.3562) q[9];  // capacity 3: 6→9
rz(1.5708) q[9];  // capacity 2: 7→9
rz(0.7854) q[4];  // capacity 1: 8→4
rz(1.5708) q[1];  // capacity 2: 9→1
rz(1.5708) q[2];  // capacity 2: 9→2
rz(1.5708) q[4];  // capacity 2: 9→4
rz(2.3562) q[6];  // capacity 3: 9→6
rz(2.3562) q[8];  // capacity 3: 9→8

// Layer 2: Mixing and optimization
rx(1.0472) q[0];
rx(0.7854) q[1];
rx(1.2566) q[2];
rx(0.6283) q[3];
rx(1.0472) q[4];
rx(0.7854) q[5];
rx(1.2566) q[6];
rx(0.6283) q[7];
rx(1.0472) q[8];
rx(0.7854) q[9];
rx(1.2566) q[10];

// Layer 3: Additional optimization
rz(0.3927) q[0];
rz(0.5236) q[1];
rz(0.6545) q[2];
rz(0.7854) q[3];
rz(0.9163) q[4];
rz(1.0472) q[5];
rz(1.1781) q[6];
rz(1.3090) q[7];
rz(1.4399) q[8];
rz(1.5708) q[9];
rz(1.7017) q[10];

// Layer 4: Final optimization and measurement preparation
rx(0.5236) q[0];
rx(0.6545) q[1];
rx(0.7854) q[2];
rx(0.9163) q[3];
rx(1.0472) q[4];
rx(1.1781) q[5];
rx(1.3090) q[6];
rx(1.4399) q[7];
rx(1.5708) q[8];
rx(1.7017) q[9];
rx(1.8326) q[10];

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