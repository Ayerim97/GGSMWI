clc; clear all; close all

% Specifying the simulation time
%1950 -2019 69 (70) years 3640 weeks
%2020 -2150 130 years 6760 weeks
%tfinal = 10400;
tfinal = 200;
% Specifying the number of scenarios
ns = 1;

% Sepcifying the scenario
% Choose "1" to model the scenario of population explosion
%Default is Base Case when both PopulationExplosion = [0 0]    
%& ConsumptionIncrease = [0 0]
PopulationExplosion = [0 0];
%%For Scenario 2 - set Population Explosion = [1 0];
%PopulationExplosion = [1 0];

% Choose "1" to model the secnario of consumption  scenario
ConsumptionIncrease = [0 0];
%%For Scenario 3 - set ConsumptionIncrease = [1 0];
%ConsumptionIncrease = [1 0];
%%For Scenario 4 - set PopulationExplosion = [1 0] &&
% ConsumptionIncrease = [1 0];

% Choose "1" to include the power plant in the model
power_plant= [0 0];

% Choose "1" to include the discharge fee in the model
Modelselection = [0 0];

% Choose "1" to include bioenergy%
bioenergy = [0 0];

% Choose "1" to include the controlled pISHH values
pISHH_var = [0 0];

% Choose "1" to include the controlled theta values
theta_var = [0 0];

% Choose "1" to include the controlled khat values
khat_var = [0 0];

% % Ito => Ito's processes
% 0 - Off
% 1 - On
Ito = [1 0];

% Case => Cases for mortality and birth rates
% 1 - Stable populations 10 total births, 10 total deaths
% 2 - Actual rates 
% 3 - Actual trends (from 2014) 
% 4 - Actual trends (from 1960)

Case = [2 0];

% Country 
% 0 - ideal 
    % 2P-a) 75-25 total population 
    % 2P-b) 75-25 total wages
    % 2P-c) 75-25 total P1demand & H1demand 
    % 2P-d) 75-25 total ISdemand & EEdemand

% 1 - Developed country (Germany/Switzerland)
    % 2P-a) 75-25 total population
    % 2P-b) 62.2-37.8 total wages
    % 2P-c) 73.3-26.7 total P1demand & H1demand 
    % 2P-d) 62.2-37.8 total ISdemand & EEdemand
    % 2P-e) 64.6-35.4 HH

% 2 - BRICS (USA/Canada)
    % 2P)   Income Equality Index (IEI) => 1.5
    % 2P-a) 75-25 total population
    % 2P-b) 49.7-50.3 total wages
    % 2P-c) 68-32 total P1demand & H1demand 
    % 2P-d) 52-48 total ISdemand & EEdemand
    % 2P-e) 68.6-31.4 HH

% 3 - Developing Country (Mexico)
% 2P-a) 72-28 total population
    % 2P-b) 40.8-59.2 total wages
    % 2P-c) 52.6-47.4 total P1demand & H1demand 
    % 2P-d) 41.8-58.2 total ISdemand & EEdemand
    % 2P-e) 70.1-29.9 HH

Country = [3 0];

k = [1 0];

for i = 1:ns

    % Execute the model and store the outputs of the model
        [store_output{i}, y{i}]= EPAModel(Modelselection(i),...
                        PopulationExplosion(i),ConsumptionIncrease(i),...
                        power_plant(i),tfinal,bioenergy(i),i,...
                        pISHH_var(i),theta_var(i),khat_var(i), Ito(i),...
                        Case(i), Country(i),k(i));

                    %opcion1
