%Bolaños Model
%Based on Rodriguez-Gonzalez and Nisal work
%Weekly approach 


% Funcion 

function [store_output,y] = EPAModel(Modelselection,PopulationExplosion, ...
	ConsumptionIncrease,power_plant,Tfinal,bioenergy,ns,pISHH_var,...
    theta_var,khat_var,Ito,Case,country,k)

%Iniciar tiempo 
%i = 1;

%Obtener parametros iniciales 
[iconditions,ecolparams,econparams] = Test(country);

%	Parameters for the periodic forcing function
%
%     period=52;	% period of sinusoidal forcing
%     Am=0.133;	% Used in the forcing function assignment
%     pi = 3.1416;
%zp
   % MinConstant=0;
    
%  for i = 1:3119
%             bioenergy(i) = 0;
%  end
%  for i = 3120:13000
%             bioenergy(i) = 0;
%  end
%  
       
%	Modification of the base mortality rate

%mHH=0.0191;     	% Annual mortality rate based on actual data
%mHH= mHH/52;		% Mortality rate if using weekly simulation step

%
%	Modification of the human compartment
%
%mHH=0.207443064;	% Annual mortality rate based on actual data
%mHH= mHH/52;        % Mortality rate if using weekly simulation step
% mHH = 0.01;
% mHHset(1)=mHH;
% 
% for i = 2600: 13000
%     j = i-2599; 
%     mHHset(j) = (45.927*((i)^(-1.004))/100); 
%  % GGSM gives mHHset values in 10^-5, this equation has been divided by 100
%  %to ensure that the mHHset values are in same denomination
% end
% for i = 7801:13000
%     j = i-2599;
%     mHHset(j) = mHHset(j)+5e-5;
% end 
% 
% if PopulationExplosion == 1
% 
%     for i = 6241:13000
%         j = i-2599;
%     
%         mHHset(j) = -3e-12*(i)^2 + 4e-08*(i) - 9e-05;
%     end
% 
% end
% 
% 
% %	Modifications to change birth rate
% %
% %span1 = 10400;
% span1 = 200;
% span=4000;
% etabstep=9/span;
% n=-4;
% 
% 
% for i = 1:span1
%     n=n+etabstep;
%     etabSet(i)=1e-4+(8-1)*1e-4/(1+10^(0.6021-n));
% end

%
%	Assign initial conditions
%
    y0=iconditions;
%
%===================================================
%
%	Declaring the fraction for changing the coefficients after importing
%
% Cf=1;
% ecolparams(1:21)=ecolparams(1:21)*Cf;

%i=1;
%===================================================
%
%	Do the following to find initial transfer flows for the global
%	variables
%
belownoreproduction=1e-4; %level below which the natural ecosystem
%	elements do not reproduce
%
%	assign parameters
%
% gRPP2=ecolparams(1);   gP2H2=ecolparams(2);   gP2H3=ecolparams(3);
% gRPP3=ecolparams(4);   gP3H3=ecolparams(5);   gH2C1=ecolparams(6);
% gH2C2=ecolparams(7);   gH3C2=ecolparams(8);   rIRPP2=ecolparams(9);
% rIRPP3=ecolparams(10); mP2=ecolparams(11);    mP3=ecolparams(12);
% mH2=ecolparams(13);    mH3=ecolparams(14);    mC1=ecolparams(15);
% mC2=ecolparams(16);    mIRPRP=ecolparams(17); RPIRP=ecolparams(18);
% gP1H2=ecolparams(20);  gH1C1=ecolparams(21);
% %
% %	econparams are economic parameters:
% %
% aw=econparams(1);      cw=econparams(2);     aP1=econparams(3);
% bP1=econparams(4);     cP1=econparams(5);    aP1p=econparams(6);
% bP1p=econparams(7);    cP1p=econparams(8);   aH1=econparams(9);
% bH1=econparams(10);    cH1=econparams(11);   aH1p=econparams(12);
% bH1p=econparams(13);   cH1p=econparams(14);  aIS=econparams(15);
% bIS=econparams(16);    cIS=econparams(17);   aISp=econparams(18);
% bISp=econparams(19);   cISp=econparams(20);  dP1H1=econparams(21);
% eP1H1=econparams(22);  fP1H1=econparams(23); gP1H1=econparams(24);
% dP1IS=econparams(25);  eP1IS=econparams(26); fP1IS=econparams(27);
% gP1IS=econparams(28);
% 
% khat=econparams(44); 
% 
% theta=econparams(45); 
% 
% lambda=econparams(46);
% gRPP1=econparams(47); mP1=econparams(48); mH1=econparams(49);
% mHH=econparams(50);
% P1bar=econparams(51); H1bar=econparams(52);
% ISbar=econparams(53); dw=econparams(54); etaa=econparams(55);
% etab=econparams(56); etac=econparams(57); phi=econparams(58);
% idealpercapmass=econparams(59);

%	Assign state
%
P1(1)=y0(1); P2(1)=y0(2); P3(1)=y0(3);
H1(1)=y0(4); H2(1)=y0(5); H3(1)=y0(6);
C1(1)=y0(7); C2(1)=y0(8);
HH(1)=y0(9); ISmass(1)=y0(10);
RP(1)=y0(11); IRP(1)=y0(12);
P1H1massdeficit(1)=y0(13); 
P1ISmassdeficit(1)=y0(14);
P1HHmassdeficit(1)=y0(15); 
H1massdeficit(1)=y0(16);
ISmassdeficit(1)=y0(17);
numHH(1)=y0(18);
percapmass(1)=y0(19);
FS(1)=y0(20);
ERP(1)=y0(20); %ERP y FS son iguales
EE(1) = 0;
%Añadido por Rodriguez para comparar
CO2eq(1)=300;
%Variables de estratificacion 
numHH1(1) = y0(21);
numHH2(1) = y0(22);
HH1(1) = y0(23);
HH2(1) = y0(24);
P1massdeficit(1)=y0(13)+y0(14)+y0(15);

%natural growing factors
gRPP2	=	0.009933643;
gP2H2	=	0.058687036;  
gP2H3	=	0.0168;       
gRPP3	=	0.000778772	;
gP3H3	=	0.125249403	;
gH2C1	=	0.366996266	;
gH2C2	=	0.052509103	;
gH3C2	=	0.117534846	;
rIRPP2	=	0.021472781	;
rIRPP3	=	0.357331692	;

%natural mortalities
mP2     =	0.197313146;   
mP3     =	0.186325524	;  
mH2     =	0.0004	;      
mH3     =	0.196123663	;  
mC1     =	0.092105574	;  
mC2     =	0.171458886	;  
mIRPRP	=	0	;      

%economic factors
RPIRP  	=	0.49337505	;  
gP1H2	=	0.079785	;  
gH1C1	=	0.19963	;      
gRPP1	=	0.003541127	;  
mP1     =	0.001018295	;      
mH1     =	0.009838862	;      

%wages
aw      =	0.43853	;
cw      =	0.135718104	;  
dw      =	4.51E-06	;  

%prices and productions
aP1     =	0.4968	;       
bP1     =	0.67631	;       
cP1     =	0.12318	;       
aP1p	=	0.050392    ;
bP1p	=	0.149737492	;
cP1p	=	0.033805381	;
aH1     =	1.4359	;      
bH1     =	0.001	;      
cH1     =	0.252716513	;  
aH1p	=	0.24182	;  
bH1p	=	0.049912497	;
cH1p	=	0.26657	;    
aIS     =	1.17	;      
bIS     =	0.297210307	;  
cIS     =	0.001	;      
aISp	=	0.3109	;  
bISp	=	0.0044	;  
cISp	=	0.3313	;

%agrary-livestoc interaction
dP1H1	=	0.000191077	;   
eP1H1	=	0.049912497	;   
fP1H1	=	0.81332	;       
gP1H1	=	2.9657	;       
% 
%product demands
dP1HH	=	4.00E-08    ;   
zP1HH	=	6.00E-08	;   
kP1HH	=	1.60E-07	;   
mP1HH	=	6.00E-08	;   
nP1HH	=	0	;           
dH1HH	=	6.00E-08	;   
zH1HH	=	3.13E-05	;   
kH1HH	=	6.00E-08	;   
mH1HH	=	6.00E-08	;   
nH1HH	=	0	;           
dISHH	=	6.00E-08	;   
zISHH	=	5.68E-05	;   
kISHH	=	6.00E-08	;   
mISHH	=	4.00E-08	;   
nISHH	=	2.00E-08	;
% 
%social and demographic
khat	=	.1;
theta	=	0.101991961	;
lambda	=	0.676677233	;
mHH     =	0.01;  
P1bar	=	0	;       
H1bar	=	0.4	;       
ISbar	=	0	;       
etaa	=	0.000271386*52;
etab	=	0.00010454*52; 
phi     =	10	;              
idealpercapmass	=	4.51E-05*10000/numHH(1);


% 
% rIRPP2=rIRPP2*(10^2/(10^2+IRP(i)^2));
% rIRPP3=rIRPP3*(10^2/(10^2+IRP(i)^2));

%
%	Redifing some of the starting conditions

% P2(1)= 12;
% C1(1)= 2.5; 
% P1(1)= 0.80213;  
% H1(1)= 2.5;
% ISmass(1)=0.35;

%
%	Modification to make P2 less sensitive to the changes in IRP mass
%
%rIRPP2=rIRPP2*5.0;
%
%	Fixing the values of some of the parameters based on sampling
%	analysis
%
% aP1=0.4968;
% bP1=0.67631;
% cP1=0.12318;
% aH1=1.4359;
% aH1p=0.24182;
% gH1C1=0.19963;
% 
% khat=khat*0.3;

%	Favorable parameter values

% cH1p = 0.26657;
% aIS = 1.17;
% aw = 0.43853;
% etaa = 0.969;

%	Parameter values resulting from sampling results
%    Nisal 
% zP1HH=0.192867714; zH1HH=0.259554658; zISHH=0.335706084;
% dP1HH=0.00651623;  dH1HH=0.003543056; dISHH=1.45E-05;
% mP1HH=0.000528414; mH1HH=0.007519699; mISHH=6.62E-06;
% nP1HH=0.00015245;  nH1HH=0.001742485; nISHH=0.000312971;
% kP1HH=0.009527954; kH1HH=0.00535058;  kISHH=0.003285769;


%TargetPercapbirth=mHH*2.5;
%etaa=etaa*3e-4;
%etab=etab*1e-4;
%numHH(i)=25364.31018;
% numHH(i)=1000;
% numHH1(i)=0.75*numHH(i);
% numHH2(i)=0.25*numHH(i);
%idealpercapmass=HH(i)/numHH(i);
%percapmass=HH(i)/numHH(i);
%Kdemand=2.0/(numHH(1));
Kdemand = 1;


% Stratification Params
countryp  = StratificationParams(country,y0);

%
%stratification
phi1    = phi;       %related to healtcare and nutricional issues  
phi2    = phi/2;     %population 2 have access to a better healthcare
percapmass1(1) = HH1(1)/numHH1(1);
percapmass2(1) = HH2(1)/numHH2(1);
IEI     = countryp(1);
f2pb(1) = countryp(2);
f2pb(2) = countryp(3);
f2pc(1) = countryp(4);
f2pc(2) = countryp(5);
f2pd(1) = countryp(6);
f2pd(2) = countryp(7);
f2pe(1) = countryp(8);
f2pe(2) = countryp(9);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ito's Processes 
% in mortatily (m) and birth rates(m)
sigmam=2.34e-05;
sigmab=1.56e-03;

epsilonm1=random('normal',0,1,1,Tfinal);
epsilonb1=random('normal',0,1,1,Tfinal);
epsilonm2=random('normal',0,1,1,Tfinal);
epsilonb2=random('normal',0,1,1,Tfinal);

