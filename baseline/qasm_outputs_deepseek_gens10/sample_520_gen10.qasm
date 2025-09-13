OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Hadamard initialization
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

// Layer 1: Problem-specific phase rotations based on edge capacities
rz(0.7854) q[3];  // capacity 3: 0→3
rz(0.2618) q[4];  // capacity 1: 0→4
rz(1.0472) q[5];  // capacity 4: 0→5
rz(0.5236) q[2];  // capacity 2: 1→2
rz(0.7854) q[5];  // capacity 3: 1→5
rz(0.2618) q[6];  // capacity 1: 2→6
rz(0.2618) q[5];  // capacity 1: 3→5
rz(0.5236) q[9];  // capacity 2: 3→9
rz(1.0472) q[2];  // capacity 4: 4→2
rz(0.5236) q[3];  // capacity 2: 4→3
rz(0.2618) q[7];  // capacity 1: 4→7
rz(0.2618) q[2];  // capacity 1: 5→2
rz(1.0472) q[1];  // capacity 4: 6→1
rz(1.3090) q[2];  // capacity 5: 6→2
rz(0.2618) q[1];  // capacity 1: 7→1
rz(0.7854) q[4];  // capacity 3: 7→4
rz(1.0472) q[5];  // capacity 4: 7→5
rz(1.0472) q[4];  // capacity 4: 8→4
rz(0.5236) q[6];  // capacity 2: 8→6
rz(1.5708) q[7];  // capacity 6: 8→7

// Layer 2: Mixing layer with optimized parameters
rx(0.3927) q[0];
rx(0.3142) q[1];
rx(0.4712) q[2];
rx(0.2356) q[3];
rx(0.5498) q[4];
rx(0.6283) q[5];
rx(0.1963) q[6];
rx(0.7069) q[7];
rx(0.7854) q[8];
rx(0.1571) q[9];

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