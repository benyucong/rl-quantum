OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1 - Initial Hadamard and parameterized rotations
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

// Layer 1 - Problem-specific entangling gates
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[6];
cx q[2], q[3];
cx q[2], q[5];
cx q[2], q[6];
cx q[3], q[5];
cx q[3], q[6];
cx q[4], q[5];
cx q[5], q[6];

// Layer 1 - Parameterized Z rotations
rz(0.2147) q[0];
rz(0.1983) q[1];
rz(0.2251) q[2];
rz(0.2319) q[3];
rz(0.2076) q[4];
rz(0.2432) q[5];
rz(0.2198) q[6];
rz(0.1924) q[7];
rz(0.2089) q[8];
rz(0.2236) q[9];
rz(0.2351) q[10];
rz(0.2017) q[11];
rz(0.2173) q[12];

// Layer 2 - Mixer and parameterized rotations
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

rz(0.4289) q[0];
rz(0.3967) q[1];
rz(0.4502) q[2];
rz(0.4638) q[3];
rz(0.4152) q[4];
rz(0.4864) q[5];
rz(0.4396) q[6];
rz(0.3848) q[7];
rz(0.4178) q[8];
rz(0.4472) q[9];
rz(0.4702) q[10];
rz(0.4034) q[11];
rz(0.4346) q[12];

// Layer 3 - Mixer and parameterized rotations
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

rz(0.6434) q[0];
rz(0.5950) q[1];
rz(0.6753) q[2];
rz(0.6957) q[3];
rz(0.6228) q[4];
rz(0.7296) q[5];
rz(0.6594) q[6];
rz(0.5772) q[7];
rz(0.6267) q[8];
rz(0.6708) q[9];
rz(0.7053) q[10];
rz(0.6051) q[11];
rz(0.6519) q[12];

// Layer 4 - Final mixer and parameterized rotations
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

rz(0.8578) q[0];
rz(0.7933) q[1];
rz(0.9004) q[2];
rz(0.9276) q[3];
rz(0.8304) q[4];
rz(0.9728) q[5];
rz(0.8792) q[6];
rz(0.7696) q[7];
rz(0.8356) q[8];
rz(0.8944) q[9];
rz(0.9404) q[10];
rz(0.8068) q[11];
rz(0.8692) q[12];

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