if Ito == 0
    sigmam(:)=0;
    sigmab(:)=0;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Wages parameters
aw1 = aw*f2pb(1);
aw2 = aw*f2pb(2);
cw1 = cw*f2pb(1);
cw2 = cw*f2pb(2);
dw1 = dw*f2pb(1);
dw2 = dw*f2pb(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inclusion of energy concepts %Energy)
% Based on Kotecha & Diwekar (2010)
% - Energy producer compartment (EE)
% - Energy Resourse Pool compartment (ERP)

%Energy parameters
dEEHH       =	6.00E-08; %demand
zEEHH       =	5.68E-05; %demand
kEEHH       =	6.00E-08; %demand
mEEHH       =	4.00E-08; %demand
nEEHH       =	2.00E-08; %demand
aEE         =   aP1;      %price
bEE         =   bP1;      %price
cEE         =   5000*cP1; %price
gammaEEIS   =   1;        %(unit of energy / unit of IS)
gammaEEIRP  =   0.2;      %yield (mass/energy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Economic Mobility Factor
Wid  = 0.31;           %Ideal wage from stable simulation without EMF
%Wgid = Wid*numHH(1);   %Ideal global wage
Wgid = Wid*1000;   %Ideal global wage
psi  = 1*(0.75/IEI);   %Richness distribution factor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Greenhouse Gas Emissions based on:
%- https://www3.epa.gov/climatechange/ghgemissions/global.html and ref
%- Climate Change 2014 Mitigation of Climate Change Working Group III 
% Contribution to the Fifth Assessment Report of the Intergovernmental 
% Panel on Climate Change
%- https://www.co2.earth/ and http://www.esrl.noaa.gov/gmd/aggi/aggi.html     

% 1870-2015:    - CO2eq 300-485 ppm aprox, CO2ppm 290-400
%               - 545 GtC = 2000 GtCO2 (42% air, 28% ocean, 29% land)
%               - 840 GtCO2eq and 185 ppm ---> 0.22024 ppm/GtCO2eq
% 2015:         - 400 ppm CO2, 485 ppm CO2eq
%               - 10.1 GtC = 37 GtCO2eq aprox

ppmCO2eq   = 0.22024;  % factor to transform GtCO2eq to ppm in atmosfere
GtCO2eqStb = 37;       % GtCO2eq aprox emitted in 2015 

% Global emissions 2010:    - 25% Energy and heat production (EE)
%                           - 24% Agriculture forestry and other land use
%                                 (P1, H1 & productions)
%                           -  6% Buildings (numHH)
%                           - 14% Transportation (numHH)
%                           - 21% Industry (IS)
%                           - 10% Other energy (EE)

% Percentage of total emissions per stable value of yGHG
%            P1   H1    numHH P1prod H1prod ISprod EEprod P2    P3    RP
percCO2eq = [6    6     20    6      6      21     35     -24   -5    -28];
% negatives came from distribution percentages of emissions been equals for
% P1 and P2 %'s are equally weighted 

% Stable Value of variables producers of GHG (yGHG)
yGHGstb= [0.090108316273598     1.243569877687978   996 ...
          0.000770375203888207  0.001427446253809   0.006279712575167 ...
          0.012336856254033     5.247311054647068   1.112128665742525 ...
          22.415707968618005];

%gigatonnes of CO2equivalente emitted by mass unit
GtCO2eq= GtCO2eqStb.*(percCO2eq/100)./yGHGstb;   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%	Scaling of the coefficients in the demand functions.
%
% zP1HH=zP1HH*Kdemand; zH1HH=zH1HH*Kdemand; zISHH=zISHH*Kdemand;
% dP1HH=dP1HH*Kdemand; dH1HH=dH1HH*Kdemand; dISHH=dISHH*Kdemand;
% mP1HH=mP1HH*Kdemand; mH1HH=mH1HH*Kdemand; mISHH=mISHH*Kdemand;
% nP1HH=nP1HH*Kdemand; nH1HH=nH1HH*Kdemand; nISHH=nISHH*Kdemand;
% kP1HH=kP1HH*Kdemand; kH1HH=kH1HH*Kdemand; kISHH=kISHH*Kdemand;

%gP2H2=gP2H2*5;
%
%	Magnitude of coefficient change in demand function
%
% aISp = 0.3109;
% bISp = 0.0044;
% cISp = 0.3313;

% Cdemand=2;
Cdemand=1;
%
%	Base case resourse transfer values for compartment P2 and P3.
%
% gRPP1Base=gRPP1;
% gRPP2Base=gRPP2;
% gRPP3Base=gRPP3;
% 
% gRPP1rise=gRPP1Base*1;
% gRPP2rise=gRPP2Base*1;
% gRPP3rise=gRPP3Base*1;

% Define the parameters required due to the inclusion of Energy Producer
pEE = 0; % Price of Energy
fuelcost = 0;
wagecost = 0;
EEproduction = 0;%Energy Produced at Tfinal t
EEHHdemand = 0; %Amount of Energy demanded by the HH Compartment
EEHHmass = 0; %Amount of fuel that is used to produce energy to satisy the demand of HH
EEISdemand = 0; %Amount of Energy demand by the IS industry
FSIRP = 0; %Amount of mass used for producing the energy (for both humans and IS) in mass units
P1IRP=0;
tP1HH = 0;tH1HH = 0;tISHH = 0;tEEHH = 0;
 %zEEHH = 0;
 %dEEHH = 0;kEEHH = 0;mEEHH = 0;nEEHH = 0;
FS = 800;
bio_coeff = 1;

%Del programa de rodriguez  gamma = gammaEEIS gammaEEIRP = Energy_mass
% gammaEEIS   =   1;        %(unit of energy / unit of IS)
% gammaEEIRP  =   0.2;  %yield (mass/energy)
gamma = 1;
%Energy_mass = 0.2;

if power_plant == 1

%         if ns ==2
%             coef_cEE = 2000;
%         elseif ns == 3
%             coef_cEE = 3000;
%         elseif ns == 4
%             coef_cEE = 4000;
%         elseif ns == 5
%             coef_cEE = 5000;
%         elseif ns == 6
%             coef_cEE = 6000;
%         end
%     gamma = 1;
%     coef_cEE = 2000;
% 
%     The following three parameters are required to calculate the price
%     aEE = aP1;     bEE = bP1;     cEE = coef_cEE*cP1;
% 
%     The amount of energy demanded by IS to produce one single unit of IS
%     gamma = 1;
% 
%     The conversion factor between mass and energy
%     For every unit energy produced by EP, Energy_Mass units of mass is
%     consumed from the FS
%     Energy_Mass = 0.2;
% 
%     The initial amount of fuel in the FS compartment
%     FS = 800;
% 
% 
%     These three parameters will appear in the demand equation of P1,H1
%     and IS
%     tP1HH = kP1HH;
%     tH1HH = kH1HH;
%     tISHH = kISHH;
% 
%     These six paramters will appear in the demand equation of EE
%     correction = -1;
%     tEEHH = kP1HH;
%     zEEHH = zP1HH;
%     dEEHH = dP1HH;
%     kEEHH = kP1HH;
%     mEEHH = mP1HH;
%     nEEHH = nP1HH;
end

%	Coefficients and parameter values for the discharge fee part

if pISHH_var==0
for i=1:Tfinal
pISHHset(i)=1d-8;	% Discharge fee (used in pIS equation)
end
end

%Modification of the discharge fee
if pISHH_var==1
[outpISHH]=dischargefee;
pISHHset(i) = outpISHH;
%disp(pISHHset)
end

dp=1d14;		% Used in the calculation of pIS
dISp=1d6;   	% Used in the calculation of 

% if theta_var==0
% for i=1:Tfinal
%     thetaset(i) = theta;
% end
% end
% 
% if theta_var==1
% 	%Modification of theta
% [outtheta]=theta;
% thetaset(i) = outtheta;
% end
% 
% %khat
% if khat_var==0
% for i=1:Tfinal
%     khatset(i) = khat;
% end
% end
% 
% 	%Modification of khat
% if khat_var==1
% [outkhat]=khat;
% khatset(i) = outkhat; 
% end

%	Generating the profile of the parameters to model increased consumption case
%
% for i=1:Tfinal
% 
%     if (i==1)
% 
%         zP1HHbase=zP1HH; zH1HHbase=zH1HH; zISHHbase=zISHH; zEEHHbase = zEEHH;
%         dP1HHbase=dP1HH; dH1HHbase=dH1HH; dISHHbase=dISHH; dEEHHbase = dEEHH;
%         mP1HHbase=mP1HH; mH1HHbase=mH1HH; mISHHbase=mISHH; mEEHHbase = mEEHH;
%         nP1HHbase=nP1HH; nH1HHbase=nH1HH; nISHHbase=nISHH; nEEHHbase = nEEHH;
%         kP1HHbase=kP1HH; kH1HHbase=kH1HH; kISHHbase=kISHH; kEEHHbase = kEEHH;
%         tP1HHbase=tP1HH; tH1HHbase=tH1HH; tISHHbase=tISHH; tEEHHbase = tEEHH; %Added by KD
% 
%         zP1HHSet(i)=zP1HH; zH1HHSet(i)=zH1HH; zISHHSet(i)=zISHH; zEEHHSet(i)=zEEHH;
%         dP1HHSet(i)=dP1HH; dH1HHSet(i)=dH1HH; dISHHSet(i)=dISHH; dEEHHSet(i)=dEEHH;
%         mP1HHSet(i)=mP1HH; mH1HHSet(i)=mH1HH; mISHHSet(i)=mISHH; mEEHHSet(i)=mEEHH;
%         nP1HHSet(i)=nP1HH; nH1HHSet(i)=nH1HH; nISHHSet(i)=nISHH; nEEHHSet(i)=nEEHH;
%         kP1HHSet(i)=kP1HH; kH1HHSet(i)=kH1HH; kISHHSet(i)=kISHH; kEEHHSet(i)=kEEHH;
%         tP1HHSet(i)=tP1HH; tH1HHSet(i)=tH1HH; tISHHSet(i)=tISHH; tEEHHSet(i)=tEEHH;
% 
%     else
% 
%         zP1HHSet(i)=zP1HHSet(i-1)+zP1HHbase*Cdemand/Tfinal;
%         zH1HHSet(i)=zH1HHSet(i-1)+zH1HHbase*Cdemand/Tfinal;
%         zISHHSet(i)=zISHHSet(i-1)+zISHHbase*Cdemand/Tfinal;
%         zEEHHSet(i)=zEEHHSet(i-1)+zEEHHbase*Cdemand/Tfinal;
% 
%         dP1HHSet(i)=dP1HHSet(i-1)+dP1HHbase*Cdemand/Tfinal;
%         dH1HHSet(i)=dH1HHSet(i-1)+dH1HHbase*Cdemand/Tfinal;
%         dISHHSet(i)=dISHHSet(i-1)+dISHHbase*Cdemand/Tfinal;
%         dEEHHSet(i)=dEEHHSet(i-1)+dEEHHbase*Cdemand/Tfinal;
% 
%         mP1HHSet(i)=mP1HHSet(i-1)+mP1HHbase*Cdemand/Tfinal;
%         mH1HHSet(i)=mH1HHSet(i-1)+mH1HHbase*Cdemand/Tfinal;
%         mISHHSet(i)=mISHHSet(i-1)+mISHHbase*Cdemand/Tfinal;
%         mEEHHSet(i)=mEEHHSet(i-1)+mEEHHbase*Cdemand/Tfinal;
% 
%         nP1HHSet(i)=nP1HHSet(i-1)+nP1HHbase*Cdemand/Tfinal;
%         nH1HHSet(i)=nH1HHSet(i-1)+nH1HHbase*Cdemand/Tfinal;
%         nISHHSet(i)=nISHHSet(i-1)+nISHHbase*Cdemand/Tfinal;
%         nEEHHSet(i)=nEEHHSet(i-1)+nEEHHbase*Cdemand/Tfinal;
% 
%         kP1HHSet(i)=kP1HHSet(i-1)+kP1HHbase*Cdemand/Tfinal;
%         kH1HHSet(i)=kH1HHSet(i-1)+kH1HHbase*Cdemand/Tfinal;
%         kISHHSet(i)=kISHHSet(i-1)+kISHHbase*Cdemand/Tfinal;
%         kEEHHSet(i)=kEEHHSet(i-1)+kEEHHbase*Cdemand/Tfinal;
% 
%         tP1HHSet(i)=tP1HHSet(i-1)+tP1HHbase*Cdemand/Tfinal;
%         tH1HHSet(i)=tH1HHSet(i-1)+tH1HHbase*Cdemand/Tfinal;
%         tISHHSet(i)=tISHHSet(i-1)+tISHHbase*Cdemand/Tfinal;
%         tEEHHSet(i)=tEEHHSet(i-1)+tEEHHbase*Cdemand/Tfinal;
%     end
% end

%
%	Modification to make the code inside the DO loop independent 
%of past values of "i"
%
%if (PopulationExplosion==1)

%%% El valor de etaa modifica los resultados 
    %etaa=etaa*2;
%end
%

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%  %  %  %  Water compartment %  %  %  %  %

%Future feature 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%=======================================================================================
%	Starting the DO loop to carry out simulation
%=======================================================================================
%
for i=1:Tfinal
    
    % Weigth factors for total population variables     %2P)
    
      alfa1=numHH1(i)/(numHH1(i)+numHH2(i));
      alfa2=numHH2(i)/(numHH1(i)+numHH2(i));
      
     % Demographic params
    if Case == 1
        mHH1  = mHH + sigmam*epsilonm1(i)*sqrt(1); 
        mHH2  = mHH + sigmam*epsilonm2(i)*sqrt(1); 
        etaa1 = etaa;
        etaa2 = etaa*1.08;
    end
    if Case == 2
        mHH1  = 0.007505373 + sigmam*epsilonm1(i)*sqrt(1); 
        mHH2  = 0.008765846 + sigmam*epsilonm2(i)*sqrt(1); 
        etaa1 = 24/1000;
        etaa2 = 14.4/1000;
    end
    if Case == 3
        mHH1  = (-3.25*log((i+(k-1)*Tfinal)+55)+20.536)/1000 + sigmam*epsilonm1(i)*sqrt(1); 
        mHH2  = (-0.0103*((i+(k-1)*Tfinal)+55)+9.4329)/1000 + sigmam*epsilonm2(i)*sqrt(1); 
        etaa1 = (41.975*exp(-0.013*((i+(k-1)*Tfinal)+55))+3)/1000;
        etaa2 = (20.831*exp(-0.012*((i+(k-1)*Tfinal)+55))+3)/1000;        
    end
    if Case == 4
        mHH1  = (-3.25*log(i+(k-1)*Tfinal)+20.536)/1000 + sigmam*epsilonm1(i)*sqrt(1); 
        mHH2  = (-0.0103*(i+(k-1)*Tfinal)+9.4329)/1000 + sigmam*epsilonm2(i)*sqrt(1); 
        etaa1 = (41.975*exp(-0.013*(i+(k-1)*Tfinal))+3)/1000;
        etaa2 = (20.831*exp(-0.012*(i+(k-1)*Tfinal))+3)/1000;
    end
    
    mHH   = mHH1*alfa1 + mHH2*alfa2;
    etab1 = etab;
    etab2 = etab;
    
   %disp(theta)
    
    
