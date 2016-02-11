function prob=probTTreeBranching(ttree)
%Function for calculating the log-probability of a transmission tree given generation and sampling distributions 

for i=1:size(ttree,1)
    infector=ttree(i,3);
    if infector==0,continue;end
    if ttree(i,1)>ttree(infector,2)||ttree(i,1)<ttree(infector,1),prob=-inf;return;end %if the infection time of infected is
    % larger than the removal time of infector its improbable. if infection time of infected is smaller than infector's infections time improbable
end

%setup
prob=0; % initialise overall probability
R_0 = 1.5; 
spars=[1,2];
gtpars=[2,10]; 

for i=1:size(ttree,1)
    % probability of k offspring given length of infectiousness
    k = sum(ttree(:,3)==i); %number of offspring for each i
	tsamp = ttree(i,2); %sampling time of infector
	tinf = ttree(i,1); %infection time for the infector
	F = gamcdf(tsamp - tinf,gtpars(1),gtpars(2)); %F = int(fg)
    p_k = poisspdf(k,(R_0)*F); 
   
    % probability of being sampled given when infected
    p_s = gampdf(tsamp - tinf,spars(1),spars(2)); 
   
    % probability of infecting offspring at given times given generation
    % distribution
    if k==0  %i.e. if i has no offspring
        prob = prob + log(p_k) + log(p_s);  
    else
        total_pi = 0; 
        ind=ttree(:,3)==i; %index of offspring 
        I = [find(ind==1),ttree(ttree(:,3)==i,1)]; %who is the offspring and when were they infected 
        for j=1:k %sum over all offspring
            p_i = gampdf(I(j,2)-ttree(i,1),gtpars(1),gtpars(2)); %probability of infecting at given times given when infected
            total_pi = total_pi + log(p_i) - log(F);
        end
        prob = prob + log(p_k) + log(p_s)+ total_pi;
    end
end
