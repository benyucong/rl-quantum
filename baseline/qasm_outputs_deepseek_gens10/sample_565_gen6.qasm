OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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

// Layer 2: Problem-specific mixing with optimal parameters
// Edge (0,5) - weight 4
rz(0.6283) q[0];
rz(0.6283) q[5];
cx q[0], q[5];
rz(0.6283) q[5];
cx q[0], q[5];

// Edge (0,10) - weight 14 (represented as q[6] since we have 10 qubits)
rz(2.1991) q[0];
rz(2.1991) q[6];
cx q[0], q[6];
rz(2.1991) q[6];
cx q[0], q[6];

// Edge (1,6) - weight 4
rz(0.6283) q[1];
rz(0.6283) q[6];
cx q[1], q[6];
rz(0.6283) q[6];
cx q[1], q[6];

// Edge (1,5) - weight 14
rz(2.1991) q[1];
rz(2.1991) q[5];
cx q[1], q[5];
rz(2.1991) q[5];
cx q[1], q[5];

// Edge (2,7) - weight 4
rz(0.6283) q[2];
rz(0.6283) q[7];
cx q[2], q[7];
rz(0.6283) q[7];
cx q[2], q[7];

// Edge (2,10) - weight 13 (represented as q[6])
rz(2.0420) q[2];
rz(2.0420) q[6];
cx q[2], q[6];
rz(2.0420) q[6];
cx q[2], q[6];

// Edge (3,8) - weight 4
rz(0.6283) q[3];
rz(0.6283) q[8];
cx q[3], q[8];
rz(0.6283) q[8];
cx q[3], q[8];

// Edge (3,10) - weight 11 (represented as q[6])
rz(1.7279) q[3];
rz(1.7279) q[6];
cx q[3], q[6];
rz(1.7279) q[6];
cx q[3], q[6];

// Edge (4,9) - weight 7
rz(1.0996) q[4];
rz(1.0996) q[9];
cx q[4], q[9];
rz(1.0996) q[9];
cx q[4], q[9];

// Edge (4,5) - weight 15
rz(2.3562) q[4];
rz(2.3562) q[5];
cx q[4], q[5];
rz(2.3562) q[5];
cx q[4], q[5];

// Layer 3: Mixing Hamiltonian
h q[0];
rz(1.2566) q[0];
h q[0];
h q[1];
rz(1.2566) q[1];
h q[1];
h q[2];
rz(1.2566) q[2];
h q[2];
h q[3];
rz(1.2566) q[3];
h q[3];
h q[4];
rz(1.2566) q[4];
h q[4];
h q[5];
rz(1.2566) q[5];
h q[5];
h q[6];
rz(1.2566) q[6];
h q[6];
h q[7];
rz(1.2566) q[7];
h q[7];
h q[8];
rz(1.2566) q[8];
h q[8];
h q[9];
rz(1.2566) q[9];
h q[9];

// Layer 4: Final problem-specific mixing with optimized parameters
// Edge (0,5) - weight 4
rz(0.4712) q[0];
rz(0.4712) q[5];
cx q[0], q[5];
rz(0.4712) q[5];
cx q[0], q[5];

// Edge (0,10) - weight 14
rz(1.6493) q[0];
rz(1.6493) q[6];
cx q[0], q[6];
rz(1.6493) q[6];
cx q[0], q[6];

// Edge (1,6) - weight 4
rz(0.4712) q[1];
rz(0.4712) q[6];
cx q[1], q[6];
rz(0.4712) q[6];
cx q[1], q[6];

// Edge (1,5) - weight 14
rz(1.6493) q[1];
rz(1.6493) q[5];
cx q[1], q[5];
rz(1.6493) q[5];
cx q[1], q[5];

// Edge (2,7) - weight 4
rz(0.4712) q[2];
rz(0.4712) q[7];
cx q[2], q[7];
rz(0.4712) q[7];
cx q[2], q[7];

// Edge (2,10) - weight 13
rz(1.5315) q[2];
rz(1.5315) q[6];
cx q[2], q[6];
rz(1.5315) q[6];
cx q[2], q[6];

// Edge (3,8) - weight 4
rz(0.4712) q[3];
rz(0.4712) q[8];
cx q[3], q[8];
rz(0.4712) q[8];
cx q[3], q[8];

// Edge (3,10) - weight 11
rz(1.2959) q[3];
rz(1.2959) q[6];
cx q[3], q[6];
rz(1.2959) q[6];
cx q[3], q[6];

// Edge (4,9) - weight 7
rz(0.8247) q[4];
rz(0.8247) q[9];
cx q[4], q[9];
rz(0.8247) q[9];
cx q[4], q[9];

// Edge (4,5) - weight 15
rz(1.7671) q[4];
rz(1.7671) q[5];
cx q[4], q[5];
rz(1.7671) q[5];
cx q[4], q[5];

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