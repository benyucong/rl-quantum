OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem unitary for vertex cover
rz(0.2145) q[0];
rz(0.3128) q[1];
rz(0.4287) q[2];
rz(0.1892) q[3];
rz(0.3674) q[4];
rz(0.2956) q[5];
rz(0.1037) q[6];
cx q[0], q[2];
rz(-0.1253) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(-0.1087) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(-0.1428) q[2];
cx q[1], q[2];
cx q[1], q[4];
rz(-0.1562) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(-0.1349) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(-0.1183) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(-0.1297) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(-0.0956) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(-0.1124) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(-0.0872) q[6];
cx q[5], q[6];

// Layer 2: Mixer unitary
rx(0.4281) q[0];
rx(0.5127) q[1];
rx(0.3679) q[2];
rx(0.2954) q[3];
rx(0.4532) q[4];
rx(0.3896) q[5];
rx(0.2148) q[6];

// Layer 3: Problem unitary
rz(0.1987) q[0];
rz(0.2874) q[1];
rz(0.3952) q[2];
rz(0.1743) q[3];
rz(0.3389) q[4];
rz(0.2721) q[5];
rz(0.0956) q[6];
cx q[0], q[2];
rz(-0.1158) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(-0.1002) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(-0.1317) q[2];
cx q[1], q[2];
cx q[1], q[4];
rz(-0.1441) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(-0.1243) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(-0.1092) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(-0.1196) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(-0.0882) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(-0.1037) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(-0.0804) q[6];
cx q[5], q[6];

// Layer 4: Mixer unitary
rx(0.3954) q[0];
rx(0.4732) q[1];
rx(0.3398) q[2];
rx(0.2726) q[3];
rx(0.4187) q[4];
rx(0.3598) q[5];
rx(0.1982) q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];