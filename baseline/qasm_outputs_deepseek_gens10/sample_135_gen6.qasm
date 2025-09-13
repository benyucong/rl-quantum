OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Initialization and flow encoding
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

// Capacity constraints and flow conservation
// Edge 0->1 (capacity 1)
rz(0.2145) q[0];
rz(0.2145) q[1];
cx q[0], q[1];
rz(-0.2145) q[1];
cx q[0], q[1];

// Edge 0->6 (capacity 2)
rz(0.3218) q[0];
rz(0.3218) q[6];
cx q[0], q[6];
rz(-0.3218) q[6];
cx q[0], q[6];

// Edge 1->4 (capacity 1)
rz(0.1987) q[1];
rz(0.1987) q[4];
cx q[1], q[4];
rz(-0.1987) q[4];
cx q[1], q[4];

// Edge 1->6 (capacity 2)
rz(0.3056) q[1];
rz(0.3056) q[6];
cx q[1], q[6];
rz(-0.3056) q[6];
cx q[1], q[6];

// Edge 2->4 (capacity 1)
rz(0.1872) q[2];
rz(0.1872) q[4];
cx q[2], q[4];
rz(-0.1872) q[4];
cx q[2], q[4];

// Edge 3->2 (capacity 2)
rz(0.2893) q[3];
rz(0.2893) q[2];
cx q[3], q[2];
rz(-0.2893) q[2];
cx q[3], q[2];

// Edge 3->5 (capacity 3)
rz(0.4127) q[3];
rz(0.4127) q[5];
cx q[3], q[5];
rz(-0.4127) q[5];
cx q[3], q[5];

// Edge 3->6 (capacity 1)
rz(0.2034) q[3];
rz(0.2034) q[6];
cx q[3], q[6];
rz(-0.2034) q[6];
cx q[3], q[6];

// Edge 4->2 (capacity 1)
rz(0.1765) q[4];
rz(0.1765) q[2];
cx q[4], q[2];
rz(-0.1765) q[2];
cx q[4], q[2];

// Layer 2: Flow conservation enforcement
// Source node 0 conservation
rz(0.5363) q[0];
rz(0.5363) q[7];
cx q[0], q[7];
rz(-0.5363) q[7];
cx q[0], q[7];

// Sink node 6 conservation
rz(0.8310) q[6];
rz(0.8310) q[8];
cx q[6], q[8];
rz(-0.8310) q[8];
cx q[6], q[8];

// Intermediate nodes conservation
// Node 1 conservation
rz(0.5203) q[1];
rz(0.5203) q[9];
cx q[1], q[9];
rz(-0.5203) q[9];
cx q[1], q[9];

// Node 2 conservation
rz(0.6528) q[2];
rz(0.6528) q[10];
cx q[2], q[10];
rz(-0.6528) q[10];
cx q[2], q[10];

// Node 3 conservation
rz(0.9054) q[3];
rz(0.9054) q[11];
cx q[3], q[11];
rz(-0.9054) q[11];
cx q[3], q[11];

// Node 4 conservation
rz(0.5621) q[4];
rz(0.5621) q[12];
cx q[4], q[12];
rz(-0.5621) q[12];
cx q[4], q[12];

// Layer 3: Final optimization and measurement
// Final parameter optimization
rz(0.1247) q[0];
rz(0.2319) q[1];
rz(0.1983) q[2];
rz(0.3426) q[3];
rz(0.1762) q[4];
rz(0.2894) q[5];
rz(0.4158) q[6];
rz(0.3210) q[7];
rz(0.4982) q[8];
rz(0.2674) q[9];
rz(0.3891) q[10];
rz(0.4527) q[11];
rz(0.3015) q[12];

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