# PrintSlasher
Utility for slicing STL files on an angle, for extended 3d printing.


The general idea is to take an STL file, and split it into multiple parts which can then be printed individually.  This is intended to demonstrate turning a cartesian 3d printer (i.e. not an angled belt printer) into a machine that can print infinitely long parts, by adding a conveyor belt on one of the axes.

This is a first stab at a workaround-style solution.  A better plan would be to build this into a slicer, or to modify an existing belt-capable slicer to produce parts for 4-axis beltprinters.  The goal here is to  produce, from a single STL, a set of STLs that can be printed one after the other to reproduce the original part.

```
Imagine a long rectilinear prism: [____] 300mm in length for illustration.
Instead of printing one long piece (which is, for the purpose of our imagining, longer than your printer), slash it into three angled slices: [_/   /__/   /_]
To print the whole part, print the third slice first
Advance the bed 100mm
Print the middle slice - the angled faces will match up, joining the slices together.  The angle of the slash is dependent on your hotend and nozzle geometry, and ideally variable.
Advance the bed 100mm
Print the last slice, with the angles again matching.

```

Thus, you get an entire part printed, longer than your bed, with a nice long join that you don't need to do post-print.


