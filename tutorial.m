%Initialisation of random number generators
rand('state',0);randn('state',0);

%Simulation of an outbreak
outbreak=simu(100/365,1000,0.001,1,10);

%Plot the outbreak as a colored phylogeny
plotBothTree(outbreak);

%Extract and plot just the transmission tree
plotTTree(ttreeFromFullTree(outbreak));

%Extract and plot the phylogeny
plotPTree(ptreeFromFullTree(outbreak));

%Inference of transmission tree given a phylogeny
ptree=ptreeFromFullTree(outbreak);
timeLastSeq=max(outbreak(:,1));
result=infer(ptree,10000,timeLastSeq);

%Trace of log-posterior
plot([result(:).pTTree]+[result(:).pPTree]);

%Trace of parameter beta
plot([result(:).beta]);

%Histogram of probabilities to be the source case
hist([result(end/2:end).source],1:10);

%Plot configuration after first half of the MCMC
plotBothTree(result(end/2).tree);