OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

# First layer of controlled gates
cx q[0], q[3];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[3];
cx q[3], q[4];
cx q[3], q[5];

# Second layer of rotation gates
rz(0.45) q[0];
rz(0.48) q[1];
rz(0.50) q[2];
rz(0.52) q[3];
rz(0.46) q[4];
rz(0.47) q[5];

# Third layer of controlled gates (inter-layer connections)
cx q[0], q[3];
cx q[1], q[3];
cx q[3], q[0];
cx q[4], q[3];
cx q[5], q[3];

# Fourth layer of measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];