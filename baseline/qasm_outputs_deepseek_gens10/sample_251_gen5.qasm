OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard on all qubits
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

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,5) weight 2
rz(0.314) q[0];
rz(0.314) q[5];
cx q[0], q[5];
rz(-0.157) q[5];
cx q[0], q[5];

// Edge (1,6) weight 9
rz(1.413) q[1];
rz(1.413) q[6];
cx q[1], q[6];
rz(-0.706) q[6];
cx q[1], q[6];

// Edge (1,9) weight 14
rz(2.199) q[1];
rz(2.199) q[9];
cx q[1], q[9];
rz(-1.099) q[9];
cx q[1], q[9];

// Edge (1,8) weight 14
rz(2.199) q[1];
rz(2.199) q[8];
cx q[1], q[8];
rz(-1.099) q[8];
cx q[1], q[8];

// Edge (2,7) weight 2
rz(0.314) q[2];
rz(0.314) q[7];
cx q[2], q[7];
rz(-0.157) q[7];
cx q[2], q[7];

// Edge (2,10) weight 14
rz(2.199) q[2];
rz(2.199) q[10];
cx q[2], q[10];
rz(-1.099) q[10];
cx q[2], q[10];

// Edge (3,8) weight 1
rz(0.157) q[3];
rz(0.157) q[8];
cx q[3], q[8];
rz(-0.078) q[8];
cx q[3], q[8];

// Edge (4,9) weight 9
rz(1.413) q[4];
rz(1.413) q[9];
cx q[4], q[9];
rz(-0.706) q[9];
cx q[4], q[9];

// Edge (4,5) weight 18
rz(2.827) q[4];
rz(2.827) q[5];
cx q[4], q[5];
rz(-1.413) q[5];
cx q[4], q[5];

// Edge (4,7) weight 13
rz(2.042) q[4];
rz(2.042) q[7];
cx q[4], q[7];
rz(-1.021) q[7];
cx q[4], q[7];

// Layer 3: Mixer layer with optimal parameters
rx(1.571) q[0];
rx(1.571) q[1];
rx(1.571) q[2];
rx(1.571) q[3];
rx(1.571) q[4];
rx(1.571) q[5];
rx(1.571) q[6];
rx(1.571) q[7];
rx(1.571) q[8];
rx(1.571) q[9];
rx(1.571) q[10];

// Layer 4: Final parameterized rotations
rz(0.785) q[0];
rz(1.047) q[1];
rz(0.524) q[2];
rz(0.262) q[3];
rz(1.309) q[4];
rz(0.785) q[5];
rz(0.524) q[6];
rz(0.393) q[7];
rz(0.655) q[8];
rz(0.917) q[9];
rz(0.458) q[10];

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