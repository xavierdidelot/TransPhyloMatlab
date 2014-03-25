function plotTTree(ttree)
%Plots a transmission tree
n=size(ttree,1);

cm=zeros(n+1,n+1);
ids{1}='SOURCE';
for i=1:n
    cm(ttree(i,3)+1,i+1)=1;
    ids{i+1}=sprintf('%d [%.2f;%.2f]',i,ttree(i,1),ttree(i,2));
end
bg=biograph(cm,ids,'LayoutScale',0.5);%Create biograph
set(bg.nodes(:),'FontSize',12);
g=biograph.bggui(bg);%View biograph