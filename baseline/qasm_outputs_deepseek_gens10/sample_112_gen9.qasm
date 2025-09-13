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
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];
// Edge (1,2)
cx q[1], q[2];
rz(0.3128) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1987) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.2256) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.2031) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1892) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1765) q[4];
cx q[2], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1923) q[6];
cx q[5], q[6];

// Layer 1: Mixer unitary
rz(0.8456) q[0];
rz(0.7231) q[1];
rz(0.9124) q[2];
rz(0.6789) q[3];
rz(0.7562) q[4];
rz(0.8347) q[5];
rz(0.7893) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.8456) q[0];
rz(0.7231) q[1];
rz(0.9124) q[2];
rz(0.6789) q[3];
rz(0.7562) q[4];
rz(0.8347) q[5];
rz(0.7893) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2: Problem unitary
cx q[0], q[2];
rz(0.4012) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.5236) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.3874) q[3];
cx q[1], q[3];
cx q[1], q[5];
rz(0.4128) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(0.3956) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.3789) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.3652) q[4];
cx q[2], q[4];
cx q[5], q[6];
rz(0.3821) q[6];
cx q[5], q[6];

// Layer 2: Mixer unitary
rz(1.2345) q[0];
rz(1.0567) q[1];
rz(1.3789) q[2];
rz(1.0123) q[3];
rz(1.1456) q[4];
rz(1.2678) q[5];
rz(1.1892) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(1.2345) q[0];
rz(1.0567) q[1];
rz(1.3789) q[2];
rz(1.0123) q[3];
rz(1.1456) q[4];
rz(1.2678) q[5];
rz(1.1892) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 3: Problem unitary
cx q[0], q[2];
rz(0.6123) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.7348) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.5892) q[3];
cx q[1], q[3];
cx q[1], q[5];
rz(0.6234) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(0.5987) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.5789) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.5623) q[4];
cx q[2], q[4];
cx q[5], q[6];
rz(0.5812) q[6];
cx q[5], q[6];

// Layer 3: Mixer unitary
rz(1.6789) q[0];
rz(1.4231) q[1];
rz(1.7892) q[2];
rz(1.3567) q[3];
rz(1.5123) q[4];
rz(1.6345) q[5];
rz(1.5678) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(1.6789) q[0];
rz(1.4231) q[1];
rz(1.7892) q[2];
rz(1.3567) q[3];
rz(1.5123) q[4];
rz(1.6345) q[5];
rz(1.5678) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 4: Problem unitary
cx q[0], q[2];
rz(0.8234) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.9456) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.7891) q[3];
cx q[1], q[3];
cx q[1], q[5];
rz(0.8237) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(0.8012) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.7789) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.7623) q[4];
cx q[2], q[4];
cx q[5], q[6];
rz(0.7815) q[6];
cx q[5], q[6];

// Layer 4: Mixer unitary
rz(2.1234) q[0];
rz(1.8234) q[1];
rz(2.2345) q[2];
rz(1.7234) q[3];
rz(1.9234) q[4];
rz(2.0456) q[5];
rz(1.9789) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(2.1234) q[0];
rz(1.8234) q[1];
rz(2.2345) q[2];
rz(1.7234) q[3];
rz(1.9234) q[4];
rz(2.0456) q[5];
rz(1.9789) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];