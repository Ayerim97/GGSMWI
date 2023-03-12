function [out] = dischargefee
%UNTITLED Modification of the discharge fee
%   Detailed explanation goes here
for i=1:260
   pISHHset(i)=5.05177666998067E-08;
end
for i=260:520
    pISHHset(i)=9.38089913924835E-08;
end
for i=520:780
    pISHHset(i)=0.0000001;
end
for i=780:1040
    pISHHset(i)= 0.0000001;
end
for i=1040:1300
    pISHHset(i)= 0.0000001;
end
for i=1300:1560
    pISHHset(i)= 0.0000001;
end
for i=1560:1820
    pISHHset(i)= 0.0000001;
end
for i=1820:2080
    pISHHset(i)= 0.0000001;
end
for i=2080:2340
    pISHHset(i)= 0.0000001;
end
for i=2340:2600
    pISHHset(i)= 0.0000001;
end
for i=2600:2860
    pISHHset(i)= 0.0000001;
end
for i=2860:3120
    pISHHset(i)= 0.0000001;
end
for i=3120:3380
    pISHHset(i)= 0.0000001;
end
for i=3380:3640
    pISHHset(i)= 0.0000001;
end
for i=3640:3900
    pISHHset(i)= 0.0000001;
end
for i=3900:4160
    pISHHset(i)= 0.0000001;
end
for i=4160:4420
    pISHHset(i)= 0.0000001;
end
for i=4420:4680
    pISHHset(i)= 0.0000001;
end
for i=4680:4940
    pISHHset(i)= 9.35563930263189E-08;
end
for i=4940:5200
    pISHHset(i)= 9.35556257569136E-08;
end
for i=5200:5460
    pISHHset(i)= 8.19916546649724E-08;
end
for i=5460:5720
    pISHHset(i)= 7.14021890867428E-08;
end
for i=5720:5980
    pISHHset(i)= 7.14064911646651E-08;
end
for i=5980:6240
    pISHHset(i)= 8.57020059123585E-08;
end
for i=6240:6500
    pISHHset(i)= 8.57006062319218E-08;
end
for i=6500:6760
    pISHHset(i)= 8.92747266660779E-08;
end
for i=6760:7020
    pISHHset(i)= 9.19555391422251E-08;
end
for i=7020:7280
    pISHHset(i)= 9.59773281258791E-08;
end
for i=7280:7540
    pISHHset(i)= 0.0000001;
end
for i=7540:7800
    pISHHset(i)= 0.0000001;
end
for i=7800:8060
    pISHHset(i)= 0.0000001;
end
for i=8060:8320
    pISHHset(i)= 0.0000001;
end
for i=8320:8580
    pISHHset(i)= 0.0000001;
end
for i=8580:8840
    pISHHset(i)= 0.0000001;
end
for i=8840:9100
    pISHHset(i)= 0.0000001;
end
for i=9100:9360
    pISHHset(i)= 0.0000001;
end
for i=9360:9620
    pISHHset(i)= 0.0000001;
end
for i=9620:9880
    pISHHset(i)= 0.0000001;
end
for i=9880:10140
    pISHHset(i)= 0.0000001;
end
for i=10140:10400
    pISHHset(i)= 0.0000001;
end

out = pISHHset;
end

