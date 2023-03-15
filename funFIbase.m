%% Fisher Information Traditional
% Based on Roshi & Diwekar work

function FIb=funFIbase(Data)

mn=size(Data);
time=mn(1);
nvar=mn(2);

%%
for i=1:time
    if i==1
        sum1=0;
        for j=1:nvar
            sum1 = sum1 + (Data(i+1,j)-Data(i,j))^2;
        end
        R1(i) = sum1;
        
        sum2=0;
        for j=1:nvar
            sum2 = sum2 + (Data(i+1,j)-Data(i,j))*...
                          (Data(i+2,j)-2*Data(i+1,j)+Data(i,j));
        end
        R2(i) = sum2;
        
    elseif i==time
        sum1=0;
        for j=1:nvar
            sum1 = sum1 + (Data(i,j)-Data(i-1,j))^2;
        end
        R1(i) = sum1;
        
        sum2=0;
        for j=1:nvar
            sum2 = sum2 + (Data(i,j)-Data(i-1,j))*...
                          (Data(i,j)-2*Data(i-1,j)+Data(i-2,j));
        end
        R2(i) = sum2;
                        
    else
        sum1=0;
        for j=1:nvar
            sum1 = sum1 + ((Data(i+1,j)-Data(i-1,j))/2)^2;
        end
        R1(i) = sum1;
        
        sum2=0;
        for j=1:nvar
            sum2 = sum2 + (Data(i+1,j)-Data(i-1,j))*...
                          (Data(i+1,j)-2*Data(i,j)+Data(i-1,j));
        end
        R2(i) = sum2;
        
    end
end

for i=1:time;
    FIbase(i) = ((R2(i)^2)/(R1(i)^3));
end

FIb=FIbase;
end