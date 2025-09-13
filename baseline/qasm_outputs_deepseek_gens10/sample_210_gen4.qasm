OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Initialization and first mixing
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
rz(0.2145) q[0];
rz(0.1428) q[1];
rz(0.0714) q[2];
rz(0.0714) q[3];
rz(0.3214) q[4];
rz(0.2857) q[5];
rz(0.1428) q[6];
rz(0.1071) q[7];
rz(0.0714) q[8];
rz(0.0357) q[9];
rz(0.1786) q[10];
rz(0.1428) q[11];
rz(0.1071) q[12];

// Layer 2: Flow conservation and capacity constraints
cx q[0], q[4];
rz(-0.3214) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-0.2857) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(-0.0714) q[2];
cx q[1], q[2];
cx q[2], q[3];
rz(-0.0714) q[3];
cx q[2], q[3];
cx q[3], q[5];
rz(-0.0357) q[5];
cx q[3], q[5];
cx q[4], q[2];
rz(-0.1786) q[2];
cx q[4], q[2];
cx q[4], q[6];
rz(-0.1428) q[6];
cx q[4], q[6];
cx q[5], q[2];
rz(-0.1071) q[2];
cx q[5], q[2];
cx q[5], q[3];
rz(-0.1428) q[3];
cx q[5], q[3];

// Layer 3: Source-sink constraints and optimization
rz(0.4286) q[0];
rz(0.2857) q[6];
rz(0.2143) q[4];
rz(0.1786) q[5];
rz(0.1429) q[2];
rz(0.1071) q[3];
rz(0.0714) q[1];
rz(0.0357) q[7];
rz(0.3214) q[8];
rz(0.2857) q[9];
rz(0.2500) q[10];
rz(0.2143) q[11];
rz(0.1786) q[12];

// Layer 4: Final optimization and measurement preparation
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
rz(0.5714) q[0];
rz(0.4286) q[6];
rz(0.3571) q[4];
rz(0.2857) q[5];
rz(0.2143) q[2];
rz(0.1429) q[3];
rz(0.0714) q[1];
rz(0.0357) q[7];
rz(0.3214) q[8];
rz(0.2857) q[9];
rz(0.2500) q[10];
rz(0.2143) q[11];
rz(0.1786) q[12];

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