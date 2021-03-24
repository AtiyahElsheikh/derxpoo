within derxpoo.Primative;

record RealGrad

  Real val   "value of a real identity"; 
  replaceable parameter Integer NP = 0 "number of active parameters"; 
  Real grad[NP] "gradients"; 
  
end RealGrad;
