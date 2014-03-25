function record=infer(tree,mcmc,timeLastSeq)
%Tree is a phylogeny
%mcmc is the number of MCMC iterations to perform
%timeLastSeq is the date of the last sequence
if nargin<3,timeLastSeq=2010;end
if nargin<2,mcmc=10000;end

n=ceil(size(tree,1)/2);
neg=100/365;%Within-host effective population size (Ne) times  generation duration (g)
popsize=1000;%Size of population
beta=0.001;%Infectiveness
nu=1;%Rate of recovery

%MCMC loop
fulltree=makeFullTreeFromPTree(tree);%Starting point
record(mcmc).tree=0;
pTTree=probTTree(ttreeFromFullTree(fulltree),popsize,beta,nu);
pPTree=probPTreeGivenTTree(fulltree,neg);
for i=1:mcmc
    %Record things
    record(i).tree=absolute(fulltree,timeLastSeq);
    record(i).pTTree=pTTree;
    record(i).pPTree=pPTree;
    record(i).neg=neg;
    record(i).source=fulltree(end-1,4);
    record(i).nu=nu;
    record(i).beta=beta;
    %Metropolis update for transmission tree
    fulltree2=proposal(fulltree);
    pTTree2=probTTree(ttreeFromFullTree(fulltree2),popsize,beta,nu);
    pPTree2=probPTreeGivenTTree(fulltree2,neg);
    if log(rand)<pTTree2+pPTree2-pTTree-pPTree,fulltree=fulltree2;pTTree=pTTree2;pPTree=pPTree2;end
    %Metropolis update for Ne*g, assuming Exp(1) prior
    neg2=neg+(rand-0.5)*record(1).neg;
    if neg2<0,neg2=-neg2;end
    pPTree2=probPTreeGivenTTree(fulltree,neg2);
    if log(rand)<pPTree2-pPTree-neg2+neg,neg=neg2;pPTree=pPTree2;end
    %Gibbs updates for beta and nu based on O'Neill and Roberts JRSSA 16:121-129 (1999) and assuming Exp(1) priors
    ttree=ttreeFromFullTree(fulltree);
    intXtYtdt=intXtYtdtGivenTTree(ttree,popsize);
    beta=gamrnd(1+n-1,1/(1+intXtYtdt));
    nu=gamrnd(1+n,1/(1+n*mean(ttree(:,2)-ttree(:,1))));
end

function ft=absolute(fulltree,timeLastRem)
%Convert from relative to absolute time using timeLastRem which is the date of the last removal (ie the last sequence)
ft=fulltree;
ft(:,1)=ft(:,1)+timeLastRem-max(ft(:,1));