%      if (i<=Tfinal)
%             theta(i) = thetaset(i);
%     end   
% 
%     if (i<=Tfinal)
%             khat(i) = khatset(i);
%     end  
    
%     Q1=1+Am*sin(2*pi*(i-1)/period-pi/2);
%     Q2=1+Am*5*sin(2*pi*(i-1)/period-pi/2);
%     gRPP1=gRPP1Base*Q1;
%     gRPP2=gRPP2Base*Q1;
%     gRPP3=gRPP3Base*Q2;
    
%     vectorgRPP3(i)=gRPP3;

    % !======================================================================
    % !	Modification of the human mortality rate and birth rate to simulate
    % !	case where the population is rising
    % !
    % !======================================================================
    %if (PopulationExplosion==1)

%         if (i<=Tfinal)
%             %etab=etabSet(i);
%         end
% 
%         if (i<=Tfinal)
%             %mHH=mHHset(i);
%             
%         end
        
    %end

    % !======================================================================
    % !======================================================================
    % !
    % !	Modification to simulate increased per capita consumption by humans
    % !	when the population is held constant
    % !
     
%     if (ConsumptionIncrease==1)& 3640<i
%         j = round(i/52);
%         param = (1.0137)^j;
%         zP1HH=param*zP1HHSet(i)/300;
%         zH1HH=param*zH1HHSet(i)/300;
%         zISHH=param*zISHHSet(i)/300;
%         zEEHH=param*zEEHHSet(i)/300;
% 
%         dP1HH=param*dP1HHSet(i)/300;
%         dH1HH=param*dH1HHSet(i)/300;
%         dISHH=param*dISHHSet(i)/300;
%         dEEHH=param*dEEHHSet(i)/300;
% 
%         mP1HH=param*mP1HHSet(i)/300;
%         mH1HH=param*mH1HHSet(i)/300;
%         mISHH=param*mISHHSet(i)/300;
%         mEEHH=param*mEEHHSet(i)/300;
% 
%         nP1HH=param*nP1HHSet(i)/300;
%         nH1HH=param*nH1HHSet(i)/300;
%         nISHH=param*nISHHSet(i)/300;
%         nEEHH=param*nEEHHSet(i)/300;
% 
%         kP1HH=param*kP1HHSet(i)/300;
%         kH1HH=param*kH1HHSet(i)/300;
%         kISHH=param*kISHHSet(i)/300;
%         kEEHH=param*kEEHHSet(i)/300;
% 
%         tP1HH=param*tP1HHSet(i)/300;
%         tH1HH=param*tH1HHSet(i)/300;
%         tISHH=param*tISHHSet(i)/300;
%         tEEHH=param*tEEHHSet(i)/300;
%      else
%         zP1HH=zP1HHbase/300;
%         zH1HH=zH1HHbase/300;
%         zISHH=zISHHbase/300;
%         zEEHH=zEEHHbase/300;
% 
%         dP1HH=dP1HHbase/300;
%         dH1HH=dH1HHbase/300;
%         dISHH=dISHHbase/300;
%         dEEHH=dEEHHbase/300;
% 
%         mP1HH=mP1HHbase/300;
%         mH1HH=mH1HHbase/300;
%         mISHH=mISHHbase/300;
%         mEEHH=mEEHHbase/300;
% 
% 
%         nP1HH=nP1HHbase/300;
%         nH1HH=nH1HHbase/300;
%         nISHH=nISHHbase/300;
%         nEEHH=nEEHHbase/300;
% 
%         kP1HH=kP1HHbase/300;
%         kH1HH=kH1HHbase/300;
%         kISHH=kISHHbase/300;
%         kEEHH=kEEHHbase/300;
% 
%         tP1HH=tP1HHbase/300;
%         tH1HH=tH1HHbase/300;
%         tISHH=tISHHbase/300;
%         tEEHH=tEEHHbase/300;
%      end
    %end
    
 
    
    %===================================================================
    %%       Economics
    %===================================================================
    %
    %	Industrial sector sets the wage rate
%     disp(lambda);
%     disp(dw)
% Modificado: Estratificacion
  W1 = max(aw1 + cw1*(ISbar-(ISmassdeficit(i)+ISmass(i)))/(theta+lambda)...
        -dw1*numHH(i),0);                                            %2P-b)
  W2 = max(aw2 + cw2*(ISbar-(ISmassdeficit(i)+ISmass(i)))/(theta+lambda)...
        -dw2*numHH(i),0);                                            %2P-b)
  W  = W1*alfa1 + W2*alfa2;
   
% Modificado Economic mobility factor 
% Economic Mobility Factor
    EMF = psi*((W*numHH(i)-Wgid)/Wgid);
    if EMF*numHH(i) > numHH1(i)
        EMF = numHH1(i)/numHH(i);
    end
    if abs(EMF*numHH(i)) > numHH2(i)
        EMF = -numHH2(i)/numHH(i);
    end
    
    %
    %	Based on the Wage, industries set prices and their production (how
    %	much they would like to produce to maximize their profits based on
    %	their assumption as to what the demand for their products will be).
    %	Here, a linear functional form is assumed for the supply.
    %
     if P1(i) == 0
        pP1 = 0;
        P1production = 0;
    else
        pP1 = max(aP1 + bP1*W - cP1*((P1massdeficit(i)+P1(i))-P1bar),0);
         P1aux = aP1p - bP1p*W + ...
             cP1p*((P1massdeficit(i)+P1(i))-P1bar);
         P1production = max(P1aux,0);
         
      disp('aP1p')
      disp(aP1p)
      disp('bP1p')
      disp(bP1p)
      disp('W')
      disp(W)
      disp('cP1p')
      disp(cP1p)
      disp('P1massdeficit')
      disp(P1massdeficit(i))
      disp('P1')
      disp(P1(i))
     disp('P1bar')
      disp(P1bar)
    disp('P1aux')
    disp(P1aux)
    disp('P1production')
    disp(P1production)
    
  
    end



    if H1(i)==0
        pH1=0;
        H1production=0;
    else
        pH1=max(aH1+bH1*W-cH1*((H1massdeficit(i)+H1(i))-H1bar),0);
        H1production=max(aH1p-bH1p*W-cH1p*((H1massdeficit(i)+H1(i))...
            -H1bar),0);
    end
    
   %if (Modelselection==1)
    
