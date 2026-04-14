divPowerVec:= function(gen,vec,p,k)
  # returns the divided power vector (gen^(p^k)/Factorial(p^k))^vec mod p
  local j,m,n,divVec,zeroVec;
  
  divVec:= vec;
  zeroVec:= 0*vec;
  m:= 0;
  n:= (p^k-1)/(p-1);
  for j in [1..p^k] do
    divVec:= gen^divVec;
    if divVec = zeroVec then return(zeroVec); fi;
    while (divVec mod p) = zeroVec do
      m:= m+1;
      divVec:= divVec/p;
    od;
#    divVec:= divVec mod p;
  od;
  divVec:= (-1)^n * divVec;
  if m = n then return(divVec mod p);
  elif m>n then return(zeroVec);
  else
    Print(gen);
    Print(vec);
    Print(p);
    Print(k);
    return fail; 
  fi;
end;
