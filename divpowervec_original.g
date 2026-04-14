divPowerVec:= function(gen,vec,p,k)
  # returns the divided power vector (gen^(p^k)/Factorial(p^k))^vec mod p
  local j,m,primefree,nextVec,divVec,zeroVec,highestPrimePowerDiv;
  
  highestPrimePowerDiv:= function(n,p)
    local t,q;
    t:= 0;
    q:= p;
    while n mod q = 0 do
      t:= t+1;
      q:= p*q;
    od;
    return(t);
  end;
  
  divVec:= vec;
  zeroVec:= 0*vec;
  m:= 0;
  for j in [1..p^k] do
    nextVec:= gen^divVec;
    if nextVec = zeroVec then return(zeroVec); fi;
    if not (j mod p) = 0 then
      divVec:= PowerModInt(j,-1,p)*nextVec;
    else
      primefree:= j/p^highestPrimePowerDiv(j,p);
      divVec:= PowerModInt(primefree,-1,p)*nextVec;
      m:= m-highestPrimePowerDiv(j,p);
    fi;
    while (divVec mod p) = zeroVec do
      m:= m+1;
      divVec:= divVec/p;
    od;
#    divVec:= divVec mod p;
  od;
  if m = 0 then return(divVec mod p);
  elif m>0 then return(zeroVec);
  else return fail; fi;
end;