%         if (i<=Tfinal)
%             pISHH(i) = pISHHset(i);
%         end     
%         %	Computing the absolute value of pIS.
%                
%         %ISHHDEMtati(i)=dISHH*dp*pISHH(i)*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-mISHH*dp*pH1*pISHH(i)*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-kISHH*dp*pISHH(i)*pP1*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+dISHH*dp*pISHH(i)*zH1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+mISHH*dp*pISHH(i)*pH1*zH1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+kISHH*dp*pISHH(i)*pP1*zH1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-dH1HH*dp*pISHH(i)*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-dP1HH*dp*pISHH(i)*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+mH1HH*dp*pISHH(i)*pH1*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-mP1HH*dp*pISHH(i)*pH1*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-kH1HH*dp*pISHH(i)*pP1*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+kP1HH*dp*pISHH(i)*pP1*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+dISHH*dp*pISHH(i)*zP1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+mISHH*dp*pISHH(i)*pH1*zP1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+kISHH*dp*pISHH(i)*pP1*zP1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH))/(1-nISHH*dp*pISHH(i)*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+nISHH*dp*pISHH(i)*zH1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+nH1HH*dp*pISHH(i)*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+nP1HH*dp*pISHH(i)*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+nISHH*dp*pISHH(i)*zP1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH);
%         pISbar=(aIS-cIS*((ISmassdeficit(i)+ISmass(i))-ISbar)/(lambda+theta(i))+bIS*W-dISHH*dp*pISHH(i)*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-mISHH*dp*pH1*pISHH(i)*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-kISHH*dp*pISHH(i)*pP1*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+dISHH*dp*pISHH(i)*zH1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+mISHH*dp*pISHH(i)*pH1*zH1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+kISHH*dp*pISHH(i)*pP1*zH1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-dH1HH*dp*pISHH(i)*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-dP1HH*dp*pISHH(i)*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+mH1HH*dp*pISHH(i)*pH1*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-mP1HH*dp*pISHH(i)*pH1*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)-kH1HH*dp*pISHH(i)*pP1*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+kP1HH*dp*pISHH(i)*pP1*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+dISHH*dp*pISHH(i)*zP1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+mISHH*dp*pISHH(i)*pH1*zP1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+kISHH*dp*pISHH(i)*pP1*zP1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH))/(1-nISHH*dp*pISHH(i)*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+nISHH*dp*pISHH(i)*zH1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+nH1HH*dp*pISHH(i)*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+nP1HH*dp*pISHH(i)*zISHH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH)+nISHH*dp*pISHH(i)*zP1HH*(lambda+theta(i))/(-1+zH1HH+zISHH+zP1HH));
%          %
%         %	Using the absolute value to decide the actual value to be used using max function
%         
%         pIS=max(pISbar,0);
   %else
        
    
        if HH(i)==0 || numHH(i)<20
            pIS=0;
            ISproduction=0;
            
        else 
          pIS = max(aIS + bIS*W + ...
            cIS*(ISbar-(ISmassdeficit(i)+ISmass(i)))/(theta+lambda),0);
        ISproduction = max(aISp - bISp*W + ...
            cISp*(ISbar-(ISmassdeficit(i)+ISmass(i)))/(theta+lambda),0);  
        end
             
   %end
   
   % Fuera del if   % Energy de Rodriguez 
   if HH(i) == 0 || numHH(i) <20                                 % Energy)
        pEE = 0;
    else
        pEE = max(aEE + bEE*W + (cEE/ERP(i)),0);
    end
    
    %  %% II. Demands 
    %	Next, how much each industry is going to demand of its
    %	suppliers is calculated. The following are in units of mass, unless
    %	otherwise noted
    %
    P1H1demandmin=0;
    if H1(i)==0 || HH(i)==0 || numHH(i)<20
        P1H1demand=0;
        P2H1=0;
    else
        P1H1demand=max(dP1H1-eP1H1*W-fP1H1*pP1-gP1H1*((H1massdeficit(i)...
            +H1(i))-H1bar),P1H1demandmin);
        P2H1=khat;
    end

    %
    %	expressions for P1HH, H1HH and ISHH reflect constraint on human
    %	spending.
    %	These are per capita, so must be multiplied by population later
    %
    a = f_main_model_percap_demand(zP1HH, zH1HH, zISHH, zEEHH, ...
    dP1HH, dH1HH, dISHH, dEEHH, ...
    mP1HH, mH1HH, mISHH, mEEHH, ...
    nP1HH, nH1HH, nISHH, nEEHH, ...
    kP1HH, kH1HH, kISHH, kEEHH, ...
    tP1HH, tH1HH, tISHH, tEEHH, ...
    pP1, pH1, pIS, pEE, power_plant);

%     P1HHdemand = a(1);
%     H1HHdemand = a(2);
%     ISHHdemand = a(3);
    EEHHpercapitademand = a(4);



    if HH(i)==0 || numHH(i)<20
        ISHHdemand=0;
        P1HHdemand=0;
        H1HHdemand=0;
        EEHHdemand = 0;
        if power_plant == 1
%             EEHHpercapitademand = 0;
        end
        
    else 
      P1HHdemand = max((1/(-1+zP1HH+zH1HH+zISHH))*...
            (-dP1HH-mP1HH*pH1-nP1HH*pIS+kP1HH*pP1-dH1HH*zP1HH-...
            dISHH*zP1HH+mH1HH*pH1*zP1HH-mISHH*pH1*zP1HH-nH1HH*pIS*zP1HH+...
            nISHH*pIS*zP1HH-kH1HH*pP1*zP1HH-kISHH*pP1*zP1HH+dP1HH*zH1HH+...
            mP1HH*pH1*zH1HH+nP1HH*pIS*zH1HH-kP1HH*pP1*zH1HH+dP1HH*zISHH+...
            mP1HH*pH1*zISHH+nP1HH*pIS*zISHH-kP1HH*pP1*zISHH),0)*50;
        
        H1HHdemand = max((1/(-1+zP1HH+zH1HH+zISHH))*...
            (-dH1HH+mH1HH*pH1-nH1HH*pIS-kH1HH*pP1+dH1HH*zP1HH-...
            mH1HH*pH1*zP1HH+nH1HH*pIS*zP1HH+kH1HH*pP1*zP1HH-dISHH*zH1HH-...
            dP1HH*zH1HH-mISHH*pH1*zH1HH-mP1HH*pH1*zH1HH+nISHH*pIS*zH1HH-...
            nP1HH*pIS*zH1HH-kISHH*pP1*zH1HH+kP1HH*pP1*zH1HH+dH1HH*zISHH-...
            mH1HH*pH1*zISHH+nH1HH*pIS*zISHH+kH1HH*pP1*zISHH),0)*50;

        ISHHdemand = max(-((dISHH+mISHH*pH1-nISHH*pIS+kISHH*pP1-...
            dISHH*zP1HH-mISHH*pH1*zP1HH+nISHH*pIS*zP1HH-kISHH*pP1*zP1HH-...
            dISHH*zH1HH-mISHH*pH1*zH1HH+nISHH*pIS*zH1HH-kISHH*pP1*zH1HH+...
            dH1HH*zISHH+dP1HH*zISHH-mH1HH*pH1*zISHH+mP1HH*pH1*zISHH+...
            nH1HH*pIS*zISHH+nP1HH*pIS*zISHH+kH1HH*pP1*zISHH-...
            kP1HH*pP1*zISHH)/(-1+zP1HH+zH1HH+zISHH)),0)*50;
                
        EEHHdemand = max(-((dEEHH+mEEHH*pH1-nEEHH*pEE+kEEHH*pP1-...          % En)
            dEEHH*zP1HH-mEEHH*pH1*zP1HH+nEEHH*pEE*zP1HH-kEEHH*pP1*zP1HH-...
            dEEHH*zH1HH-mEEHH*pH1*zH1HH+nEEHH*pEE*zH1HH-kEEHH*pP1*zH1HH+...
            dH1HH*zEEHH+dP1HH*zEEHH-mH1HH*pH1*zEEHH+mP1HH*pH1*zEEHH+...
            nH1HH*pEE*zEEHH+nP1HH*pEE*zEEHH+kH1HH*pP1*zEEHH-...
            kP1HH*pP1*zEEHH)/(-1+zP1HH+zH1HH+zEEHH)),0)*50;   
    end

%%%%%%%%%% Agregar parametros de estratificacion 
        P1HHdemand1 = P1HHdemand*f2pc(1);     %2P-c)
        P1HHdemand2 = P1HHdemand*f2pc(2);     %2P-c)
        H1HHdemand1 = H1HHdemand*f2pc(1);     %2P-c)
        H1HHdemand2 = H1HHdemand*f2pc(2);     %2P-c)
        ISHHdemand1 = ISHHdemand*f2pd(1);     %2P-d)
        ISHHdemand2 = ISHHdemand*f2pd(2);     %2P-d)
        EEHHdemand1 = EEHHdemand*f2pd(1);     %2P-d)              % Energy)        
        EEHHdemand2 = EEHHdemand*f2pd(2);     %2P-d)              % Energy)
       
        P1HHdemand = (P1HHdemand1*alfa1 + P1HHdemand2*alfa2);
        H1HHdemand = (H1HHdemand1*alfa1 + H1HHdemand2*alfa2);
        ISHHdemand = (ISHHdemand1*alfa1 + ISHHdemand2*alfa2);
        EEHHdemand = (EEHHdemand1*alfa1 + EEHHdemand2*alfa2);     % Energy) 
        
     
    
%     if (Modelselection==1)
%         %
%         %	Using the demand value to compute the production target which
%         %	includes the discharge fee.
%         
%         ISproduction=max(aISp-bISp*W+cISp*(ISbar-(ISmassdeficit(i)...
%             +ISmass(i)))/(theta(i)+lambda)-dISp*ISHHdemand,0);
%     end
    
       % Energy demands                                           % Energy)
    EEHHtotdemand = EEHHdemand*numHH(i);
    EEISdemand = ISproduction*gamma;
    %
    %	The flows that involve labor to keep the wild
    %	from taking domestics, namely P1H2 and H1C2 must  be calculated.
    %
    if P1(i)==0 || H2(i)==0 
        P1H2=0;
    else
        P1H2=max((gRPP1*P1(i)*RP(i)-mP1*P1(i)-P1production),0);
    end

      if H1(i)==0 || C1(i)==0
        H1C1=0;
    else
        H1C1=max((P1H1demand+P2H1-mH1*H1(i)-H1production),0);
      end
    
    if HH(i)==0 || numHH(i)<20
        P1H2=gP1H2*P1(i)*H2(i);
        H1C1=gH1C1*H1(i)*C1(i);
    end

  

    
    %
    %	the ISproduction is checked again below as well, after checks for
    %	realistic mass transfers
    %
%     if HH(i)==0 || numHH(i)<20
%         ISproduction=0.0;
%     end

    P1ISdemand=theta*ISproduction;
    RPISdemand=lambda*ISproduction;
    
    %
    %	determine the total demand of energy, price of energy and flow of
    %	mass from energy source to IRP
    %
    %
    if power_plant ==1
        
%         if ns == 2
%             percent = 0.3;
%         elseif ns == 3
%             percent = 0.5;
%         elseif ns == 4
%             percent = 0.7;
%         end
        
%         percent = 0.3;
% 
%        
%         EEHHdemand = EEHHpercapitademand * numHH(i);
%         EEISdemand = gamma * ISproduction;
%         EEdemand = EEHHdemand + EEISdemand;

        if bioenergy(i) == 1
%             if P1(i) > 0
%                 bioenergy_reqd = percent*EEdemand;          % Amount of bioenergy as a fraction fo total energy
%                 biofuel_reqd = bio_coeff * bioenergy_reqd; % Amount of P1 required to produce bioenergy
%                 %                 P1(i)
%                 %                 biofuel_reqd
%                 %                 pause
% 
%                 if biofuel_reqd > P1(i)  % if the amount of P1 is less than that reqd, use all available P1 to produce max amt of energy
%                     biofuel_reqd = P1(i);
%                     bioenergy_supplied = biofuel_reqd/bio_coeff;    %Amount of bioenergy produced with the available amount of P1
%                     P1(i) = 0; %Since all P1 was used as a biofuel there is no P1
%                     conve_energy = EEdemand - bioenergy_supplied;
%                     P1IRP = P1(i);     % All of the P1 used for bioenergy essentially goes to IRP
%                 else
%                     P1(i) = P1(i) - biofuel_reqd; %Amount of P1 available after producing the bioenergy
%                     conve_energy = EEdemand - bioenergy_reqd; %Amount of conventional energy required
%                     bioenergy_supplied = bioenergy_reqd;
%                     P1IRP = biofuel_reqd;
%                 end
% % P1RP

%             else
%                 P1IRP = 0;
%                 conve_energy = EEdemand;
%                 bioenergy_supplied = 0;
%             end
%         else
%             P1IRP = 0;
%             conve_energy = EEdemand;
%             bioenergy_supplied = 0;
        end

 
%         if FS(i) >0
%             FSIRP = conve_energy * Energy_Mass;
%             pEE = max(aEE + bEE*W + (cEE/FS(i)),0);
%             fuelcost = cEE/FS(i);
%             wagecost = bEE*W;
% 
%             if ((FS(i)-FSIRP)<0)
%                 FSIRP = FS(i);
%                 FS(i) = 0;
%             %else
%             %    FS = FS - FSIRP;
%             end
%             EEHHmass = EEHHdemand * Energy_Mass;
%         else
%             pEE = 0;
%             fuelcost = 0;
%             wagecost = 0;
%             FSIRP = 0;
%             EEHHmass = 0;
%         end
%         EEproduction = conve_energy;
%     else
%         FSIRP = 0;
    end

