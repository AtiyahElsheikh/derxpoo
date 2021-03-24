within derxpoo.Examples;

model PrimativeSimple
  import derxpoo.Primative.*; 
  
  type MyGrad = derxpoo.Primative.RealGrad(NP = 3);
  MyGrad x(val.start = x0.val,grad.start={0,0,0});
  MyGrad y;
  parameter MyGrad x0(val = 1.0, grad = {1, 0, 0});
  parameter MyGrad p(val = -2.0, grad = {0, 1, 0});
  parameter MyGrad q(val = 0.1, grad = {0, 0, 1});
  MyGrad temp "temp var";
equation
  temp = multiply(p, y);
  // x = derxp(temp); der is not allowed in functions 
  der(x.val)  = temp.val; 
  der(x.grad[1:3]) = temp.grad[1:3];
  y = add(q, x);
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end PrimativeSimple;
