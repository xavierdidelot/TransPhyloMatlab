function ptree=readPTree(filename)

ptree=phytreeread(filename);
dist=get(ptree,'DISTANCES');
poin=get(ptree,'POINTERS');
n=get(ptree,'NUMLEAVES');
ptree=zeros(n*2-1,3);
ptree(n+1:end,2:3)=poin;
for i=1:n*2-1
    time=0;
    j=i;
    while j<2*n-1
        time=time+dist(j);
        j=n+find(poin(:,1)==j|poin(:,2)==j);
    end
    ptree(i,1)=time;
end
