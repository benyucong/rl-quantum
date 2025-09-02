OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initial Hadamard layer to create superposition
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

// First layer of controlled rotations based on bipartite matching
rz(0.6216) q[0]; 
cz q[0], q[5];
rz(0.5793) q[0]; 
cz q[0], q[12]; 

rz(0.8561) q[1]; 
cz q[1], q[6];
rz(0.9423) q[1]; 
cz q[1], q[11]; 

rz(0.7230) q[2]; 
cz q[2], q[7];
rz(0.4482) q[2]; 
cz q[2], q[10]; 

rz(0.6750) q[3]; 
cz q[3], q[8];
rz(0.6145) q[3]; 
cz q[3], q[8];

rz(0.8129) q[4]; 
cz q[4], q[9];
rz(0.4984) q[4]; 
cz q[4], q[6];

// Second layer of controlled rotations
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

rz(0.1141) q[0]; 
cz q[0], q[5];
rz(0.2648) q[0]; 
cz q[0], q[12]; 

rz(0.3767) q[1]; 
cz q[1], q[6];
rz(0.1996) q[1]; 
cz q[1], q[11]; 

rz(0.2262) q[2]; 
cz q[2], q[7];
rz(0.4910) q[2]; 
cz q[2], q[10]; 

rz(0.9840) q[3]; 
cz q[3], q[8];
rz(0.3945) q[3]; 
cz q[3], q[8];

rz(0.1235) q[4]; 
cz q[4], q[9];
rz(0.2118) q[4]; 
cz q[4], q[6];

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