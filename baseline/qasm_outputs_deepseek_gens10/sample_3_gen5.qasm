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

// Parameterized rotations for edge cover optimization
rz(0.2147) q[0];
rz(0.1983) q[1];
rz(0.2251) q[2];
rz(0.1928) q[3];
rz(0.2076) q[4];
rz(0.2194) q[5];
rz(0.2039) q[6];
rz(0.2112) q[7];
rz(0.1965) q[8];
rz(0.2238) q[9];
rz(0.2087) q[10];
rz(0.2159) q[11];
rz(0.2014) q[12];

// Layer 2 - Edge interaction terms (CNOT + RZ gates)
// Edge 0-1
cx q[0], q[1];
rz(0.0873) q[1];
cx q[0], q[1];

// Edge 0-3
cx q[0], q[3];
rz(0.0915) q[3];
cx q[0], q[3];

// Edge 0-4
cx q[0], q[4];
rz(0.0892) q[4];
cx q[0], q[4];

// Edge 1-3
cx q[1], q[3];
rz(0.0856) q[3];
cx q[1], q[3];

// Edge 1-4
cx q[1], q[4];
rz(0.0881) q[4];
cx q[1], q[4];

// Edge 1-6
cx q[1], q[6];
rz(0.0928) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(0.0869) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.0903) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.0931) q[6];
cx q[2], q[6];

// Edge 3-5
cx q[3], q[5];
rz(0.0878) q[5];
cx q[3], q[5];

// Edge 3-6
cx q[3], q[6];
rz(0.0917) q[6];
cx q[3], q[6];

// Edge 4-5
cx q[4], q[5];
rz(0.0896) q[5];
cx q[4], q[5];

// Edge 5-6
cx q[5], q[6];
rz(0.0942) q[6];
cx q[5], q[6];

// Layer 3 - Additional parameterized mixing
rx(0.1562) q[0];
rx(0.1489) q[1];
rx(0.1627) q[2];
rx(0.1451) q[3];
rx(0.1528) q[4];
rx(0.1594) q[5];
rx(0.1503) q[6];
rx(0.1547) q[7];
rx(0.1472) q[8];
rx(0.1641) q[9];
rx(0.1536) q[10];
rx(0.1579) q[11];
rx(0.1498) q[12];

// Layer 4 - Final mixing and optimization
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

rz(0.1028) q[0];
rz(0.0984) q[1];
rz(0.1056) q[2];
rz(0.0962) q[3];
rz(0.1013) q[4];
rz(0.1042) q[5];
rz(0.0997) q[6];
rz(0.1021) q[7];
rz(0.0976) q[8];
rz(0.1063) q[9];
rz(0.1019) q[10];
rz(0.1035) q[11];
rz(0.0989) q[12];

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