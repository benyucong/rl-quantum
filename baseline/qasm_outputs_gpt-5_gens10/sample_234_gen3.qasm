OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

# First layer of entanglement
cx q[0], q[1];  // Edge from source (0) to (1)
cx q[0], q[2];  // Edge from source (0) to (2)
cx q[1], q[6];  // Edge from (1) to sink (6)
cx q[2], q[5];  // Edge from (2) to (5)
cx q[3], q[4];  // Edge from (3) to (4)
cx q[3], q[7];  // Edge from (3) to sink (7)

# Second layer of entanglement
cx q[4], q[7];  // Edge from (4) to (7)
cx q[5], q[1];  // Edge from (5) to (1)
cx q[5], q[3];  // Edge from (5) to (3)
cx q[5], q[7];  // Edge from (5) to sink (7)
cx q[6], q[1];  // Edge from (6) to (1)
cx q[6], q[5];  // Edge from (6) to (5)
cx q[6], q[7];  // Edge from (6) to sink (7)

# Measure the final states
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];