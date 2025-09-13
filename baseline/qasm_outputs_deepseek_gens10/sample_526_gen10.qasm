OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1 - Problem unitary with optimal parameters
// Edge (0,1) weight 7
cx q[0], q[1];
rz(0.098) q[1];
cx q[0], q[1];

// Edge (0,5) weight 13
cx q[0], q[5];
rz(0.182) q[5];
cx q[0], q[5];

// Edge (0,4) weight 13
cx q[0], q[4];
rz(0.182) q[4];
cx q[0], q[4];

// Edge (1,2) weight 20
cx q[1], q[2];
rz(0.280) q[2];
cx q[1], q[2];

// Edge (1,5) weight 14
cx q[1], q[5];
rz(0.196) q[5];
cx q[1], q[5];

// Edge (2,3) weight 1
cx q[2], q[3];
rz(0.014) q[3];
cx q[2], q[3];

// Edge (3,5) weight 17
cx q[3], q[5];
rz(0.238) q[5];
cx q[3], q[5];

// Edge (4,5) weight 10
cx q[4], q[5];
rz(0.140) q[5];
cx q[4], q[5];

// Layer 1 - Mixer unitary
h q[0];
rz(0.785) q[0];
h q[0];
h q[1];
rz(0.785) q[1];
h q[1];
h q[2];
rz(0.785) q[2];
h q[2];
h q[3];
rz(0.785) q[3];
h q[3];
h q[4];
rz(0.785) q[4];
h q[4];
h q[5];
rz(0.785) q[5];
h q[5];
h q[6];
rz(0.785) q[6];
h q[6];
h q[7];
rz(0.785) q[7];
h q[7];

// Layer 2 - Problem unitary with optimal parameters
// Edge (0,1) weight 7
cx q[0], q[1];
rz(0.196) q[1];
cx q[0], q[1];

// Edge (0,5) weight 13
cx q[0], q[5];
rz(0.364) q[5];
cx q[0], q[5];

// Edge (0,4) weight 13
cx q[0], q[4];
rz(0.364) q[4];
cx q[0], q[4];

// Edge (1,2) weight 20
cx q[1], q[2];
rz(0.560) q[2];
cx q[1], q[2];

// Edge (1,5) weight 14
cx q[1], q[5];
rz(0.392) q[5];
cx q[1], q[5];

// Edge (2,3) weight 1
cx q[2], q[3];
rz(0.028) q[3];
cx q[2], q[3];

// Edge (3,5) weight 17
cx q[3], q[5];
rz(0.476) q[5];
cx q[3], q[5];

// Edge (4,5) weight 10
cx q[4], q[5];
rz(0.280) q[5];
cx q[4], q[5];

// Layer 2 - Mixer unitary
h q[0];
rz(1.570) q[0];
h q[0];
h q[1];
rz(1.570) q[1];
h q[1];
h q[2];
rz(1.570) q[2];
h q[2];
h q[3];
rz(1.570) q[3];
h q[3];
h q[4];
rz(1.570) q[4];
h q[4];
h q[5];
rz(1.570) q[5];
h q[5];
h q[6];
rz(1.570) q[6];
h q[6];
h q[7];
rz(1.570) q[7];
h q[7];

// Layer 3 - Problem unitary with optimal parameters
// Edge (0,1) weight 7
cx q[0], q[1];
rz(0.294) q[1];
cx q[0], q[1];

// Edge (0,5) weight 13
cx q[0], q[5];
rz(0.546) q[5];
cx q[0], q[5];

// Edge (0,4) weight 13
cx q[0], q[4];
rz(0.546) q[4];
cx q[0], q[4];

// Edge (1,2) weight 20
cx q[1], q[2];
rz(0.840) q[2];
cx q[1], q[2];

// Edge (1,5) weight 14
cx q[1], q[5];
rz(0.588) q[5];
cx q[1], q[5];

// Edge (2,3) weight 1
cx q[2], q[3];
rz(0.042) q[3];
cx q[2], q[3];

// Edge (3,5) weight 17
cx q[3], q[5];
rz(0.714) q[5];
cx q[3], q[5];

// Edge (4,5) weight 10
cx q[4], q[5];
rz(0.420) q[5];
cx q[4], q[5];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];