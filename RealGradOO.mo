within derxpoo;

operator record RealGradOO
  Real val "value of a real identity";
  parameter Integer NP = 0 "number of active parameters";
  Real grad[NP] "gradients";

  encapsulated operator function '*'
    import derxpoo.RealGradOO;
    input RealGradOO g1;
    input RealGradOO g2;
    output RealGradOO res;
  algorithm
    res.val := g1.val * g2.val;
    res.grad := g1.grad * g2.val + g1.val * g2.grad;
  end '*';

  encapsulated operator function '+'
    import derxpoo.RealGradOO;
    input RealGradOO g1;
    input RealGradOO g2;
    output RealGradOO res;
  algorithm
    res.val := g1.val + g2.val;
    res.grad := g1.grad + g2.grad;
  end '+';

  // Modelica language specification does not explicitly state that function der can be overloaded

  encapsulated function 'der' 
    
    import derxpoo.RealGradOO; 
    
    input RealGradOO g;
    output RealGradOO dxp;
    
  algorithm
// unfortionately this der is not allowed in functions, may be to try with blocks instead
    der(dxp.val)  := g.val; 
    der(dxp.grad) := g.grad;
  
  end 'der';
end RealGradOO;
