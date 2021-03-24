within derxpoo.Primative;

function multiply

  input  RealGrad g1; 
  input  RealGrad g2; 
  output RealGrad res; 

algorithm

  res.val  := g1.val * g2.val; 
  res.grad := g1.grad * g2.val + g1.val * g2.grad;     

end multiply;
