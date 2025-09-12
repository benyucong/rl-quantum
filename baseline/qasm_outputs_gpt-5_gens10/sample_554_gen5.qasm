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

// Entangling operations based on the matching graph
crz(0.1234) q[0], q[6];
crz(0.2234) q[0], q[7];
crz(0.1345) q[1], q[7];
crz(0.5001) q[1], q[11];
crz(0.3456) q[2], q[8];
crz(0.2543) q[2], q[9];
crz(0.0487) q[3], q[9];
crz(0.1987) q[4], q[10];
crz(0.8765) q[4], q[7];
crz(0.5678) q[5], q[11];
crz(0.4567) q[5], q[8];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Second set of entangling operations (optimized parameters)
crz(0.3210) q[0], q[6];
crz(0.4560) q[0], q[7];
crz(0.2345) q[1], q[7];
crz(0.0987) q[1], q[11];
crz(0.7654) q[2], q[8];
crz(0.0987) q[2], q[9];
crz(0.6789) q[3], q[9];
crz(0.1357) q[4], q[10];
crz(0.8642) q[4], q[7];
crz(0.7890) q[5], q[11];
crz(0.4321) q[5], q[8];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Third set of entangling operations
crz(0.1357) q[0], q[6];
crz(0.2468) q[0], q[7];
crz(0.3691) q[1], q[7];
crz(0.7891) q[1], q[11];
crz(0.1234) q[2], q[8];
crz(0.4567) q[2], q[9];
crz(0.2345) q[3], q[9];
crz(0.3456) q[4], q[10];
crz(0.4567) q[4], q[7];
crz(0.5678) q[5], q[11];
crz(0.6789) q[5], q[8];

// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Final entangling operations for the last layer
crz(0.8765) q[0], q[6];
crz(0.9876) q[0], q[7];
crz(0.6543) q[1], q[7];
crz(0.1234) q[1], q[11];
crz(0.5432) q[2], q[8];
crz(0.6789) q[2], q[9];
crz(0.7890) q[3], q[9];
crz(0.8901) q[4], q[10];
crz(0.9123) q[4], q[7];
crz(0.0345) q[5], q[11];
crz(0.5678) q[5], q[8];

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