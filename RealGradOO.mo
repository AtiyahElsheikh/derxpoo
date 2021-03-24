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

  encapsulated operator function 'der' 
    input RealGrad g;
    input Integer i;
    output Real dxp;
  algorithm
    dxp := g.grad[i];
  end 'der';
end RealGradOO;
