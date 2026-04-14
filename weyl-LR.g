wtToComp:=function(mu)
    # helper function like WeightToComposition, but 
    # without the degree
    local ans, k;    
    ans:= [];
    for k in [1..Length(mu)] do
        Add(ans, Sum( mu{[k..Length(mu)]} ));
    od;
    while 0 in ans do Remove(ans); od;
    return ans;
end;

LR:=function(lambda,mu)
    # applies the Littlewood-Richardson rule to two 
    # weights for type A
    local n, p1, p2, ans, l, lnew;
    if Length(lambda) <> Length(mu) then
        return fail;
    else n:=Length(lambda)+1;
    fi;
    p1:=wtToComp(lambda);
    p2:=wtToComp(mu);
    ans:=[];
    for l in LittlewoodRichardsonRule(p1,p2) do
        if Length(l)<=n then
            lnew:=l;
            if Length(lnew)<n then
                while Length(lnew)<n do 
                    Add(lnew, 0); 
                od;
            fi;
            Add(ans, CompositionToWeight(lnew));
        fi;
    od;
    return ans;
end;
