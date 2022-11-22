# OSVM GC insights
A simple tool to visualize and give GC infos. The tool aims to give more insights into the GC state of the vm.

Currently shows which gc algorithm runs, if it has phases in which phase it is, edens occopacy and the occopacy of the old space segments

Relies on the primitive 584 currently only implemented in my patch of the opensmalltalk-vm.
