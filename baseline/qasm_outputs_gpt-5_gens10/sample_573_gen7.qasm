OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialization and entanglement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[2];
cx q[2], q[5];
cx q[3], q[4];

// Layer 2: Apply rotation gates
rz(0.1747) q[0];
rz(0.6434) q[1];
rz(2.8196) q[2];
rz(1.2345) q[3];
rz(0.6633) q[4];
rz(0.5829) q[5];

// Layer 3: Additional entanglement and measurement
cx q[3], q[4];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];