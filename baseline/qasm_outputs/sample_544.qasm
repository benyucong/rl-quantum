OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
// Initialize superposition
h q[0];
h q[1];
h q[2];
h q[3];
// Apply flow constraints (layer 1)
// Edge 0->2 (capacity 5)
crx(1.0472) q[0], q[2];  // ~5/6π rotation
// Edge 0->3 (capacity 1)
crx(0.5236) q[0], q[3];  // ~1/6π rotation
// Edge 1->2 (capacity 1)
crx(0.5236) q[1], q[2];  // ~1/6π rotation
// Edge 1->3 (capacity 6)
crx(1.5708) q[1], q[3];  // π/2 rotation
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];