%        EEdemand = EEHHdemand + EEISdemand;
%        P1IRP = 0;
%        conve_energy = EEdemand;
        bioenergy_supplied = 0;
        EEdemand=0;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% %% III. Calculate all but next state, according to system equations.
    %	Calculate next state, according to system equations
    %	Here, check to see that these transfers won't violate conservation of mass
    %
%GDP
    
    %	P1
    %
    P1RP=max(mP1*P1(i),0);
    RPP1=max(gRPP1*P1(i)*RP(i),0);
    P1H1=P1H1demand;
    P1IS=P1ISdemand;
    P1HH=P1HHdemand*numHH(i);
 %if statement to deal with going negative
    if P1(i)+RPP1-P1RP-P1H2-P1H1-P1HH-P1IS<0
        if P1(i)+RPP1-P1RP<0
            P1RP=P1(i)+RPP1;
            P1H2=0;
            P1H1=0;
            P1HH=0;
            P1IS=0;
        else
            totP1demand=P1H2+P1H1+P1HH+P1IS;
            P1avail=P1(i)+RPP1-P1RP;
            P1H2=P1avail*P1H2/totP1demand;
            P1H1=P1avail*P1H1/totP1demand;
            P1HH=P1avail*P1HH/totP1demand;
            P1IS=P1avail-(P1H2+P1H1+P1HH);
        end
    else
        if P1massdeficit(i)<0 	%if there is an accumulated deficit 
            %between demand for P1 try to make this up if there is extra stock
            P1surplus=min(P1(i)+RPP1-P1RP-P1H2-P1H1-P1HH-P1IS,-P1massdeficit(i)); %only what you need to make up deficit
            P1H1=P1H1+P1surplus*P1H1massdeficit(i)/P1massdeficit(i);
            P1IS=P1IS+P1surplus*P1ISmassdeficit(i)/P1massdeficit(i);
            P1HH=P1HH+P1surplus*P1HHmassdeficit(i)/P1massdeficit(i);
        end
    end


    %
    %	P2
    %
    P2H2=gP2H2*P2(i)*H2(i);
    P2H3=gP2H3*P2(i)*H3(i);
    P2RP=max(mP2*P2(i),0);
    RPP2=max(gRPP2*RP(i)*P2(i),0);
    IRPP2=max(rIRPP2*P2(i)*IRP(i),0);
    P3RP=max(mP3*P3(i),0);
    P3H3=gP3H3*P3(i)*H3(i);
    RPP3=max(gRPP3*RP(i)*P3(i),0);
    IRPP3=max(rIRPP3*P3(i)*IRP(i),0);
    if IRP(i)<=0
        IRPP2=0;
        IRPP3=0;
    elseif (IRP(i)-IRPP2-IRPP3-max(IRP(i)*mIRPRP,0)+RPIRP <0)

        if (P2(i)~=0)
            IRPP2=rIRPP2*(IRP(i)-max(IRP(i)*mIRPRP,0)+RPIRP)/(rIRPP2+rIRPP3);
        end

        if (P3(i)~=0)
            IRPP3=rIRPP3*(IRP(i)-max(IRP(i)*mIRPRP,0)+RPIRP)/(rIRPP2+rIRPP3);
        end

    end


    if P2(i)+IRPP2+RPP2-P2RP-P2H2-P2H3-P2H1<belownoreproduction
        if (P2(i)+IRPP2+RPP2-P2RP<belownoreproduction)
            P2RP=P2(i)+IRPP2+RPP2;
            P2H2=0;
            P2H3=0;
            P2H1=0;
        else
            totP2demand=P2H2+P2H3+P2H1;
            P2avail=P2(i)+IRPP2+RPP2-P2RP;
            P2H2=P2H2*P2avail/totP2demand;
            P2H3=P2H3*P2avail/totP2demand;
            P2H1=P2avail-(P2H2+P2H3);
        end
    end

    %
    %	P3
    %
    if (P3(i)+IRPP3+RPP3-P3RP-P3H3<belownoreproduction)
        if (P3(i)+IRPP3+RPP3-P3RP<belownoreproduction)
            P3RP=P3(i)+IRPP3+RPP3;
            P3H3=0;
        else
            totP3demand=P3H3;
            P3avail=P3(i)+IRPP3+RPP3-P3RP;
            P3H3=P3H3*P3avail/totP3demand;
        end
    end

    %
    %	H1
    %
    H1RP=max(mH1*H1(i),0);
    H1HH=H1HHdemand*numHH(i);
    if (H1(i)+P1H1+P2H1-H1RP-H1C1-H1HH<0)
        if (H1(i)+P1H1+P2H1-H1RP<0)
            H1RP=H1(i)+P1H1+P2H1;
            H1C1=0;
            H1HH=0;
        else
            totH1demand=H1C1+H1HH;
            H1avail=H1(i)+P1H1+P2H1-H1RP;
            H1C1=H1avail*H1C1/totH1demand;
            H1HH=H1avail-H1C1;
        end
    else
        if H1massdeficit(i)<0
            H1HH=H1HH+min(H1(i)+P1H1+P2H1-H1RP-H1C1-H1HH,-H1massdeficit(i));		%only what you need to make up deficit
        end
    end
    %
    %	H2
    %
    H2C1=gH2C1*C1(i)*H2(i);
    H2C2=gH2C2*H2(i)*C2(i);
    H2RP=max(mH2*H2(i),0);
    if (H2(i)+P1H2+P2H2-H2RP-H2C1-H2C2<belownoreproduction)
        if (H2(i)+P1H2+P2H2-H2RP<belownoreproduction)
            H2RP=H2(i)+P1H2+P2H2;
            H2C1=0;
            H2C2=0;
        else
            totH2demand=H2C1+H2C2;
            H2avail=H2(i)+P1H2+P2H2-H2RP;
            H2C1=H2C1*H2avail/totH2demand;
            H2C2=H2avail-H2C1;
        end
    end

    %
    %	H3
    %
    H3RP=max(mH3*H3(i),0);
    H3C2=gH3C2*H3(i)*C2(i);
    if (H3(i)+P2H3+P3H3-H3RP-H3C2<belownoreproduction)
        if (H3(i)+P2H3+P3H3-H3RP<belownoreproduction)
            H3RP=H3(i)+P2H3+P3H3;
            H3C2=0;
        else
            totH3demand=H3C2;
            H3avail=H3(i)+P2H3+P3H3-H3RP;
            H3C2=H3C2*H3avail/totH3demand;
        end
    end

    %
    %	C1
    %
    C1RP=max(mC1*C1(i),0);
    if (C1(i)+H1C1+H2C1-C1RP<belownoreproduction)
        C1RP=C1(i)+H1C1+H2C1;
    end

    %
    %	C2
    %
    C2RP=max(mC2*C2(i),0);
    if (C2(i)+H2C2+H3C2-C2RP<belownoreproduction)
        C2RP=C2(i)+H2C2+H3C2;
    end

    %
    %	HH
    %
    HHRP=ceil(mHH*numHH(i))*percapmass(i);
    if HHRP > (HH(i) + P1HH + H1HH)
        HHRP = (HH(i) + P1HH + H1HH);
    end

    %
    %	RP
    IRPRP=max(IRP(i)*mIRPRP,0);
    RPIS=min(lambda*P1IS/theta,RPISdemand);
    stockRP=RP(i)+P1RP+P2RP+P3RP+H1RP+H2RP+H3RP+C1RP+C2RP+HHRP+IRPRP;

    if (stockRP<0)
        stockRP=0;
    end

    if (stockRP-(RPP1+RPP2+RPP3)-RPIRP-RPIS<=0 && RPIRP==0)
        RPdemand=RPP1+RPP2+RPP3+RPISdemand;
        RPP1=RPP1*stockRP/RPdemand;
        RPP2=RPP2*stockRP/RPdemand;
        RPP3=RPP3*stockRP/RPdemand;
        if (RPIS ~=0)
            RPIS=stockRP-(RPP1+RPP2+RPP3);
        else
            RPIS=0;
        end
    end
    P1IS=min(theta*RPIS/lambda,P1IS);
    
    %%%% Añadido ERP 
    
     % ERP                                                          % Energy)         
    if ERP(i) > 0
   
        EEproduction = EEHHtotdemand + EEISdemand;
        EEHHmass = EEHHtotdemand*gammaEEIRP;
        ERPEE = EEproduction*gammaEEIRP;
        if ((ERP(i) - ERPEE)<0)
            ERPEE = ERP(i);
            ERP(i) = 0;
        end
        EEIRP = ERPEE;
    else
        pEE = 0;
        EEproduction = 0;
        EEHHmass = 0;
        ERPIRP = 0;
        EEHHtotdemand = 0;
        EEISdemand = 0;
        EEHHdemand = 0;
    end

    %====================================================================
    %	Make checks again, to balance flows
    %====================================================================
    %
    %	P1
    %
    if (P1(i)+RPP1-P1RP-P1H2-P1H1-P1HH-P1IS<0)
        if (P1(i)+RPP1-P1RP<0)
            P1RP=P1(i)+RPP1;
            P1H2=0;
            P1H1=0;
            P1HH=0;
            P1IS=0;
        else
            totP1demand=P1H2+P1H1+P1HH+P1IS;
            P1avail=P1(i)+RPP1-P1RP;
            P1H2=P1avail*P1H2/totP1demand;
            P1H1=P1avail*P1H1/totP1demand;
            P1HH=P1avail*P1HH/totP1demand;
            P1IS=P1avail-(P1H2+P1H1+P1HH);
        end
    else
        if P1massdeficit(i)<0
            % demand for P1 try to make this up if there is extra stock
            P1surplus=min(P1(i)+RPP1-P1RP-P1H2-P1H1-P1HH-P1IS,-P1massdeficit(i));
            P1H1=P1H1+P1surplus*P1H1massdeficit(i)/P1massdeficit(i);
            P1IS=P1IS+P1surplus*P1ISmassdeficit(i)/P1massdeficit(i);
            P1HH=P1HH+P1surplus*P1HHmassdeficit(i)/P1massdeficit(i);
        end
    end



    %
    %	P2
    %

    if IRP(i)<=0
        IRPP2=0;
        IRPP3=0;
    elseif (IRP(i)-IRPP2-IRPP3-max(IRP(i)*mIRPRP,0) + RPIRP<0)
        if (P2(i)~=0)
            IRPP2=rIRPP2*(IRP(i)-max(IRP(i)*mIRPRP,0) + RPIRP)/(rIRPP2+rIRPP3);
        end
        if (P3(i)~=0)
            IRPP3=rIRPP3*(IRP(i)-max(IRP(i)*mIRPRP,0) + RPIRP)/(rIRPP2+rIRPP3);
        end
    end


    if (P2(i)+IRPP2+RPP2-P2RP-P2H2-P2H3-P2H1<belownoreproduction)
        if (P2(i)+IRPP2+RPP2-P2RP<belownoreproduction)
            P2RP=P2(i)+IRPP2+RPP2;
            P2H2=0;P2H3=0;P2H1=0;
        else
            totP2demand=P2H2+P2H3+P2H1;
            P2avail=P2(i)+IRPP2+RPP2-P2RP;
            P2H2=P2H2*P2avail/totP2demand;
            P2H3=P2H3*P2avail/totP2demand;
            P2H1=P2avail-(P2H2+P2H3);
        end
    end

    %
    %	P3
    %
    if (P3(i)+IRPP3+RPP3-P3RP-P3H3<belownoreproduction)
        if (P3(i)+IRPP3+RPP3-P3RP<belownoreproduction)
            P3RP=P3(i)+IRPP3+RPP3;
            P3H3=0;
        else
            totP3demand=P3H3;
            P3avail=P3(i)+IRPP3+RPP3-P3RP;
            P3H3=P3H3*P3avail/totP3demand;
        end
    end

    %
    %	H1
    %
    if (H1(i)+P1H1+P2H1-H1RP-H1C1-H1HH<0)
        if (H1(i)+P1H1+P2H1-H1RP<0)
            H1RP=H1(i)+P1H1+P2H1;
            H1C1=0;
            H1HH=0;
        else
            totH1demand=H1C1+H1HH;
            H1avail=H1(i)+P1H1+P2H1-H1RP;
            H1C1=H1avail*H1C1/totH1demand;
            H1HH=H1avail-H1C1;
        end
    else
        if (H1massdeficit(i)<0)
            H1HH=H1HH+min(H1(i)+P1H1+P2H1-H1RP-H1C1-H1HH,-H1massdeficit(i));
        end
    end

    %
    %	H2
    %
    if (H2(i)+P1H2+P2H2-H2RP-H2C1-H2C2<belownoreproduction)
        if (H2(i)+P1H2+P2H2-H2RP<belownoreproduction)
            H2RP=H2(i)+P1H2+P2H2;
            H2C1=0;
            H2C2=0;
        else
            totH2demand=H2C1+H2C2;
            H2avail=H2(i)+P1H2+P2H2-H2RP;
            H2C1=H2C1*H2avail/totH2demand;
            H2C2=H2avail-H2C1;
        end
    end

    %
    %	H3
    %
    if (H3(i)+P2H3+P3H3-H3RP-H3C2<belownoreproduction)
        if (H3(i)+P2H3+P3H3-H3RP<belownoreproduction)
            H3RP=H3(i)+P2H3+P3H3;
            H3C2=0;
        else
            totH3demand=H3C2;
            H3avail=H3(i)+P2H3+P3H3-H3RP;
            H3C2=H3C2*H3avail/totH3demand;
        end
    end

    %
    %	C1
    %
    if (C1(i)+H1C1+H2C1-C1RP<belownoreproduction)
        C1RP=C1(i)+H1C1+H2C1;
    end

    %
    %	C2
    %
    if (C2(i)+H2C2+H3C2-C2RP<belownoreproduction)
        C2RP=C2(i)+H2C2+H3C2;
    end
    
  %%% Añadido Rodriguez 
  
      % HH 
    HHRP = ceil(mHH*numHH(i))*percapmass(i);
    if HHRP > (HH(i) + P1HH + H1HH)
        HHRP = (HH(i) + P1HH + H1HH);
    end
    
    %% IV. Demographic
    ISHHflow=max(0,(theta+lambda)*ISHHdemand*numHH(i));
    ISIRP=ISHHflow;
    if (ISmass(i)+P1IS+RPIS-ISIRP<=0)
        ISIRP=ISmass(i)+P1IS+RPIS;
    else
        if (ISmassdeficit(i)<0 & numHH(i)>=2) 	% if there is an accumulated deficit
            % between demand for IS by the HH and IS
            %supplied, try to make this up if there is extra stock
            ISIRP=ISIRP+min(ISmass(i)+P1IS+RPIS-ISIRP,-ISmassdeficit(i));
            %only what you need to make up deficit
        end
    end

    if ((P1HH+H1HH+ISIRP+EEHHmass)==0)
        weightedprice=0;
        percapbirths=0;
        percapbirths1 = 0;
        percapbirths2 = 0;
    elseif ((pP1*P1HH+pH1*H1HH+pIS*ISIRP+pEE*EEHHmass)==0)
        weightedprice=0;
        percapbirths=0;
        percapbirths1 = 0;
        percapbirths2 = 0;
    else
        weightedprice=(pP1*P1HH+pH1*H1HH+pIS*ISIRP+pEE*EEHHmass)/...
            (P1HH+H1HH+ISIRP+EEHHmass);
       