%     pP1(:,i)= store_output{i}(:,1);                 P1production(:,i) = store_output{i}(:,2);   
%     P1H1(:,i) = store_output{i}(:,3);               P1H2(:,i) = store_output{i}(:,4);
%     P1IS(:,i) = store_output{i}(:,5);               P1HH(:,i) = store_output{i}(:,6); 
%     RPP1(:,i) = store_output{i}(:,7);               P1RP(:,i) = store_output{i}(:,8);
%     IRPP2(:,i) = store_output{i}(:,9);              RPP2(:,i) = store_output{i}(:,10);
%     P2RP(:,i) = store_output{i}(:,11);              P2H1(:,i) = store_output{i}(:,12);
%     P2H2(:,i) = store_output{i}(:,13);              P2H3(:,i) = store_output{i}(:,14);
%     IRPP3(:,i) = store_output{i}(:,15);             RPP3(:,i) = store_output{i}(:,16);
%     P3RP(:,i) = store_output{i}(:,17);              P3H3(:,i) = store_output{i}(:,18); 
%     pH1(:,i) = store_output{i}(:,19);               H1production(:,i) = store_output{i}(:,20);
%     H1HH(:,i) = store_output{i}(:,21);              H1C1(:,i) = store_output{i}(:,22); 
%     H1RP(:,i) = store_output{i}(:,23);              H2RP(:,i) = store_output{i}(:,24);
%     H2C1(:,i) = store_output{i}(:,25);              H2C2(:,i) = store_output{i}(:,26); 
%     H3RP(:,i) = store_output{i}(:,27);              H3C2(:,i) = store_output{i}(:,28);
%     C1RP(:,i) = store_output{i}(:,29);              C2RP(:,i) = store_output{i}(:,30); 
%     pIS(:,i) = store_output{i}(:,31);               ISproduction(:,i) = store_output{i}(:,32);
%     RPIS(:,i) = store_output{i}(:,33);              ISIRP(:,i) = store_output{i}(:,34);
%     RPIRP(:,i) = store_output{i}(:,35);             IRPRP(:,i) = store_output{i}(:,36);
%     HHRP(:,i) = store_output{i}(:,37);              percapbirths(:,i) = store_output{i}(:,38);
%     mHH(:,i) = store_output{i}(:,39);               W(:,i) = store_output{i}(:,40);
%     etaa(:,i) = store_output{i}(:,41);              etab(:,i) = store_output{i}(:,42); 
%     weightedprice(:,i) = store_output{i}(:,43);     pEE(:,i) = store_output{i}(:,44);
%     EEproduction(:,i) = store_output{i}(:,45);      FSIRP(:,i) = store_output{i}(:,46);
%     fuelcost(:,i) = store_output{i}(:,47);          wagecost(:,i) = store_output{i}(:,48);
%     bioenergycal(:,i) = store_output{i}(:,49);      EEdemand(:,i) = store_output{i}(:,50);
%     EEHHdemand(:,i) = store_output{i}(:,51);        EEISdemand(:,i) = store_output{i}(:,52);
%     P1IRP(:,i) = store_output{i}(:,53);             EEHHpercapitademand(:,i) = store_output{i}(:,54);    
%     ISHHflow(:,i) = store_output{i}(:,55);          P1HHdemand(:,i) = store_output{i}(:,56);  
%     H1HHdemand(:,i) = store_output{i}(:,57);        ISHHdemand(:,i) = store_output{i}(:,58);        
%     P1ISdemand(:,i) = store_output{i}(:,59);        RPISdemand(:,i) = store_output{i}(:,60);
%     W1(:,i) = store_output{i}(:,61);                W2(:,i) = store_output{i}(:,62);
%     P1HHdemand1(:,i) = store_output{i}(:,63);       P1HHdemand2(:,i) = store_output{i}(:,64);
%     H1HHdemand1(:,i) = store_output{i}(:,65);       H1HHdemand2(:,i) = store_output{i}(:,66);
%     ISHHdemand1(:,i) = store_output{i}(:,67);       ISHHdemand2(:,i) = store_output{i}(:,68);
%     EEHHdemand1(:,i) = store_output{i}(:,69);       EEHHdemand2(:,i) = store_output{i}(:,70);
%     EEHHtotdemand(:,i) = store_output{i}(:,71);     EEHHmass(:,i) = store_output{i}(:,72);
%     EEIRP(:,i) = store_output{i}(:,73);             percapbirths1(:,i) = store_output{i}(:,74);
%     percapbirths2(:,i) = store_output{i}(:,75);     mHH1(:,i) = store_output{i}(:,76);
%     mHH2(:,i) = store_output{i}(:,77);              EMF(:,i) = store_output{i}(:,78);
%     EMFnumHH(:,i) = store_output{i}(:,79);          
    
    %opcion 2
    P1RP(:,i)= store_output{i}(:,1);                P1H1(:,i) = store_output{i}(:,2);   
    P1H2(:,i) = store_output{i}(:,3);               P1IS(:,i) = store_output{i}(:,4);
    P1HH(:,i) = store_output{i}(:,5);               P2RP(:,i) = store_output{i}(:,6); 
    P2H1(:,i) = store_output{i}(:,7);               P2H2(:,i) = store_output{i}(:,8);
    P2H3(:,i) = store_output{i}(:,9);              P3RP(:,i) = store_output{i}(:,10);
    P3H3(:,i) = store_output{i}(:,11);              H1RP(:,i) = store_output{i}(:,12);
    H1C1(:,i) = store_output{i}(:,13);              H1HH(:,i) = store_output{i}(:,14);
    H2RP(:,i) = store_output{i}(:,15);             H2C1(:,i) = store_output{i}(:,16);
    H2C2(:,i) = store_output{i}(:,17);              H3RP(:,i) = store_output{i}(:,18); 
    H3C2(:,i) = store_output{i}(:,19);               C1RP(:,i) = store_output{i}(:,20);
    C2RP(:,i) = store_output{i}(:,21);              HHRP(:,i) = store_output{i}(:,22); 
    ISIRP(:,i) = store_output{i}(:,23);              RPP1(:,i) = store_output{i}(:,24);
    RPP2(:,i) = store_output{i}(:,25);              RPP3(:,i) = store_output{i}(:,26); 
    RPIS(:,i) = store_output{i}(:,27);              IRPP2(:,i) = store_output{i}(:,28);
    IRPP3(:,i) = store_output{i}(:,29);              IRPRP(:,i) = store_output{i}(:,30); 
    P1HHdemand(:,i) = store_output{i}(:,31);               H1HHdemand(:,i) = store_output{i}(:,32);
    ISHHdemand(:,i) = store_output{i}(:,33);              P1ISdemand(:,i) = store_output{i}(:,34);
    RPISdemand(:,i) = store_output{i}(:,35);             P1production(:,i) = store_output{i}(:,36);
    H1production(:,i) = store_output{i}(:,37);              ISproduction(:,i) = store_output{i}(:,38);
    pP1(:,i) = store_output{i}(:,39);               pH1(:,i) = store_output{i}(:,40);
    pIS(:,i) = store_output{i}(:,41);              percapbirths(:,i) = store_output{i}(:,42); 
    weightedprice(:,i) = store_output{i}(:,43);     W(:,i) = store_output{i}(:,44);
    W1(:,i) = store_output{i}(:,45);      W2(:,i) = store_output{i}(:,46);
    P1HHdemand1(:,i) = store_output{i}(:,47);          P1HHdemand2(:,i) = store_output{i}(:,48);
    H1HHdemand1(:,i) = store_output{i}(:,49);      H1HHdemand2(:,i) = store_output{i}(:,50);
    ISHHdemand1(:,i) = store_output{i}(:,51);        ISHHdemand2(:,i) = store_output{i}(:,52);
    EEHHdemand1(:,i) = store_output{i}(:,53);             EEHHdemand2(:,i) = store_output{i}(:,54);    
    pEE(:,i) = store_output{i}(:,55);          EEHHdemand(:,i) = store_output{i}(:,56);  
    EEHHtotdemand(:,i) = store_output{i}(:,57);        EEISdemand(:,i) = store_output{i}(:,58);        
    EEproduction(:,i) = store_output{i}(:,59);        EEHHmass(:,i) = store_output{i}(:,60);
    EEIRP(:,i) = store_output{i}(:,61);                percapbirths1(:,i) = store_output{i}(:,62);
    percapbirths2(:,i) = store_output{i}(:,63);       mHH1(:,i) = store_output{i}(:,64);
    mHH2(:,i) = store_output{i}(:,65);       EMF(:,i) = store_output{i}(:,66);
    EMFnumHH(:,i) = store_output{i}(:,67);       
    
    
    %descartadas 
    %IS(:,i) = store_output{i}(:,80); 
