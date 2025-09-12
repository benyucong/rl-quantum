OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
cx q[0], q[2]; // Edges from source 0 to nodes 2 and 3
cx q[0], q[3]; 
cx q[1], q[2]; // Edges from node 1 to nodes 2 and 3
cx q[1], q[3]; 
rz(0.123) q[0]; // Optimize parameters for flow representation
rz(0.456) q[1];
rz(0.789) q[2];
rz(0.123) q[3];
h q[0];
h q[1];
h q[2];
h q[3];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];