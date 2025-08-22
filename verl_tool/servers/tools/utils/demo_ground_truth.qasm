OPENQASM 3.0;
include "stdgates.inc";

qubit[2] q;

// Ground-truth: Bell state |Φ+> = (|00> + |11>)/√2
h q[0];
cx q[0], q[1];