%     P1(:,i) = store_output{i}(:,81);                P2(:,i) = store_output{i}(:,82); 
%     P3(:,i) = store_output{i}(:,83);                H1(:,i) = store_output{i}(:,84); 
%     H2(:,i) = store_output{i}(:,85);                H3(:,i) = store_output{i}(:,86); 
%     C1(:,i) = store_output{i}(:,87);                C2(:,i) = store_output{i}(:,88); 
%     HH(:,i) = store_output{i}(:,89);                numHH(:,i) = store_output{i}(:,90); 
%     percapmass(:,i) = store_output{i}(:,91);        FS(:,i) = store_output{i}(:,92); 
%     RP(:,i) = store_output{i}(:,93);                IRP(:,i) = store_output{i}(:,94); 
%     P1H1massdeficit(:,i) = store_output{i}(:,95);   P1ISmassdeficit(:,i) = store_output{i}(:,96); 
%     P1HHmassdeficit(:,i) = store_output{i}(:,97);   H1massdeficit(:,i) = store_output{i}(:,98); 
%     ISmassdeficit(:,i) = store_output{i}(:,99);     pISHH(:,i) = store_output{i}(:,100); 
%     %theta(:,i) = store_output{i}(:,101);            khat(:,i) = store_output{i}(:,102);
%     R1(:,i) = store_output{i}(:,101);               R2(:,i) = store_output{i}(:,102); 
%     FIbase(:,i) = store_output{i}(:,103);           GDP(:,i) = store_output{i}(:,104);
%     C_Emission(:,i) = store_output{i}(:,105);       industry(:,i) = store_output{i}(:,106);
%     energy(:,i) = store_output{i}(:,107);           human(:,i) = store_output{i}(:,108);     
%     H1_scaled(:,i)= store_output{i}(:,109);         H2_scaled(:,i)= store_output{i}(:,110);
%     H3_scaled(:,i)= store_output{i}(:,111);         P1_scaled(:,i)= store_output{i}(:,112); 
%     P2_scaled(:,i)= store_output{i}(:,113);         P3_scaled(:,i)= store_output{i}(:,114);  
%     C1_scaled(:,i) = store_output{i}(:,115);        C2_scaled(:,i) = store_output{i}(:,116); 
%     P1_scaled_GTC(:,i) = store_output{i}(:,117);    N_Emission(:,i) = store_output{i}(:,118);  
%     Agriculture(:,i) = store_output{i}(:,119);      Ind_Nitro(:,i) = store_output{i}(:,120);  
%     agri_sec(:,i) = store_output{i}(:,121);         ind_sec(:,i) = store_output{i}(:,122);
%     energy_sec(:,i) = store_output{i}(:,123);       hum_sec(:,i) = store_output{i}(:,124);
%     numHH1(:,i) = store_output{i}(:,125);           numHH2(:,i) = store_output{i}(:,126);
%     HH1(:,i) = store_output{i}(:,127);              HH2(:,i) = store_output{i}(:,128);
%     ERP(:,i) = store_output{i}(:,129);              EE(:,i) = store_output{i}(:,130);
%     CO2eq(:,i) = store_output{i}(:,131);


