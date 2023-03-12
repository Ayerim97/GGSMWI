% STRATIFICATION
% for feedback model
% Based on data taken from International Labor Organization 
% http://laborsta.ilo.org/STP/guest

% pais => Kind of society under analysis
% 0 - Society Type A, ideal
% 1 - Society Type B, developed country
% 2 - Society Type C, emerging economy (BRICS)
% 3 - Society Type D, developing country

function paisp = StratificationParams(pais,y0)

numHH  = y0(18);
numHH1 = y0(21);
numHH2 = y0(22);
HH     = y0(9);
HH1    = y0(23);
HH2    = y0(24);

if pais==0 % TYPE A - IDEAL
    % Two Populations modifications (2P):
    % 1(low income) - 2(high income)
    % 2P)   Income Equality Index (IEI) => 1.0
    % 2P-a) 75-25 total population 
    % 2P-b) 75-25 total wages
    % 2P-c) 75-25 total P1demand & H1demand 
    % 2P-d) 75-25 total ISdemand & EEdemand
    % 2P-e) 75-25 HH
    
    IEI=1;
    %numHH1(1) = 0.75*numHH(1);    %2P-a)
    %numHH2(1) = 0.25*numHH(1);    %2P-a)
    %HH1(1)    = HH(1)*.75;        %2P-e)
    %HH2(1)    = HH(1)*.25;        %2P-e)
    %phi1      = phi;       %related to healtcare and nutricional issues  
    %phi2      = phi/2;     %population 2 have access to a better healthcare 
    %percapmass1(1) = HH1(1)/numHH1(1);
    %percapmass2(1) = HH2(1)/numHH2(1);

    % Factors for modification in individual populations variables
    % equation systems formed by:
    % 1) pop1 + pop2 = total pop
    % 2) pop1 - pop2*(percentages ratios) = 0
    Ab=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(75/25)];  %2P-b)
    Ac=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(75/25)];  %2P-c)
    Ad=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(75/25)];  %2P-d)
    bb=[1 0];           %solution vector
    f2pb=inv(Ab)*bb';
    f2pc=inv(Ac)*bb';
    f2pd=inv(Ad)*bb';
    f2pe=[HH1/HH HH2/HH];
end

if pais==1 % TYPE B - GERMANY
    % Two Populations modifications (2P):
    % 1(low income) - 2(high income)
    % 2P)   Income Equality Index (IEI) => 1.2
    % 2P-a) 75-25 total population
    % 2P-b) 62.2-37.8 total wages
    % 2P-c) 73.3-26.7 total P1demand & H1demand 
    % 2P-d) 62.2-37.8 total ISdemand & EEdemand
    % 2P-e) 64.6-35.4 HH

    IEI=1.2;
    %numHH1(1) = 0.75*numHH(1);    %2P-a)
    %numHH2(1) = 0.25*numHH(1);    %2P-a)
    %HH1(1)    = HH(1)*.646;       %2P-e)
    %HH2(1)    = HH(1)*.354;       %2P-e)
    %phi1      = phi;       %related to healtcare and nutricional issues
    %phi2      = phi/2;     %population 2 have access to a better healthcare 
    %percapmass1(1) = HH1(1)/numHH1(1);
    %percapmass2(1) = HH2(1)/numHH2(1);
    
    % Factors for modification in individual populations variables
    % equation systems formed by:
    % 1) pop1 + pop2 = total pop
    % 2) pop1 - pop2*(percentages ratios) = 0
    Ab=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(62.2/37.8)];  %2P-b)
    Ac=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(73.3/26.7)];  %2P-c)
    Ad=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(62.2/37.8)];  %2P-d)
    bb=[1 0];
    f2pb=inv(Ab)*bb';
    f2pc=inv(Ac)*bb';
    f2pd=inv(Ad)*bb';
    f2pe=[HH1/HH HH2/HH];
end

if pais==2 % TYPE C - USA
    % Two Populations modifications (2P):
    % 1(low income) - 2(high income)
    % 2P)   Income Equality Index (IEI) => 1.5
    % 2P-a) 75-25 total population
    % 2P-b) 49.7-50.3 total wages
    % 2P-c) 68-32 total P1demand & H1demand 
    % 2P-d) 52-48 total ISdemand & EEdemand
    % 2P-e) 68.6-31.4 HH

    IEI=1.5;
    %numHH1(1) = 0.75*numHH(1);    %2P-a)
    %numHH2(1) = 0.25*numHH(1);    %2P-a)
    %HH1(1)    = HH(1)*.686;       %2P-e)
    %HH2(1)    = HH(1)*.314;       %2P-e)
    %phi1      = phi;       %related to healtcare and nutricional issues 
    %phi2      = phi/2;     %population 2 have access to a better healthcare
    %percapmass1(1) = HH1(1)/numHH1(1);
    %percapmass2(1) = HH2(1)/numHH2(1);

    % Factors for modification in individual populations variables
    % equation systems formed by:
    % 1) pop1 + pop2 = total pop
    % 2) pop1 - pop2*(percentages ratios) = 0
    Ab=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(49.7/50.3)];  %2P-b)
    Ac=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(68/32)];  %2P-c)
    Ad=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(52/48)];  %2P-d)
    bb=[1 0];
    f2pb=inv(Ab)*bb';
    f2pc=inv(Ac)*bb';
    f2pd=inv(Ad)*bb';
    f2pe=[HH1/HH HH2/HH];
end

if pais==3 % TYPE D - MEXICO
    % Two Populations modifications (2P):
    % 1(low income) - 2(high income)
    % 2P)   Income Equality Index (IEI) => 2.0
    % 2P-a) 72-28 total population
    % 2P-b) 40.8-59.2 total wages
    % 2P-c) 52.6-47.4 total P1demand & H1demand 
    % 2P-d) 41.8-58.2 total ISdemand & EEdemand
    % 2P-e) 70.1-29.9 HH

    IEI=2;
    %numHH1(1) = 0.75*numHH(1);    %2P-a)
    %numHH2(1) = 0.25*numHH(1);    %2P-a)
    %HH1(1)    = HH(1)*.701;       %2P-e)
    %HH2(1)    = HH(1)*.299;       %2P-e)
    %phi1      = phi;       %related to healtcare and nutricional issues  
    %phi2      = phi/2;     %population 2 have access to a better healthcare 
    %percapmass1(1) = HH1(1)/numHH1(1);
    %percapmass2(1) = HH2(1)/numHH2(1);
    
    % Factors for modification in individual populations variables
    % equation systems formed by:
    % 1) pop1 + pop2 = total pop
    % 2) pop1 - pop2*(percentages ratios) = 0
    Ab=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(40.8/59.2)];  %2P-b)
    Ac=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(52.6/47.4)];  %2P-c)
    Ad=[numHH1/numHH numHH2/numHH;
        numHH1/numHH -(numHH2/numHH)*(41.8/58.2)];  %2P-d)
    bb=[1 0];
    f2pb=inv(Ab)*bb';
    f2pc=inv(Ac)*bb';
    f2pd=inv(Ad)*bb';
    f2pe=[HH1/HH HH2/HH];
end

paisp = [IEI f2pb' f2pc' f2pd' f2pe];

end