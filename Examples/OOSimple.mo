within derxpoo.Examples;

partial model OOSimple
   
   import derxpoo.RealGradOO; 
   type MyGrad = RealGradOO(NP=3); 
   
   
   MyGrad x(val.start = x0.val); 
   MyGrad y;

   parameter MyGrad x0(val=1.0,grad={1,0,0}); 
   parameter MyGrad p(val=-2.0,grad={0,1,0}); 
   parameter MyGrad q(val=0.1,grad={0,0,1}); 
   
   MyGrad temp;
   
equation

   // der(x) = p * y ; does not work with OMC 1.17 
   // Instead 
   
   temp = p * y; 
   der(x.val)  = temp.val; 
   der(x.grad) = temp.grad; 
   y  = q + x;  

annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02));
end OOSimple;