%opcion 1
%     IS(:,i) = y{i}(:,1);                     P1(:,i) = y{i}(:,2); 
%     P2(:,i) = y{i}(:,3);                         P3(:,i) = y{i}(:,4);
%     H1(:,i) = y{i}(:,5);                      H2(:,i) = y{i}(:,6); 
%     H3(:,i) = y{i}(:,7);                      C1(:,i) = y{i}(:,8); 
%     C2(:,i) = y{i}(:,9);                         HH(:,i) = y{i}(:,10);
%    numHH(:,i) = y{i}(:,11);                      CO2eq(:,i) = y{i}(:,12);
%     percapmass(:,i) = y{i}(:,13);                 FS(:,i) = y{i}(:,14); 
%     RP(:,i) = y{i}(:,15);                         IRP(:,i) = y{i}(:,16); 
%     P1H1massdeficit(:,i) = y{i}(:,17);           P1ISmassdeficit(:,i) = y{i}(:,18); 
%     P1HHmassdeficit(:,i) = y{i}(:,19);            H1massdeficit(:,i) = y{i}(:,20); 
%     ISmassdeficit(:,i) = y{i}(:,21);             numHH1(:,i) = y{i}(:,22);           
%     numHH2(:,i) = y{i}(:,23);                    HH1(:,i) = y{i}(:,24);
%     HH2(:,i) = y{i}(:,25);                        ERP(:,i) = y{i}(:,26);
%    EE(:,i) = y{i}(:,27);                        H1_scaled(:,i)= y{i}(:,28);
%    H2_scaled(:,i)= y{i}(:,29);      H3_scaled(:,i)= y{i}(:,26);
%    P1_scaled(:,i)= y{i}(:,27);      P2_scaled(:,i)= y{i}(:,28); 
%    P3_scaled(:,i)= y{i}(:,29);      C1_scaled(:,i) = y{i}(:,30);
%    C2_scaled(:,i) = y{i}(:,31);     P1_scaled_GTC(:,i) = y{i}(:,32);
   
   %opcion2
   
   P1(:,i) = y{i}(:,1);                     P2(:,i) = y{i}(:,2); 
    P3(:,i) = y{i}(:,3);                         H1(:,i) = y{i}(:,4);
    H2(:,i) = y{i}(:,5);                      H3(:,i) = y{i}(:,6); 
    C1(:,i) = y{i}(:,7);                      C2(:,i) = y{i}(:,8); 
    HH(:,i) = y{i}(:,9);                         ISmass(:,i) = y{i}(:,10);
   RP(:,i) = y{i}(:,11);                      IRP(:,i) = y{i}(:,12);
    numHH(:,i) = y{i}(:,13);                 percapmass(:,i) = y{i}(:,14); 
    P1H1massdeficit(:,i) = y{i}(:,15);           P1ISmassdeficit(:,i) = y{i}(:,16); 
    P1HHmassdeficit(:,i) = y{i}(:,17);           H1massdeficit(:,i) = y{i}(:,18); 
    ISmassdeficit(:,i) = y{i}(:,19);            numHH1(:,i) = y{i}(:,20); 
    numHH2(:,i) = y{i}(:,21);             HH1(:,i) = y{i}(:,22);           
    HH2(:,i) = y{i}(:,23);                    ERP(:,i) = y{i}(:,24);
    EE(:,i) = y{i}(:,25);                        CO2eq(:,i) = y{i}(:,26);
  

   
end

CompartimetsPlots

%Data1 = [store_output{1}];
Data = [store_output{1} y{1}(2:end,:)];
Indicators
IndicatorsPlotsc
