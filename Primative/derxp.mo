within derxpoo.Primative;

function derxp
  //import Primative.RealGrad; 
  //parameter Integer NP = 0;
  //type MyGrad = RealGrad(NP=NP);  
  input  RealGrad g; 
  // input  Integer  i; 
  output RealGrad dxp; 

algorithm

  //der(dxp.val)  := g.val; 
  //der(dxp.grad) := g.grad;

  dxp.val  := g.val;  // * (time - pre(time)) +  pre(dxp.val); 
  dxp.grad := g.grad; // * (time - pre(time)) +  pre(dxp.grad);

end derxp;
