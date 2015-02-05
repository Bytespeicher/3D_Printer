## Printer Calibration Objects

- far calibrating various parameters in the printer- or slicer-settings


### Temp Tower 

- 120mm wall-only tower with perimeter to test straight, round, spiked and kurved edges.
- marked with a small nodge every 10mm

-.gcode file manipulated with script to change temp from 190degC to 210degC over height

- stl is not manifold by intention. 
- Slice with 0% infill and perimeters only. 
- Use Slic3r with verbose gcode output to make the python script work
- Usage of brim highly encouraged