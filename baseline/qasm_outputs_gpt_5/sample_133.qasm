OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Apply Hadamard gates to all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// First layer of controlled rotations
rz(0.7481) q[0];
cx q[0], q[3];
rz(0.2989) q[3];
cx q[0], q[3];

rz(0.9349) q[0];
cx q[0], q[5];
rz(0.4519) q[5];
cx q[0], q[5];

rz(0.9002) q[0];
cx q[0], q[6];
rz(0.1924) q[6];
cx q[0], q[6];

rz(0.2945) q[1];
cx q[1], q[5];
rz(0.7533) q[5];
cx q[1], q[5];

rz(0.7698) q[2];
cx q[2], q[3];
rz(0.3134) q[3];
cx q[2], q[3];

rz(0.1318) q[4];
cx q[4], q[5];
rz(0.8679) q[5];
cx q[4], q[5];

rz(0.4496) q[4];
cx q[4], q[6];
rz(0.6121) q[6];
cx q[4], q[6];

// Second layer of controlled rotations
rz(0.6491) q[3];
cx q[0], q[3];
rz(0.0424) q[3];
cx q[0], q[3];

rz(0.0585) q[5];
cx q[0], q[5];
rz(0.2422) q[5];
cx q[0], q[5];

rz(0.5967) q[6];
cx q[0], q[6];
rz(0.2488) q[6];
cx q[0], q[6];

rz(0.5755) q[1];
cx q[1], q[5];
rz(0.9876) q[5];
cx q[1], q[5];

rz(0.9051) q[2];
cx q[2], q[3];
rz(0.0345) q[3];
cx q[2], q[3];

rz(0.7854) q[5];
cx q[4], q[5];
rz(0.3480) q[5];
cx q[4], q[5];

rz(0.0447) q[6];
cx q[4], q[6];
rz(0.8819) q[6];
cx q[4], q[6];

// Third layer of rotations to finalize
h q[0];
rz(1.0666) q[0];
h q[0];

h q[1];
rz(0.9982) q[1];
h q[1];

h q[2];
rz(0.1058) q[2];
h q[2];

h q[3];
rz(0.1543) q[3];
h q[3];

h q[4];
rz(0.6883) q[4];
h q[4];

h q[5];
rz(0.4726) q[5];
h q[5];

h q[6];
rz(0.5573) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];