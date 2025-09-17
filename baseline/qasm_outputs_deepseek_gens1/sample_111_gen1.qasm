OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1
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

// Edge interactions layer 1
rz(0.314) q[0];
rz(0.314) q[1];
rz(0.314) q[2];
rz(0.471) q[3];
rz(0.471) q[5];
rz(0.471) q[8];
rz(0.471) q[10];
rz(0.628) q[4];
rz(0.628) q[6];
rz(0.628) q[9];
rz(0.785) q[7];

// Layer 2
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

// Edge interactions layer 2
rz(0.471) q[0];
rz(0.471) q[1];
rz(0.471) q[2];
rz(0.628) q[3];
rz(0.628) q[5];
rz(0.628) q[8];
rz(0.628) q[10];
rz(0.785) q[4];
rz(0.785) q[6];
rz(0.785) q[9];
rz(0.942) q[7];

// Layer 3
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

// Edge interactions layer 3
rz(0.628) q[0];
rz(0.628) q[1];
rz(0.628) q[2];
rz(0.785) q[3];
rz(0.785) q[5];
rz(0.785) q[8];
rz(0.785) q[10];
rz(0.942) q[4];
rz(0.942) q[6];
rz(0.942) q[9];
rz(1.099) q[7];

// Layer 4
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

// Final edge interactions
rz(0.785) q[0];
rz(0.785) q[1];
rz(0.785) q[2];
rz(0.942) q[3];
rz(0.942) q[5];
rz(0.942) q[8];
rz(0.942) q[10];
rz(1.099) q[4];
rz(1.099) q[6];
rz(1.099) q[9];
rz(1.256) q[7];

// Measurements
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