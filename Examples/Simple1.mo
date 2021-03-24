within derxpoo.Examples;

model Simple1
  
   Real x(start = x0); 
   Real y;

   parameter Real x0 = 1.0; 
   parameter Real p  = -2.0; 
   parameter Real q  = 0.1; 
   
equation

  der(x) = p * y ; 
  y  = q + x;  

annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02));
end Simple1;
