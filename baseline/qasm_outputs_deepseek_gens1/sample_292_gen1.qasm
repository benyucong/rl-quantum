OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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

// Edge interactions with capacity-weighted angles
// Layer 1: Source connections
rz(0.7854) q[1];  // capacity 5: 0→1
rz(0.6283) q[2];  // capacity 4: 0→2
rz(0.1571) q[3];  // capacity 1: 0→3
rz(0.1571) q[4];  // capacity 1: 0→4
rz(0.6283) q[8];  // capacity 4: 0→8

// Layer 2: First-level connections
cx q[1], q[2];
rz(0.7854) q[2];  // capacity 5: 1→2
cx q[1], q[2];
cx q[1], q[5];
rz(0.4712) q[5];  // capacity 3: 1→5
cx q[1], q[5];
cx q[1], q[7];
rz(0.3142) q[7];  // capacity 2: 1→7
cx q[1], q[7];
cx q[1], q[8];
rz(0.7854) q[8];  // capacity 5: 1→8
cx q[1], q[8];

// Layer 3: Second-level connections
cx q[2], q[1];
rz(0.4712) q[1];  // capacity 3: 2→1
cx q[2], q[1];
cx q[2], q[3];
rz(0.3142) q[3];  // capacity 2: 2→3
cx q[2], q[3];
cx q[2], q[6];
rz(0.9425) q[6];  // capacity 6: 2→6
cx q[2], q[6];
cx q[2], q[8];
rz(0.6283) q[8];  // capacity 4: 2→8
cx q[2], q[8];
cx q[2], q[9];
rz(0.3142) q[9];  // capacity 2: 2→9
cx q[2], q[9];

// Layer 4: Third-level connections and sink preparation
cx q[3], q[5];
rz(0.1571) q[5];  // capacity 1: 3→5
cx q[3], q[5];
cx q[3], q[7];
rz(0.1571) q[7];  // capacity 1: 3→7
cx q[3], q[7];
cx q[4], q[2];
rz(0.6283) q[2];  // capacity 4: 4→2
cx q[4], q[2];
cx q[4], q[3];
rz(0.4712) q[3];  // capacity 3: 4→3
cx q[4], q[3];
cx q[4], q[6];
rz(0.7854) q[6];  // capacity 5: 4→6
cx q[4], q[6];
cx q[5], q[2];
rz(0.4712) q[2];  // capacity 3: 5→2
cx q[5], q[2];
cx q[5], q[4];
rz(0.1571) q[4];  // capacity 1: 5→4
cx q[5], q[4];
cx q[5], q[6];
rz(0.7854) q[6];  // capacity 5: 5→6
cx q[5], q[6];
cx q[5], q[7];
rz(0.4712) q[7];  // capacity 3: 5→7
cx q[5], q[7];
cx q[5], q[8];
rz(0.9425) q[8];  // capacity 6: 5→8
cx q[5], q[8];
cx q[6], q[3];
rz(0.4712) q[3];  // capacity 3: 6→3
cx q[6], q[3];
cx q[6], q[4];
rz(0.4712) q[4];  // capacity 3: 6→4
cx q[6], q[4];
cx q[6], q[9];
rz(0.6283) q[9];  // capacity 4: 6→9
cx q[6], q[9];
cx q[7], q[1];
rz(0.9425) q[1];  // capacity 6: 7→1
cx q[7], q[1];
cx q[7], q[2];
rz(0.4712) q[2];  // capacity 3: 7→2
cx q[7], q[2];
cx q[7], q[4];
rz(0.4712) q[4];  // capacity 3: 7→4
cx q[7], q[4];
cx q[7], q[9];
rz(0.4712) q[9];  // capacity 3: 7→9
cx q[7], q[9];
cx q[8], q[2];
rz(0.7854) q[2];  // capacity 5: 8→2
cx q[8], q[2];
cx q[8], q[5];
rz(0.6283) q[5];  // capacity 4: 8→5
cx q[8], q[5];

// Final measurement
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