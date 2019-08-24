# *MODELLING AND CONTROL OF DEFORMABLE OBJECTS*

Matlab Version: 2018b
Add-ons to be installed:

- Simscape
- Simscape Multibody 6.0;
- Simscape Multibody from Matlab code;
- Simscape Multibody Multiphysics library;
- Flexible Body Models in Simscape Multibody;
- Robot Arm with conveyor belts (for grippers model);


# *calibration procedure*

Model extraction, by introducing a certain deformation **delta** on the 
4 inputs. The purpose is to provide the next phase with a model to be used
to superimpose beam and fixture markers.

# *alignment bending procedure*

By using the previously computed model, it is possible by minimizing the 
distance between the two set of markers.

# *home position ros*

In charge of computing the initial joint pose for the two robots, with a sign
modification to adapt the model in simulation with the one in real world.

# *calibration stability analysis*

This module is specifically designed to compute a NxN grid of sensitivity 
Jacobians to be used to check the stability interval for a given set of values

# *stability analysis*

It actually performs the computation of the eigenvalues of matrix (pinv(J*) J(u)), 
with J* model in the final configuration.

**Bugs and future work**

Deformable object may lead to errors for the very first execution, due to
disconnection of beam key-frames.

As a future work it would be good to automatically insert the desired
number of key-frames throughout the length of the beam.