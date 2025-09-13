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
rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.1763) q[2];
rz(0.2318) q[3];
rz(0.1892) q[4];
rz(0.2056) q[5];
rz(0.1924) q[6];

cx q[0], q[1];
rz(-0.0873) q[1];
cx q[0], q[1];

cx q[0], q[3];
rz(-0.0921) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(-0.0856) q[4];
cx q[0], q[4];

cx q[1], q[3];
rz(-0.0942) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(-0.0887) q[4];
cx q[1], q[4];

cx q[1], q[6];
rz(-0.0839) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(-0.0918) q[3];
cx q[2], q[3];

cx q[2], q[5];
rz(-0.0864) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(-0.0842) q[6];
cx q[2], q[6];

cx q[3], q[5];
rz(-0.0897) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(-0.0876) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(-0.0823) q[5];
cx q[4], q[5];

cx q[5], q[6];
rz(-0.0798) q[6];
cx q[5], q[6];

// Layer 1: Mixer unitary
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Layer 2: Problem unitary
rz(0.1983) q[0];
rz(0.1842) q[1];
rz(0.1628) q[2];
rz(0.2147) q[3];
rz(0.1751) q[4];
rz(0.1904) q[5];
rz(0.1782) q[6];

cx q[0], q[1];
rz(-0.0809) q[1];
cx q[0], q[1];

cx q[0], q[3];
rz(-0.0853) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(-0.0793) q[4];
cx q[0], q[4];

cx q[1], q[3];
rz(-0.0872) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(-0.0821) q[4];
cx q[1], q[4];

cx q[1], q[6];
rz(-0.0777) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(-0.0850) q[3];
cx q[2], q[3];

cx q[2], q[5];
rz(-0.0800) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(-0.0780) q[6];
cx q[2], q[6];

cx q[3], q[5];
rz(-0.0831) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(-0.0811) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(-0.0762) q[5];
cx q[4], q[5];

cx q[5], q[6];
rz(-0.0739) q[6];
cx q[5], q[6];

// Layer 2: Mixer unitary
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Layer 3: Problem unitary
rz(0.1837) q[0];
rz(0.1706) q[1];
rz(0.1508) q[2];
rz(0.1989) q[3];
rz(0.1621) q[4];
rz(0.1763) q[5];
rz(0.1650) q[6];

cx q[0], q[1];
rz(-0.0749) q[1];
cx q[0], q[1];

cx q[0], q[3];
rz(-0.0790) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(-0.0734) q[4];
cx q[0], q[4];

cx q[1], q[3];
rz(-0.0807) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(-0.0760) q[4];
cx q[1], q[4];

cx q[1], q[6];
rz(-0.0719) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(-0.0787) q[3];
cx q[2], q[3];

cx q[2], q[5];
rz(-0.0741) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(-0.0722) q[6];
cx q[2], q[6];

cx q[3], q[5];
rz(-0.0769) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(-0.0751) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(-0.0705) q[5];
cx q[4], q[5];

cx q[5], q[6];
rz(-0.0684) q[6];
cx q[5], q[6];

// Layer 3: Mixer unitary
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Layer 4: Problem unitary
rz(0.1701) q[0];
rz(0.1580) q[1];
rz(0.1396) q[2];
rz(0.1842) q[3];
rz(0.1501) q[4];
rz(0.1633) q[5];
rz(0.1528) q[6];

cx q[0], q[1];
rz(-0.0694) q[1];
cx q[0], q[1];

cx q[0], q[3];
rz(-0.0731) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(-0.0680) q[4];
cx q[0], q[4];

cx q[1], q[3];
rz(-0.0747) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(-0.0704) q[4];
cx q[1], q[4];

cx q[1], q[6];
rz(-0.0666) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(-0.0729) q[3];
cx q[2], q[3];

cx q[2], q[5];
rz(-0.0686) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(-0.0669) q[6];
cx q[2], q[6];

cx q[3], q[5];
rz(-0.0712) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(-0.0695) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(-0.0653) q[5];
cx q[4], q[5];

cx q[5], q[6];
rz(-0.0633) q[6];
cx q[5], q[6];

// Layer 4: Mixer unitary
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];