% 
%          if i>=3000 && i<4000
%             etaa = etaa/1.0008;
%         end   
%    
%        if i>=4000 && i<=5000
%              etaa = etaa/1.0010;
%         end 
%         if i>=5000 && i<=5500
%              etaa = etaa/0.9990;
%         end     
 
             percapbirths1 = max(etaa1-etab1*sqrt(W/weightedprice)...
                        + sigmab*epsilonb1(i)*sqrt(1),0);         %2P-a)
             percapbirths2 = max(etaa2-etab2*sqrt(W/weightedprice)...
                        + sigmab*epsilonb2(i)*sqrt(1),0);         %2P-a)
             percapbirths  = percapbirths1*alfa1 + percapbirths2*alfa2;  
        
    end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
    %  %  %  %  Water compartment %  %  %  %  %
    % Water computations
    % local variables
    % Future feature 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%===============VECTORS==========================================    
%     vectorpercapbirths(i)=percapbirths;
%     vectorweightedprice(i)=weightedprice;
%     vectorpP1(i)=pP1;
%     vectorpP1(i)=pP1;
%     vectorpEEp(i)=pEE;
%     vectorpIS(i)=pIS;
%     vectorpH1(i)=pH1;
%     vectorP1H1(i)=P1H1;
%     vectorP1IS(i)=P1IS;
%     vectorP1HH(i)=P1HH;
%     vectorH1HH(i)=H1HH;
%     vectorP2H1(i)=P2H1;
%     vectorP2H3(i)=P2H3;
%     vectorRPIS(i)=RPIS;
%     vectorRPISdemand(i)=RPISdemand;
%     vectorISHHdemand(i)=ISHHdemand;
%     vectorISIRP(i)=ISIRP;
%     vectorISHHflow(i)=ISHHflow;
%     vectorIRPRP(i)=IRPRP;
%     vectorEEHHmass(i)=EEHHmass;
    
%========================================================
    
    %
    %	Based on the calculated values, the state variables for the next
    %	Tfinal step are calculated below.

    %if i < Tfinal
%     disp('RPP1')
%     disp(RPP1)
%         disp('P1RP')
%             disp(P1RP)
%             disp('P1H2')
%                 disp(P1H2)
%                 disp('>P1H1')
%               
%                 disp(P1H1)
%                 disp('P1HH')
%                 
%                 disp(P1HH)
%                 disp('P1IS')
%                 
%                 disp(P1IS)
   %% Next Step             
    
        P1(i+1)=P1(i)+RPP1-P1RP-P1H2-P1H1-P1HH-P1IS;

%         if (P1(i+1)<P1(i) & i>10000)
%             RPP1=RPP1;
%         end

        if P1==0
            P1H1demand=0;
            P1ISdemand=0;
            P1HHdemand=0;
            P1HHdemand1 = 0;
            P1HHdemand2 = 0;
        end

        P1H1massdeficit(i+1)=P1H1massdeficit(i)+P1H1-P1H1demand;

        P1ISmassdeficit(i+1)=P1ISmassdeficit(i)+P1IS-P1ISdemand;

        P1HHmassdeficit(i+1)=P1HHmassdeficit(i)+P1HH-P1HHdemand*numHH(i);

        P1massdeficit(i+1) = P1HHmassdeficit(i+1) + P1ISmassdeficit(i+1) ...
                        + P1H1massdeficit(i+1);

        P2(i+1)=P2(i)+IRPP2+RPP2-P2RP-P2H2-P2H3-P2H1;
        
        P3(i+1)=P3(i)+IRPP3+RPP3-P3RP-P3H3;

        H1(i+1)=H1(i)+P1H1+P2H1-H1RP-H1C1-H1HH;
        
        if H1==0
            H1HHdemand=0;
            H1HHdemand1 = 0;
            H1HHdemand2 = 0;
        end
        
       
        H1massdeficit(i+1)=H1massdeficit(i)+H1HH-H1HHdemand*numHH(i);

        H2(i+1)=H2(i)+P1H2+P2H2-H2RP-H2C1-H2C2;

        H3(i+1)=H3(i)+P2H3+P3H3-H3RP-H3C2;

        C1(i+1)=C1(i)+H1C1+H2C1-C1RP;

        C2(i+1)=C2(i)+H2C2+H3C2-C2RP;

        HH(i+1)=HH(i)+P1HH+H1HH-HHRP;
            HH1(i+1) = HH(i+1)*f2pe(1);                              %2P-e)
            HH2(i+1) = HH(i+1)*f2pe(2);                              %2P-e)
    

        ISmass(i+1)=ISmass(i)+P1IS+RPIS-ISIRP; % keep track of actual mass in IS

        ISmassdeficit(i+1)=ISmassdeficit(i)+ISIRP-ISHHflow;
        % keep track of deficit in IS, what is supplied minus the demand

        IRP(i+1)=IRP(i)-IRPP2-IRPP3+RPIRP+ISIRP-IRPRP + EEIRP;

        RP(i+1)=stockRP-(RPP1+RPP2+RPP3)-RPIRP-RPIS;
       
        ERP(i+1) = ERP(i) - EEIRP;                                    % Energy)
   
        EE(i+1) = EE(i) + ERPEE - EEIRP;                              % Energy)
    
        %numHH(i+1)=max(numHH(i)+ceil(percapbirths*numHH(i))-ceil(mHH*numHH(i))-ceil(numHH(i)*phi*(percapmass(i)-idealpercapmass)^2),1.0);

        %Modificado, añadir numHH1 y numHH2
        numHH1(i+1) = max(numHH1(i) + ceil(percapbirths1*numHH1(i)) - ...%2P-a)
        ceil(mHH1*numHH1(i))-...
        ceil(numHH1(i)*phi1*(percapmass1(i) - idealpercapmass)^2)...
        - round(EMF*numHH(i)),1);
    
       numHH2(i+1) = max(numHH2(i) + ceil(percapbirths2*numHH2(i)) - ...%2P-a)
        ceil(mHH2*numHH2(i))-...
        ceil(numHH2(i)*phi2*(percapmass2(i)-idealpercapmass)^2)...
        + round(EMF*numHH(i)),1);
    
       numHH(i+1) = numHH1(i+1) + numHH2(i+1);
