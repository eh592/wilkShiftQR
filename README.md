# wilkShiftQR

This project considers the unshifted QR algorithm (i.e. pure QR) and a shifted version with using Wilkinson shifts.

Two main functions (drivers) that call relevant functions to conduct the analysis

driver_unshiftedqralg.m
driver_wilkqralg..m

each of these drivers follow the following steps

1) reduce into upper hessenburg form. Will be tridiagonal in the case of real symmetric matrices.
2) perform shift
3) usual QR
4) record convergence data
