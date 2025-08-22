OPENQASM 3.0;
include "stdgates.inc";

qubit[2] q;

// Candidate: close to Bell with slight angle perturbations
// (enables Stage 4 to optimize parameters automatically)
ry(1.57) q[0];     // ~ π/2, close to H on |0>
rz(0.05) q[0];
cx q[0], q[1];
rx(0.03) q[1];