%       disp('ddd')  
%      disp(bP1p)
%     disp(numHH1(i))
%     disp(numHH2(i))
    
        %percapmass(i+1)=HH(i+1)/numHH(i+1);
    percapmass1(i+1) = HH1(i+1)/numHH1(i+1);                         %2P-a)
    percapmass2(i+1) = HH2(i+1)/numHH2(i+1);                         %2P-a)
    percapmass(i+1)  = alfa1*percapmass1(i+1) + alfa2*percapmass2(i+1);
        
     yGHG=[P1(i) H1(i) numHH(i) P1production H1production ISproduction ...
        EEproduction P2(i) P3(i) RP(i)];
    
    CO2eq(i+1) = CO2eq(i) + sum(yGHG.*GtCO2eq)*ppmCO2eq;  %In ppm
    
        FS(i+1)=FS(i) - FSIRP;
        C_Emission(i) = 3813.03432791747*1e7*(P1HH) + 41724.0782125757*1e7*(H1HH) + 58998.6289974106*1e7*(ISHHflow)+49757.2521293138*1e7*(abs(FSIRP))-9578685.20987084+210.001417582771*numHH(i);
                industry(i) = 58998.6289974106*1e7*(ISHHflow)/( 58998.6289974106*1e7*(ISHHflow)+49757.2521293138*1e7*(abs(FSIRP))+210.001417582771*numHH(i));
                energy(i) = 49757.2521293138*1e7*(abs(FSIRP))/(  58998.6289974106*1e7*(ISHHflow)+49757.2521293138*1e7*(abs(FSIRP))+210.001417582771*numHH(i));
                human(i) = 210.001417582771*numHH(i)/(  58998.6289974106*1e7*(ISHHflow)+49757.2521293138*1e7*(abs(FSIRP))+210.001417582771*numHH(i));
                agri_sec(i) = 3813.03432791747*1e7*(P1HH) + 41724.0782125757*1e7*(H1HH) ;
                ind_sec(i) = 58998.6289974106*1e7*(ISHHflow);
                energy_sec(i) = 49757.2521293138*1e7*(abs(FSIRP));
                hum_sec(i) = 210.001417582771*numHH(i);
       %GDP BEFORE 1990 GDP - 05-20
       if i<2080
           
       GDP(i) = 1e4*0.000432963598073804*pP1*(P1HH) +1e4*23245.5128345314*pH1*(H1HH) + 1e5*0.000129148859277009*pIS*(ISHHflow)+1e5*9.23967043627246e-05*pEE*(abs(FSIRP))-10318.3767865379+7.89557162177279e-09*numHH(i)+1e5*0.290517122093390*P2H1 +1e5*8.89231457281200*P1H2;

       elseif 3119 <i && bioenergy(i)==1
           
             GDP(i) = 1e4*0.540338277834181*pP1*(P1HH) +1e4*23256.7451963467*pH1*(H1HH) + 1e5*0.226741728886730*pIS*(ISHHflow)+1e5*0.261785366855450*pEE/0.7*(abs(FSIRP))+-16706.2185228093+0.207560636852409*numHH(i)+1e5*0.185254459024601*P2H1 +1e5*5.66928761603147*P1H2;
       %AFTER year 1990
       else 
             
         GDP(i) = 1e4*0.540338277834181*pP1*(P1HH) +1e4*23256.7451963467*pH1*(H1HH) + 1e5*0.226741728886730*pIS*(ISHHflow)+1e5*0.261785366855450*pEE*(abs(FSIRP))+-16706.2185228093+0.207560636852409*numHH(i)+1e5*0.185254459024601*P2H1 +1e5*5.66928761603147*P1H2; 
      
        
     %BEFORE Year 2003 CO2 - 05-20
        

    %NOX EMissions 05-20
        N_Emission(i) = 1e6*(0.0180607515266029*(P1HH) + 295602.880816163*(ISHHflow) +4911.22101433158*(abs(FSIRP))-0.751158165140370+7.00267537265572*P2H1);%+x(6)*numHH(i));%+ x(4)*pEE*EEHHmass +x(5); %x(6)*EEISdemand + x(3)*FSIRP; %+x(4)*(FS(i)) ;
                 
        Agriculture(i) =  1e6*(0.0180607515266029*(P1HH) +7.00267537265572*P2H1);
        Ind_Nitro(i) = 1e6*(295602.880816163*(ISHHflow) +4911.22101433158*(abs(FSIRP))-0.751158165140370);
            
        end
%     if i == 200
%         
%           if bioenergy(i) ==1 
%                     GDP(i) = 1e4*0.540338277834181*pP1*(P1HH) +1e4*23256.7451963467*pH1*(H1HH) + 1e5*0.226741728886730*pIS*(ISHHflow)+1e5*0.261785366855450*pEE/0.7*(abs(FSIRP))+-16706.2185228093+0.207560636852409*numHH(i)+1e5*0.185254459024601*P2H1 +1e5*5.66928761603147*P1H2;
%           else
%                     GDP(i) = 1e4*0.540338277834181*pP1*(P1HH) +1e4*23256.7451963467*pH1*(H1HH) + 1e5*0.226741728886730*pIS*(ISHHflow)+1e5*0.261785366855450*pEE*(abs(FSIRP))+-16706.2185228093+0.207560636852409*numHH(i)+1e5*0.185254459024601*P2H1 +1e5*5.66928761603147*P1H2;     
%           end
%                 C_Emission(i) = 3813.03432791747*1e7*(P1HH) + 41724.0782125757*1e7*(H1HH) + 58998.6289974106*1e7*(ISHHflow)+49757.2521293138*1e7*(abs(FSIRP))-9578685.20987084+210.001417582771*numHH(i);
%                 industry(i) = 58998.6289974106*1e7*(ISHHflow)/( 58998.6289974106*1e7*(ISHHflow)+49757.2521293138*1e7*(abs(FSIRP))+210.001417582771*numHH(i));
%                 energy(i) = 49757.2521293138*1e7*(abs(FSIRP))/(  58998.6289974106*1e7*(ISHHflow)+49757.2521293138*1e7*(abs(FSIRP))+210.001417582771*numHH(i));
%                 human(i) = 210.001417582771*numHH(i)/(  58998.6289974106*1e7*(ISHHflow)+49757.2521293138*1e7*(abs(FSIRP))+210.001417582771*numHH(i));
%                 agri_sec(i) = 3813.03432791747*1e7*(P1HH) + 41724.0782125757*1e7*(H1HH) ;
%                 ind_sec(i) = 58998.6289974106*1e7*(ISHHflow);
%                 energy_sec(i) = 49757.2521293138*1e7*(abs(FSIRP));
%                 hum_sec(i) = 210.001417582771*numHH(i);
%        
%              N_Emission(i) = 1e6*(0.0180607515266029*(P1HH) + 295602.880816163*(ISHHflow) +4911.22101433158*(abs(FSIRP))-0.751158165140370+7.00267537265572*P2H1);
%             Agriculture(i) =  1e6*(0.0180607515266029*(P1HH) +7.00267537265572*P2H1);
%             Ind_Nitro(i) = 1e6*(295602.880816163*(ISHHflow) +4911.22101433158*(abs(FSIRP))-0.751158165140370);
%     end
  

        
    store_output(i,:) = [pP1                P1production        P1H1            P1H2...
                        P1IS                P1HH                RPP1            P1RP...
                        IRPP2               RPP2                P2RP            P2H1...
                        P2H2                P2H3                IRPP3           RPP3...
                        P3RP                P3H3                pH1             H1production...
                        H1HH                H1C1                H1RP            H2RP...
                        H2C1                H2C2                H3RP            H3C2...
                        C1RP                C2RP                pIS             ISproduction...
                        RPIS                ISIRP               RPIRP           IRPRP...
                        HHRP                percapbirths        mHH             W...
                        etaa                etab                weightedprice   pEE...
                        EEproduction        FSIRP               fuelcost        wagecost ...
                        bioenergy_supplied  EEdemand            EEHHdemand      EEISdemand ...
                        P1IRP               EEHHpercapitademand ISHHflow        P1HHdemand...
                        H1HHdemand          ISHHdemand          P1ISdemand      RPISdemand...
                        W1                  W2                  P1HHdemand1     P1HHdemand2...
                        H1HHdemand1         H1HHdemand2         ISHHdemand1     ISHHdemand2...
                        EEHHdemand1         EEHHdemand2         EEHHtotdemand   EEHHmass...
                        EEIRP               percapbirths1       percapbirths2   mHH1...
                        mHH2                EMF                 round(EMF*numHH(i))];
  
 
end %End of the Do loop 

