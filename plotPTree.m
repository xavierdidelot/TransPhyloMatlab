function plotPTree(tree)
%This function takes a phylogenetic tree as input

n=ceil(size(tree,1)/2);
br=tree(n+1:end,2:3);
for i=1:n*2-2
    f=find(tree(:,2)==i|tree(:,3)==i);
    d(i)=tree(i,1)-tree(f,1);
end
d=[d 0];
plot(phytree(br,d'));