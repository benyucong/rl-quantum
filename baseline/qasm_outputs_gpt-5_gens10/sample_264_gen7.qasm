OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Applying controlled rotations based on edges capacity
cx q[0], q[2];  // 0 -> 2
rz(0.7560) q[2];
cx q[0], q[2];

cx q[0], q[5];  // 0 -> 5
rz(0.5596) q[5];
cx q[0], q[5];

cx q[0], q[6];  // 0 -> 6
rz(0.4904) q[6];
cx q[0], q[6];

cx q[0], q[7];  // 0 -> 7
rz(0.4320) q[7];
cx q[0], q[7];

cx q[1], q[2];  // 1 -> 2
rz(0.8634) q[2];
cx q[1], q[2];

cx q[1], q[3];  // 1 -> 3
rz(0.7854) q[3];
cx q[1], q[3];

cx q[1], q[4];  // 1 -> 4
rz(0.5772) q[4];
cx q[1], q[4];

// Layer 3: Apply the final rotation 
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

rz(0.2134) q[0];
h q[0];

rz(0.3472) q[1];
h q[1];

rz(0.1230) q[2];
h q[2];

rz(0.1904) q[3];
h q[3];

rz(0.2874) q[4];
h q[4];

rz(0.4201) q[5];
h q[5];

rz(0.0046) q[6];
h q[6];

rz(0.0800) q[7];
h q[7];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];