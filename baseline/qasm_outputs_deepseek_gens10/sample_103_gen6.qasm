OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initial Hadamard and first mixing
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

// First cost unitary (U_C with gamma1 = 0.423)
// Edge 0-1 (capacity 2)
cx q[0], q[1];
rz(0.846) q[1];
cx q[0], q[1];
// Edge 0-2 (capacity 4)
cx q[0], q[2];
rz(1.692) q[2];
cx q[0], q[2];
// Edge 0-3 (capacity 3)
cx q[0], q[3];
rz(1.269) q[3];
cx q[0], q[3];
// Edge 0-6 (capacity 3)
cx q[0], q[6];
rz(1.269) q[6];
cx q[0], q[6];
// Edge 1-3 (capacity 3)
cx q[1], q[3];
rz(1.269) q[3];
cx q[1], q[3];
// Edge 1-6 (capacity 5)
cx q[1], q[6];
rz(2.115) q[6];
cx q[1], q[6];
// Edge 1-8 (capacity 2)
cx q[1], q[8];
rz(0.846) q[8];
cx q[1], q[8];
// Edge 2-3 (capacity 6)
cx q[2], q[3];
rz(2.538) q[3];
cx q[2], q[3];
// Edge 2-4 (capacity 1)
cx q[2], q[4];
rz(0.423) q[4];
cx q[2], q[4];
// Edge 2-5 (capacity 5)
cx q[2], q[5];
rz(2.115) q[5];
cx q[2], q[5];
// Edge 2-6 (capacity 2)
cx q[2], q[6];
rz(0.846) q[6];
cx q[2], q[6];
// Edge 2-9 (capacity 2)
cx q[2], q[9];
rz(0.846) q[9];
cx q[2], q[9];
// Edge 3-7 (capacity 5)
cx q[3], q[7];
rz(2.115) q[7];
cx q[3], q[7];
// Edge 4-1 (capacity 6)
cx q[4], q[1];
rz(2.538) q[1];
cx q[4], q[1];
// Edge 4-2 (capacity 2)
cx q[4], q[2];
rz(0.846) q[2];
cx q[4], q[2];
// Edge 4-3 (capacity 6)
cx q[4], q[3];
rz(2.538) q[3];
cx q[4], q[3];
// Edge 4-6 (capacity 2)
cx q[4], q[6];
rz(0.846) q[6];
cx q[4], q[6];
// Edge 4-7 (capacity 3)
cx q[4], q[7];
rz(1.269) q[7];
cx q[4], q[7];
// Edge 5-1 (capacity 3)
cx q[5], q[1];
rz(1.269) q[1];
cx q[5], q[1];
// Edge 5-6 (capacity 5)
cx q[5], q[6];
rz(2.115) q[6];
cx q[5], q[6];
// Edge 5-7 (capacity 3)
cx q[5], q[7];
rz(1.269) q[7];
cx q[5], q[7];
// Edge 6-1 (capacity 4)
cx q[6], q[1];
rz(1.692) q[1];
cx q[6], q[1];
// Edge 6-2 (capacity 2)
cx q[6], q[2];
rz(0.846) q[2];
cx q[6], q[2];
// Edge 6-7 (capacity 6)
cx q[6], q[7];
rz(2.538) q[7];
cx q[6], q[7];
// Edge 6-8 (capacity 4)
cx q[6], q[8];
rz(1.692) q[8];
cx q[6], q[8];
// Edge 7-2 (capacity 5)
cx q[7], q[2];
rz(2.115) q[2];
cx q[7], q[2];
// Edge 7-4 (capacity 6)
cx q[7], q[4];
rz(2.538) q[4];
cx q[7], q[4];
// Edge 7-9 (capacity 6)
cx q[7], q[9];
rz(2.538) q[9];
cx q[7], q[9];
// Edge 8-1 (capacity 3)
cx q[8], q[1];
rz(1.269) q[1];
cx q[8], q[1];
// Edge 8-9 (capacity 3)
cx q[8], q[9];
rz(1.269) q[9];
cx q[8], q[9];

// First mixing unitary (U_M with beta1 = 0.218)
rx(0.436) q[0];
rx(0.436) q[1];
rx(0.436) q[2];
rx(0.436) q[3];
rx(0.436) q[4];
rx(0.436) q[5];
rx(0.436) q[6];
rx(0.436) q[7];
rx(0.436) q[8];
rx(0.436) q[9];

