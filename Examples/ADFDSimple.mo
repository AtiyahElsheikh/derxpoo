within derxpoo.Examples;

model ADFDSimple
  extends derxpoo.Examples.Simple1;
  
  parameter Real delta = 0.01 "FD stepsize"; 
// Declaration for AD
  Real[3] g_x(start = g_x0);  
  Real[3] g_y;  
  
  Real x(start = x0); 
  Real y;

  parameter Real[3] g_x0 = {1,0,0}; 
  parameter Real[3] g_p  = {0,1,0}; 
  parameter Real[3] g_q  = {0,0,1}; 
// Declaration for FD
  Simple1 M(x0=x0+delta*x0); 
  Real dxx0;
  Real dyx0; 
// Difference
  Real error; 
  
equation
// AD Part
  der(g_x) = g_p * y + p * g_y; 
  g_y  = g_q + g_x;
// FD part
  dxx0 = (M.x - x) / delta * x0; 
  dyx0 = (M.y - y) / delta*x0;
// Difference
  error = g_x[1] - dxx0;  
annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02));
end ADFDSimple;
