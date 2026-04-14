V:=WeylModule(7,[4,2,4],"A",3);;
v:=MaximalVectors(V)[4];;
S:=SubWeylModule(V,v);;
#Q:=QuotientWeylModule(V,S);
#v:=MaximalVectors(Q)[2];
#S:=SubWeylModule(Q,v);
