function truth=simu(neg,popsize,beta,nu,ninf)
%neg is Ne*g, ie the within-host effective population size (Ne) times  generation duration (g)
%popsize is the size of the population
%beta is the infectiveness
%nu is the rate of recovery
%ninf is the number of infected hosts, or 0 for any number

if nargin<1,neg=100/365;end
if nargin<2,popsize=1000;end
if nargin<3,beta=0.001;end
if nargin<4,nu=1;end
if nargin<5,ninf=5;end

%Create a transmission tree
n=-1;
while n~=ninf
    ttree=makeTTree(popsize,beta,nu);
    n=size(ttree,1);
    if ninf==0,ninf=n;end
end

%Create a within-host phylogenetic tree for each infected host
for i=1:n
    times=[ttree(i,2);ttree(find(ttree(:,3)==i),1)]-ttree(i,1);
    wtree{i}=withinhost(times,neg);
end

%Glue these trees together
truth=glueTrees(ttree,wtree);
truth(:,1)=truth(:,1)+2005;%Epidemic started in 2005
timeLastRem=max(truth(:,1));