%R1R2
% for i=1:Tfinal
% if i==1
%    
% R1(i) = ((P1(i+1)-P1(i))/P1(1))^2+...
%     ((P2(i+1)-P2(i))/P2(1))^2+...
%     ((P3(i+1)-P3(i))/P3(1))^2+...
%     ((H1(i+1)-H1(i))/H1(1))^2+...
%     ((H2(i+1)-H2(i))/H2(1))^2+...
%     ((H3(i+1)-H3(i))/H3(1))^2+...
%     ((C1(i+1)-C1(i))/C1(1))^2+...
%     ((C2(i+1)-C2(i))/C2(1))^2+...
%     ((HH(i+1)-HH(i))/HH(1))^2+...
%     ((ISmass(i+1)-ISmass(i))/ISmass(1))^2+...
%     ((RP(i+1)-RP(i))/RP(1))^2+...
%     ((IRP(i+1)-IRP(i))/IRP(1))^2+...
%     ((P1H1massdeficit(i+1)-P1H1massdeficit(i))/P1(1))^2+...
%     ((P1ISmassdeficit(i+1)-P1ISmassdeficit(i))/P1(1))^2+...
%     ((P1HHmassdeficit(i+1)-P1HHmassdeficit(i))/P1(1))^2+...
%     ((H1massdeficit(i+1)-H1massdeficit(i))/H1(1))^2+...
%     ((ISmassdeficit(i+1)-ISmassdeficit(i))/ISmass(1))^2+...
%     ((numHH(i+1)-numHH(i))/numHH(1))^2+...
%     ((FS(i+1)-FS(i))/FS(1))^2;
% 
% R2(i) = ((P1(i+1)-P1(i))*(P1(i+2)-2*P1(i+1)+P1(i))/(P1(1)^2))+...
%     ((P2(i+1)-P2(i))*(P2(i+2)-2*P2(i+1)+P2(i))/(P2(1)^2))+...
%     ((P3(i+1)-P3(i))*(P3(i+2)-2*P3(i+1)+P3(i))/(P3(1)^2))+...
%     ((H1(i+1)-H1(i))*(H1(i+2)-2*H1(i+1)+H1(i))/(H1(1)^2))+...
%     ((H2(i+1)-H2(i))*(H2(i+2)-2*H2(i+1)+H2(i))/(H2(1)^2))+...
%     ((H3(i+1)-H3(i))*(H3(i+2)-2*H3(i+1)+H3(i))/(H3(1)^2))+...
%     ((C1(i+1)-C1(i))*(C1(i+2)-2*C1(i+1)+C1(i))/(C1(1)^2))+...
%     ((C2(i+1)-C2(i))*(C2(i+2)-2*C2(i+1)+C2(i))/(C2(1)^2))+...
%     ((HH(i+1)-HH(i))*(HH(i+2)-2*HH(i+1)+HH(i))/(HH(1)^2))+...
%     ((ISmass(i+1)-ISmass(i))*(ISmass(i+2)-2*ISmass(i+1)+ISmass(i))/(ISmass(1)^2))+...
%     ((RP(i+1)-RP(i))*(RP(i+2)-2*RP(i+1)+RP(i))/(RP(1)^2))+...
%     ((IRP(i+1)-IRP(i))*(IRP(i+2)-2*IRP(i+1)+IRP(i))/(IRP(1)^2))+...
%     ((P1H1massdeficit(i+1)-P1H1massdeficit(i))*(P1H1massdeficit(i+2)-2*P1H1massdeficit(i+1)+P1H1massdeficit(i))/(P1(1)^2))+...
%     ((P1ISmassdeficit(i+1)-P1ISmassdeficit(i))*(P1ISmassdeficit(i+2)-2*P1ISmassdeficit(i+1)+P1H1massdeficit(i))/(P1(1)^2))+...
%     ((P1HHmassdeficit(i+1)-P1HHmassdeficit(i))*(P1HHmassdeficit(i+2)-2*P1HHmassdeficit(i+1)+P1HHmassdeficit(i))/(P1(1)^2))+...
%     ((H1massdeficit(i+1)-H1massdeficit(i))*(H1massdeficit(i+2)-2*H1massdeficit(i+1)+H1massdeficit(i))/(H1(1)^2))+...
%     ((ISmassdeficit(i+1)-ISmassdeficit(i))*(ISmassdeficit(i+2)-2*ISmassdeficit(i+1)+ISmassdeficit(i))/(ISmass(1)^2))+...
%     ((numHH(i+1)-numHH(i))*(numHH(i+2)-2*numHH(i+1)+numHH(i))/(numHH(1)^2))+...
%     ((FS(i+1)-FS(i))*(FS(i+2)-2*FS(i+1)+FS(i))/(FS(1)^2));
% 
% elseif i==200
% R1(i) = ((P1(i)-P1(i-1))/P1(1))^2+...
%     ((P2(i)-P2(i-1))/P2(1))^2+...
%     ((P3(i)-P3(i-1))/P3(1))^2+...
%     ((H1(i)-H1(i-1))/H1(1))^2+...
%     ((H2(i)-H2(i-1))/H2(1))^2+...
%     ((H3(i)-H3(i-1))/H3(1))^2+...
%     ((C1(i)-C1(i-1))/C1(1))^2+...
%     ((C2(i)-C2(i-1))/C2(1))^2+...
%     ((HH(i)-HH(i-1))/HH(1))^2+...
%     ((ISmass(i)-ISmass(i-1))/ISmass(1))^2+...
%     ((RP(i)-RP(i-1))/RP(1))^2+...
%     ((IRP(i)-IRP(i-1))/IRP(1))^2+...
%     ((P1H1massdeficit(i)-P1H1massdeficit(i-1))/P1(1))^2+...
%     ((P1ISmassdeficit(i)-P1ISmassdeficit(i-1))/P1(1))^2+...
%     ((P1HHmassdeficit(i)-P1HHmassdeficit(i-1))/P1(1))^2+...
%     ((H1massdeficit(i)-H1massdeficit(i-1))/H1(1))^2+...
%     ((ISmassdeficit(i)-ISmassdeficit(i-1))/ISmass(1))^2+...
%     ((numHH(i)-numHH(i-1))/numHH(1))^2+...
%     ((FS(i)-FS(i-1))/FS(1))^2;
% 
% R2(i) = ((P1(i)-P1(i-1))*(P1(i)-2*P1(i-1)+P1(i-2))/(P1(1)^2))+...
%     ((P2(i)-P2(i-1))*(P2(i)-2*P2(i-1)+P2(i-2))/(P2(1)^2))+...
%     ((P3(i)-P3(i-1))*(P3(i)-2*P3(i-1)+P3(i-2))/(P3(1)^2))+...
%     ((H1(i)-H1(i-1))*(H1(i)-2*H1(i-1)+H1(i-2))/(H1(1)^2))+...
%     ((H2(i)-H2(i-1))*(H2(i)-2*H2(i-1)+H2(i-2))/(H2(1)^2))+...
%     ((H3(i)-H3(i-1))*(H3(i)-2*H3(i-1)+H3(i-2))/(H3(1)^2))+...
%     ((C1(i)-C1(i-1))*(C1(i)-2*C1(i-1)+C1(i-2))/(C1(1)^2))+...
%     ((C2(i)-C2(i-1))*(C2(i)-2*C2(i-1)+C2(i-2))/(C2(1)^2))+...
%     ((HH(i)-HH(i-1))*(HH(i)-2*HH(i-1)+HH(i-2))/(HH(1)^2))+...
%     ((ISmass(i)-ISmass(i-1))*(ISmass(i)-2*ISmass(i-1)+ISmass(i-2))/(ISmass(1)^2))+...
%     ((RP(i)-RP(i-1))*(RP(i)-2*RP(i-1)+RP(i-2))/(RP(1)^2))+...
%     ((IRP(i)-IRP(i-1))*(IRP(i)-2*IRP(i-1)+IRP(i-2))/(IRP(1)^2))+...
%     ((P1H1massdeficit(i)-P1H1massdeficit(i-1))*(P1H1massdeficit(i)-2*P1H1massdeficit(i-1)+P1H1massdeficit(i-2))/(P1(1)^2))+...
%     ((P1ISmassdeficit(i)-P1ISmassdeficit(i-1))*(P1ISmassdeficit(i)-2*P1ISmassdeficit(i-1)+P1H1massdeficit(i-2))/(P1(1)^2))+...
%     ((P1HHmassdeficit(i)-P1HHmassdeficit(i-1))*(P1HHmassdeficit(i)-2*P1HHmassdeficit(i-1)+P1HHmassdeficit(i-2))/(P1(1)^2))+...
%     ((H1massdeficit(i)-H1massdeficit(i-1))*(H1massdeficit(i)-2*H1massdeficit(i-1)+H1massdeficit(i-2))/(H1(1)^2))+...
%     ((ISmassdeficit(i)-ISmassdeficit(i-1))*(ISmassdeficit(i)-2*ISmassdeficit(i-1)+ISmassdeficit(i-2))/(ISmass(1)^2))+...
%     ((numHH(i)-numHH(i-1))*(numHH(i)-2*numHH(i-1)+numHH(i-2))/(numHH(1)^2))+...
%     ((FS(i)-FS(i-1))*(FS(i)-2*FS(i-1)+FS(i-2))/(FS(1)^2));
% 
% else
% R1(i) = ((P1(i+1)-P1(i-1))/2/P1(1))^2+...
%     ((P2(i+1)-P2(i-1))/2/P2(1))^2+...
%     ((P3(i+1)-P3(i-1))/2/P3(1))^2+...
%     ((H1(i+1)-H1(i-1))/2/H1(1))^2+...
%     ((H2(i+1)-H2(i-1))/2/H2(1))^2+...
%     ((H3(i+1)-H3(i-1))/2/H3(1))^2+...
%     ((C1(i+1)-C1(i-1))/2/C1(1))^2+...
%     ((C2(i+1)-C2(i-1))/2/C2(1))^2+...
%     ((HH(i+1)-HH(i-1))/2/HH(1))^2+...
%     ((ISmass(i+1)-ISmass(i-1))/2/ISmass(1))^2+...
%     ((RP(i+1)-RP(i-1))/2/RP(1))^2+...
%     ((IRP(i+1)-IRP(i-1))/2/IRP(1))^2+...
%     ((P1H1massdeficit(i+1)-P1H1massdeficit(i-1))/2)^2+...
%     ((P1ISmassdeficit(i+1)-P1ISmassdeficit(i-1))/2)^2+...
%     ((P1HHmassdeficit(i+1)-P1HHmassdeficit(i-1))/2)^2+...
%     ((H1massdeficit(i+1)-H1massdeficit(i-1))/2)^2+...
%     ((ISmassdeficit(i+1)-ISmassdeficit(i-1))/2)^2+...
%     ((numHH(i+1)-numHH(i-1))/2/numHH(1))^2+...
%     ((FS(i+1)-FS(i-1))/2/FS(1))^2;
% 
% R2(i) = (((P1(i+1)-P1(i-1))/2)*(P1(i+1)-2*P1(i)+P1(i-1))/(P1(1)^2))+...
%     (((P2(i+1)-P2(i-1))/2)*(P2(i+1)-2*P2(i)+P2(i-1))/(P2(1)^2))+...
%     (((P3(i+1)-P3(i-1))/2)*(P3(i+1)-2*P3(i)+P3(i-1))/(P3(1)^2))+...
%     (((H1(i+1)-H1(i-1))/2)*(H1(i+1)-2*H1(i)+H1(i-1))/(H1(1)^2))+...
%     (((H2(i+1)-H2(i-1))/2)*(H2(i+1)-2*H2(i)+H2(i-1))/(H2(1)^2))+...
%     (((H3(i+1)-H3(i-1))/2)*(H3(i+1)-2*H3(i)+H3(i-1))/(H3(1)^2))+...
%     (((C1(i+1)-C1(i-1))/2)*(C1(i+1)-2*C1(i)+C1(i-1))/(C1(1)^2))+...
%     (((C2(i+1)-C2(i-1))/2)*(C2(i+1)-2*C2(i)+C2(i-1))/(C2(1)^2))+...
%     (((HH(i+1)-HH(i-1))/2)*(HH(i+1)-2*HH(i)+HH(i-1))/(HH(1)^2))+...
%     (((ISmass(i+1)-ISmass(i-1))/2)*(ISmass(i+1)-2*ISmass(i)+ISmass(i-1))/(ISmass(1)^2))+...
%     (((RP(i+1)-RP(i-1))/2)*(RP(i+1)-2*RP(i)+RP(i-1))/(RP(1)^2))+...
%     (((IRP(i+1)-IRP(i-1))/2)*(IRP(i+1)-2*IRP(i)+IRP(i-1))/(IRP(1)^2))+...
%     (((P1H1massdeficit(i+1)-P1H1massdeficit(i-1))/2)*(P1H1massdeficit(i+1)-2*P1H1massdeficit(i)+P1H1massdeficit(i-1))/(P1(1)^2))+...
%     (((P1ISmassdeficit(i+1)-P1ISmassdeficit(i-1))/2)*(P1ISmassdeficit(i+1)-2*P1ISmassdeficit(i)+P1H1massdeficit(i-1))/(P1(1)^2))+...
%     (((P1HHmassdeficit(i+1)-P1HHmassdeficit(i-1))/2)*(P1HHmassdeficit(i+1)-2*P1HHmassdeficit(i)+P1HHmassdeficit(i-1))/(P1(1)^2))+...
%     (((H1massdeficit(i+1)-H1massdeficit(i-1))/2)*(H1massdeficit(i+1)-2*H1massdeficit(i)+H1massdeficit(i-1))/(H1(1)^2))+...
%     (((ISmassdeficit(i+1)-ISmassdeficit(i-1))/2)*(ISmassdeficit(i+1)-2*ISmassdeficit(i)+ISmassdeficit(i-1))/(ISmass(1)^2))+...
%     (((numHH(i+1)-numHH(i-1))/2)*(numHH(i+1)-2*numHH(i)+numHH(i-1))/(numHH(1)^2))+...
%     (((FS(i+1)-FS(i-1))/2)*(FS(i+1)-2*FS(i)+FS(i-1))/(FS(1)^2));
% end
% end
H1_scaled = 1.537*H1;
H2_scaled = 2.008*1.537*H2;
H3_scaled = 2.008*1.537*H3;
P1_scaled = (1.821)*P1;
P1_scaled_GTC = (1.821/5)*P1;
P2_scaled = 1.2173*P2;
P3_scaled = 1.2173*P3;
C1_scaled = 1.537*C1;
C2_scaled = 1.537*C2;

% j=1;
% for i = 1:104:Tfinal-104
%     
%     R1avg(j) = mean(R1(i:i+104));
% j=j+1;
% end    
% for i=1:Tfinal
% FIbase(i) = ((R2(i)^2)/(R1(i)^3));
% end

disp('Run completed')
disp('Data saved')
%numHH1
% disp('a')
% pause()


% store_output = [store_output        ISmass'             P1'                 P2' ...
%                 P3'                 H1'                 H2'                 H3' ...
%                 C1'                 C2'                 HH'                 numHH'...
%                 percapmass'         FS'                 RP'                 IRP' ...
%                 P1H1massdeficit'    P1ISmassdeficit'    P1HHmassdeficit'    H1massdeficit'...
%                 ISmassdeficit'      pISHH'              R1'                 R2'   ...
%                 FIbase'             GDP'                C_Emission'         industry'...
%                 energy'             human'              H1_scaled'          H2_scaled' ...
%                 H3_scaled'          P1_scaled'          P2_scaled'          P3_scaled'...
%                 C1_scaled'          C2_scaled'          P1_scaled_GTC'      N_Emission'...
%                 Agriculture'        Ind_Nitro'          agri_sec'           ind_sec'...
%                 energy_sec'         hum_sec'            numHH1'             numHH2'...
%                 HH1'                HH2'                ERP'                EE' ...
%                 CO2eq'];
y =            [ISmass',            P1'                   P2'                P3'...
                H1'                 H2'                   H3'                C1'...
                C2'                 HH'                 numHH'               CO2eq'...                 
                percapmass'         FS'                 RP'                 IRP' ...
                P1H1massdeficit'    P1ISmassdeficit'    P1HHmassdeficit'    H1massdeficit'...
                ISmassdeficit'     numHH1'             numHH2'              HH1'...
                HH2'                ERP'                EE'                  H1_scaled'...
                H2_scaled'          H3_scaled'          P1_scaled'          P2_scaled' ...
                P3_scaled'          C1_scaled'          C2_scaled'          P1_scaled_GTC'
                ];

end  