// Layer 2: Second cost unitary (gamma2 = 0.587)
// Edge 0-1
cx q[0], q[1];
rz(1.174) q[1];
cx q[0], q[1];
// Edge 0-2
cx q[0], q[2];
rz(2.348) q[2];
cx q[0], q[2];
// Edge 0-3
cx q[0], q[3];
rz(1.761) q[3];
cx q[0], q[3];
// Edge 0-6
cx q[0], q[6];
rz(1.761) q[6];
cx q[0], q[6];
// Edge 1-3
cx q[1], q[3];
rz(1.761) q[3];
cx q[1], q[3];
// Edge 1-6
cx q[1], q[6];
rz(2.935) q[6];
cx q[1], q[6];
// Edge 1-8
cx q[1], q[8];
rz(1.174) q[8];
cx q[1], q[8];
// Edge 2-3
cx q[2], q[3];
rz(3.522) q[3];
cx q[2], q[3];
// Edge 2-4
cx q[2], q[4];
rz(0.587) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(2.935) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(1.174) q[6];
cx q[2], q[6];
// Edge 2-9
cx q[2], q[9];
rz(1.174) q[9];
cx q[2], q[9];
// Edge 3-7
cx q[3], q[7];
rz(2.935) q[7];
cx q[3], q[7];
// Edge 4-1
cx q[4], q[1];
rz(3.522) q[1];
cx q[4], q[1];
// Edge 4-2
cx q[4], q[2];
rz(1.174) q[2];
cx q[4], q[2];
// Edge 4-3
cx q[4], q[3];
rz(3.522) q[3];
cx q[4], q[3];
// Edge 4-6
cx q[4], q[6];
rz(1.174) q[6];
cx q[4], q[6];
// Edge 4-7
cx q[4], q[7];
rz(1.761) q[7];
cx q[4], q[7];
// Edge 5-1
cx q[5], q[1];
rz(1.761) q[1];
cx q[5], q[1];
// Edge 5-6
cx q[5], q[6];
rz(2.935) q[6];
cx q[5], q[6];
// Edge 5-7
cx q[5], q[7];
rz(1.761) q[7];
cx q[5], q[7];
// Edge 6-1
cx q[6], q[1];
rz(2.348) q[1];
cx q[6], q[1];
// Edge 6-2
cx q[6], q[2];
rz(1.174) q[2];
cx q[6], q[2];
// Edge 6-7
cx q[6], q[7];
rz(3.522) q[7];
cx q[6], q[7];
// Edge 6-8
cx q[6], q[8];
rz(2.348) q[8];
cx q[6], q[8];
// Edge 7-2
cx q[7], q[2];
rz(2.935) q[2];
cx q[7], q[2];
// Edge 7-4
cx q[7], q[4];
rz(3.522) q[4];
cx q[7], q[4];
// Edge 7-9
cx q[7], q[9];
rz(3.522) q[9];
cx q[7], q[9];
// Edge 8-1
cx q[8], q[1];
rz(1.761) q[1];
cx q[8], q[1];
// Edge 8-9
cx q[8], q[9];
rz(1.761) q[9];
cx q[8], q[9];

// Second mixing unitary (beta2 = 0.382)
rx(0.764) q[0];
rx(0.764) q[1];
rx(0.764) q[2];
rx(0.764) q[3];
rx(0.764) q[4];
rx(0.764) q[5];
rx(0.764) q[6];
rx(0.764) q[7];
rx(0.764) q[8];
rx(0.764) q[9];

// Layer 3: Third cost unitary (gamma3 = 0.294)
// Edge 0-1
cx q[0], q[1];
rz(0.588) q[1];
cx q[0], q[1];
// Edge 0-2
cx q[0], q[2];
rz(1.176) q[2];
cx q[0], q[2];
// Edge 0-3
cx q[0], q[3];
rz(0.882) q[3];
cx q[0], q[3];
// Edge 0-6
cx q[0], q[6];
rz(0.882) q[6];
cx q[0], q[6];
// Edge 1-3
cx q[1], q[3];
rz(0.882) q[3];
cx q[1], q[3];
// Edge 1-6
cx q[1], q[6];
rz(1.47) q[6];
cx q[1], q[6];
// Edge 1-8
cx q[1], q[8];
rz(0.588) q[8];
cx q[1], q[8];
// Edge 2-3
cx q[2], q[3];
rz(1.764) q[3];
cx q[2], q[3];
// Edge 2-4
cx q[2], q[4];
rz(0.294) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(1.47) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.588) q[6];
cx q[2], q[6];
// Edge 2-9
cx q[2], q[9];
rz(0.588) q[9];
cx q[2], q[9];
// Edge 3-7
cx q[3], q[7];
rz(1.47) q[7];
cx q[3], q[7];
// Edge 4-1
cx q[4], q[1];
rz(1.764) q[1];
cx q[4], q[1];
// Edge 4-2
cx q[4], q[2];
rz(0.588) q[2];
cx q[4], q[2];
// Edge 4-3
cx q[4], q[3];
rz(1.764) q[3];
cx q[4], q[3];
// Edge 4-6
cx q[4], q[6];
rz(0.588) q[6];
cx q[4], q[6];
// Edge 4-7
cx q[4], q[7];
rz(0.882) q[7];
cx q[4], q[7];
// Edge 5-1
cx q[5], q[1];
rz(0.882) q[1];
cx q[5], q[1];
// Edge 5-6
cx q[5], q[6];
rz(1.47) q[6];
cx q[5], q[6];
// Edge 5-7
cx q[5], q[7];
rz(0.882) q[7];
cx q[5], q[7];
// Edge 6-1
cx q[6], q[1];
rz(1.176) q[1];
cx q[6], q[1];
// Edge 6-2
cx q[6], q[2];
rz(0.588) q[2];
cx q[6], q[2];
// Edge 6-7
cx q[6], q[7];
rz(1.764) q[7];
cx q[6], q[7];
// Edge 6-8
cx q[6], q[8];
rz(1.176) q[8];
cx q[6], q[8];
// Edge 7-2
cx q[7], q[2];
rz(1.47) q[2];
cx q[7], q[2];
// Edge 7-4
cx q[7], q[4];
rz(1.764) q[4];
cx q[7], q[4];
// Edge 7-9
cx q[7], q[9];
rz(1.764) q[9];
cx q[7], q[9];
// Edge 8-1
cx q[8], q[1];
rz(0.882) q[1];
cx q[8], q[1];
// Edge 8-9
cx q[8], q[9];
rz(0.882) q[9];
cx q[8], q[9];

// Final mixing unitary (beta3 = 0.127)
rx(0.254) q[0];
rx(0.254) q[1];
rx(0.254) q[2];
rx(0.254) q[3];
rx(0.254) q[4];
rx(0.254) q[5];
rx(0.254) q[6];
rx(0.254) q[7];
rx(0.254) q[8];
rx(0.254) q[9];

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