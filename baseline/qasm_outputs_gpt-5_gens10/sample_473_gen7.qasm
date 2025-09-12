OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Applying CX and RZ gates for entangling
cx q[0], q[1];
rz(0.3427) q[1];
cx q[0], q[2];
rz(0.3426) q[2];
cx q[0], q[5];
rz(0.3425) q[5];
cx q[0], q[6];
rz(0.3424) q[6];
cx q[1], q[5];
rz(0.3423) q[5];
cx q[1], q[2];
rz(0.3422) q[2];
cx q[2], q[3];
rz(0.3421) q[3];

// Layer 2: More entanglement and phase rotation
cx q[3], q[1];
rz(0.4525) q[1];
cx q[5], q[3];
rz(0.4524) q[3];
cx q[4], q[5];
rz(0.4523) q[5];
cx q[6], q[7];
rz(0.4522) q[7];
cx q[2], q[4];
rz(0.4521) q[4];
cx q[1], q[0];
rz(0.4520) q[0];

// Layer 3: Finalizing the state
cx q[0], q[3];
rz(0.5623) q[3];
cx q[5], q[1];
rz(0.5622) q[1];
cx q[4], q[7];
rz(0.5621) q[7];
cx q[6], q[5];
rz(0.5620) q[5];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];