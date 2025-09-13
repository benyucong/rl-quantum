OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard on all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Problem-specific phase rotations based on edge weights
rz(0.6283) q[0];  // Edge 0-1 (weight 3)
rz(3.1416) q[1];  // Edge 0-1 (weight 3)
rz(3.1416) q[0];  // Edge 0-3 (weight 15)
rz(3.1416) q[3];  // Edge 0-3 (weight 15)
rz(3.1416) q[0];  // Edge 0-5 (weight 15)
rz(3.1416) q[5];  // Edge 0-5 (weight 15)
rz(2.7227) q[1];  // Edge 1-5 (weight 13)
rz(2.7227) q[5];  // Edge 1-5 (weight 13)
rz(1.0472) q[2];  // Edge 2-3 (weight 5)
rz(1.0472) q[3];  // Edge 2-3 (weight 5)
rz(3.3510) q[3];  // Edge 3-4 (weight 16)
rz(3.3510) q[4];  // Edge 3-4 (weight 16)
rz(3.7699) q[3];  // Edge 3-6 (weight 18)
rz(3.7699) q[6];  // Edge 3-6 (weight 18)
rz(2.0944) q[4];  // Edge 4-5 (weight 10)
rz(2.0944) q[5];  // Edge 4-5 (weight 10)

// Layer 3: Mixing layer with optimal parameters
rx(1.8849) q[0];
rx(1.8849) q[1];
rx(1.8849) q[2];
rx(1.8849) q[3];
rx(1.8849) q[4];
rx(1.8849) q[5];
rx(1.8849) q[6];
rx(1.8849) q[7];

// Layer 4: Final phase rotations and measurement preparation
rz(0.9425) q[0];
rz(0.9425) q[1];
rz(0.9425) q[2];
rz(0.9425) q[3];
rz(0.9425) q[4];
rz(0.9425) q[5];
rz(0.9425) q[6];
rz(0.9425) q[7];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];