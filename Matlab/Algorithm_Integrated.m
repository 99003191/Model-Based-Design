%% Import data from spreadsheet
%read the data required from whole data sheet
%proximity data taken to a
Data_Set=xlsread ('Team_1_Data_Set.xlsx');
[prox_0] = Data_Set(:,30);
[prox_1] = Data_Set(:,20);
% plotting the value of proximity sensor against time
%plot the graph
subplot(4,4,9);
plot(prox_0,prox_1);
xlabel("Time (s)");
ylabel("Proximity");
title("ProximityPlot");
%% verifying the data
disp('put any obstacle near phone')
b=1;
for loop = 1:30
    if (prox_1(b)==0)
        disp(prox_1(b))
        disp('obstacle find within 5CM')
        b = b+1;
    elseif (prox_1(b)>0 && prox_1(b)<=10)
        disp(prox_1(b))
        disp('obstacle find within 10CM')
        b = b+1;
    else
        disp(prox_1(b))
        disp('safe, no obstacle')
        b = b+1;
    end
end
%% Gyroscope
% Import data from text file
% Script for importing data from the following text file:
%
%    filename: D:\Akshay_Files\androsensor.csv
%
% Auto-generated by MATLAB on 20-Dec-2020 14:29:29

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 31);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["ACCELEROMETERXms", "ACCELEROMETERYms", "ACCELEROMETERZms", "GRAVITYXms", "GRAVITYYms", "GRAVITYZms", "LINEARACCELERATIONXms", "LINEARACCELERATIONYms", "LINEARACCELERATIONZms", "GYROSCOPEXrads", "GYROSCOPEYrads", "GYROSCOPEZrads", "LIGHTlux", "MAGNETICFIELDXT", "MAGNETICFIELDYT", "MAGNETICFIELDZT", "ORIENTATIONZazimuth", "ORIENTATIONXpitch", "ORIENTATIONYroll", "PROXIMITYi", "SOUNDLEVELdB", "LOCATIONLatitude", "LOCATIONLongitude", "LOCATIONAltitudeM", "LOCATIONAltitudegoogleM", "LOCATIONSpeedKmh", "LOCATIONAccuracyM", "LOCATIONORIENTATION", "SatellitesInRange", "TimeSinceStartInMs", "YYYYMODDHHMISS_SSS"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "string", "string", "string", "double", "string", "string", "string", "categorical", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";

% Specify variable properties
opts = setvaropts(opts, ["LOCATIONLatitude", "LOCATIONLongitude", "LOCATIONAltitudeM", "LOCATIONSpeedKmh", "LOCATIONAccuracyM", "LOCATIONORIENTATION", "YYYYMODDHHMISS_SSS"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["LOCATIONLatitude", "LOCATIONLongitude", "LOCATIONAltitudeM", "LOCATIONSpeedKmh", "LOCATIONAccuracyM", "LOCATIONORIENTATION", "SatellitesInRange", "YYYYMODDHHMISS_SSS"], "EmptyFieldRule", "auto");

% Import the data
x_read = xlsread('Team_1_Data_Set.xlsx','J2:J98');
timems = xlsread('Team_1_Data_Set.xlsx','AD2:AD98');
gyro_x = [x_read,timems];

%% Create output variable
data = gyro_x;

%% Create table
stepdata = table;

%% Allocate imported array to column variable names
stepdata.GYROSCOPEXrads = data(:,1);
stepdata.TimeSinceStartInMs = data(:,2);

%% Clear temporary variables
clearvars gyro_x x_read timems R;

%data=x_read;
stepdata=table;
stepdata1=table;
%data1=timems;
stepdata.gyroscope=data(:,1);
stepdata.time=data(:,2);
values=numel(data(:,1));
p=[];
cnt=0;
cnt1=0;
for i=1:values
    j=j+1;
    if(stepdata.gyroscope(i,1)>0)
        cnt=cnt+1;
        stem(stepdata.gyroscope(i,1));
        disp("The phone is  being using");
    else
        cnt1=cnt1+1;
        disp("The phone is not being used");
    end
    disp("The number of times the phone is being used is ");
    disp(cnt);
    disp("The number of times the phone is not being used is ");
    disp("cnt1");
end
subplot(4,4,12);
plot(stepdata.time,stepdata.gyroscope);
title("Gyroscope Data");
xlabel("Time (ms)");
ylabel("Radians per sec");

%% Speed Calculation
[Latitude] = Data_Set(:,22);
[Longitude] = Data_Set(:,23);
[Speed] = Data_Set(:,26);
[Time] = Data_Set(:,30);

Lat1 = [];
Long1 = [];
Lat2 = [];
Long2 = [];
Lat3 = [];
Long3 = [];

[a, speedLength]=size(Speed);

for i = 1:speedLength
    if Speed(i) < 10
        [Lat1] = [Lat1;Latitude(i)];
        [Long1] = [Long1;Longitude(i)];
    elseif Speed(i)>=10 && Speed(i)<30
        [Lat2] = [Lat2;Latitude(i)];
        [Long2] = [Long2;Longitude(i)];
    else
        [Lat3] = [Lat3;Latitude(i)];
        [Long3] = [Long3;Longitude(i)];
    end
end
%subplot(2,2,2);

%title('Locations With High traffic');
%xlabel('Latitude');
%ylabel('Longitude');
subplot(4,4,1);
geoscatter(Latitude,Longitude,'r');
title('Total Route');
subplot(4,4,2);
geoscatter(Lat1,Long1);
plot(Time,Speed);
title('Speed Vs Time');
xlabel('Time');
ylabel('Speed');
subplot(4,4,3);
geoscatter(Lat1,Long1,'o');
title('Locations With High traffic');
subplot(4,4,4);
geoscatter(Lat2,Long2,'k');
title('Locations With Low traffic');


%% Gravity Variations in a Lift
% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: E:\LTTS\Matlab Intermediate\step_data.xlsx
%    Worksheet: in
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

%% Import the data

Gravity = Data_Set(:,6);%importing Gravity values
[Time]= Data_Set(:,30); %importing data on time
subplot(4,4,5);
plot(Time,Gravity,'r:'); %plotting Gravity i z axis against time
xlabel('Time (s)');
ylabel('Gravity (m/s^2)');
title('Gravity Variations in Lift')
% Understanding the logic 
for index =1:100
    if(Gravity(index) > Gravity(index+1))
        disp("The lift is moving up.")
    elseif(Gravity(index)<Gravity(index+1))
        disp("The lift is moving down.")
    elseif(Gravity(index)==Gravity(index+1))
        disp("The lift isn't moving.")
    end
end
% Lift Display on application level
for index =1:100
    if(Gravity(index) > Gravity(index+1))
        disp("You are heading towards higher floors.")
    elseif(Gravity(index)<Gravity(index+1))
        disp("You are heading towards lower floors.")
    elseif(Gravity(index)==Gravity(index+1))
        disp("Please close the lift to move further")
    end
end



%% Light Sensor
[light12] = Data_Set;
[Area] = Data_Set(:,34);
light_intensity = light12(:,13);
disp('Light intensity');
disp(light_intensity);
presentarea = Area(:,1);
brightness_level(light_intensity);
findpower(light_intensity, presentarea);

%% Sound Level
[x]=Data_Set(:,30);
[y]=Data_Set(:,21);
subplot(4,4,[13:16]);
plot(x,y);
xlabel('Time');
ylabel('sound_level');
title('Noise range');
i=1;       
for sound=2:67
if (x(i)>25 &&x(i)<=35)
disp(x(i))
disp('no noise')
i = i+1;
elseif (x(i)>35 &&x(i)<=45)
disp(x(i))
disp('low level noise')
i = i+1;
elseif (x(i)>45 &&x(i)<=65)
disp(x(i))
disp('medium level noise')
i = i+1;
else
disp(x(i))
disp('high level  noise')
i = i+1;
end
end 

%% Accelerometer
%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: G:\pavan_matlab\MBD\data_sensor.csv
%
% Auto-generated by MATLAB on 20-Dec-2020 18:09:54

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 31);

% Specify range and delimiter
opts.DataLines = [3, Inf];
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["ACCELEROMETERXms", "ACCELEROMETERYms", "ACCELEROMETERZms", "GRAVITYXms", "GRAVITYYms", "GRAVITYZms", "LINEARACCELERATIONXms", "LINEARACCELERATIONYms", "LINEARACCELERATIONZms", "GYROSCOPEXrads", "GYROSCOPEYrads", "GYROSCOPEZrads", "LIGHTlux", "MAGNETICFIELDXT", "MAGNETICFIELDYT", "MAGNETICFIELDZT", "ORIENTATIONZazimuth", "ORIENTATIONXpitch", "ORIENTATIONYroll", "PROXIMITYi", "SOUNDLEVELdB", "LOCATIONLatitude", "LOCATIONLongitude", "LOCATIONAltitudeM", "LOCATIONAltitudegoogleM", "LOCATIONSpeedKmh", "LOCATIONAccuracyM", "LOCATIONORIENTATION", "SatellitesInRange", "TimeSinceStartInMs", "YYYYMODDHHMISS_SSS"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "string", "string", "string", "double", "string", "string", "string", "categorical", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";

% Specify variable properties
opts = setvaropts(opts, ["LOCATIONLatitude", "LOCATIONLongitude", "LOCATIONAltitudeM", "LOCATIONSpeedKmh", "LOCATIONAccuracyM", "LOCATIONORIENTATION", "YYYYMODDHHMISS_SSS"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["LOCATIONLatitude", "LOCATIONLongitude", "LOCATIONAltitudeM", "LOCATIONSpeedKmh", "LOCATIONAccuracyM", "LOCATIONORIENTATION", "SatellitesInRange", "YYYYMODDHHMISS_SSS"], "EmptyFieldRule", "auto");

% Import the data
tbl = readtable("Team_1_Data_Set.xlsx", opts);

%% Convert to output type
ACCELEROMETERXms = tbl.ACCELEROMETERXms;
ACCELEROMETERYms = tbl.ACCELEROMETERYms;
ACCELEROMETERZms = tbl.ACCELEROMETERZms;
GRAVITYXms = tbl.GRAVITYXms;
GRAVITYYms = tbl.GRAVITYYms;
GRAVITYZms = tbl.GRAVITYZms;
LINEARACCELERATIONXms = tbl.LINEARACCELERATIONXms;
LINEARACCELERATIONYms = tbl.LINEARACCELERATIONYms;
LINEARACCELERATIONZms = tbl.LINEARACCELERATIONZms;
GYROSCOPEXrads = tbl.GYROSCOPEXrads;
GYROSCOPEYrads = tbl.GYROSCOPEYrads;
GYROSCOPEZrads = tbl.GYROSCOPEZrads;
LIGHTlux = tbl.LIGHTlux;
MAGNETICFIELDXT = tbl.MAGNETICFIELDXT;
MAGNETICFIELDYT = tbl.MAGNETICFIELDYT;
MAGNETICFIELDZT = tbl.MAGNETICFIELDZT;
ORIENTATIONZazimuth = tbl.ORIENTATIONZazimuth;
ORIENTATIONXpitch = tbl.ORIENTATIONXpitch;
ORIENTATIONYroll = tbl.ORIENTATIONYroll;
PROXIMITYi = tbl.PROXIMITYi;
SOUNDLEVELdB = tbl.SOUNDLEVELdB;
LOCATIONLatitude = tbl.LOCATIONLatitude;
LOCATIONLongitude = tbl.LOCATIONLongitude;
LOCATIONAltitudeM = tbl.LOCATIONAltitudeM;
LOCATIONAltitudegoogleM = tbl.LOCATIONAltitudegoogleM;
LOCATIONSpeedKmh = tbl.LOCATIONSpeedKmh;
LOCATIONAccuracyM = tbl.LOCATIONAccuracyM;
LOCATIONORIENTATION = tbl.LOCATIONORIENTATION;
SatellitesInRange = tbl.SatellitesInRange;
TimeSinceStartInMs = tbl.TimeSinceStartInMs;
YYYYMODDHHMISS_SSS = tbl.YYYYMODDHHMISS_SSS;


%% Import the data
[input0_0] = xlsread('Team_1_Data_Set.xlsx','A2:C28');
[input0_1] = xlsread('Team_1_Data_Set.xlsx','AD2:AD28');
input = [input0_0,input0_1];

%% Create output variable
data = input;

%% Create table
data1 = table;

%% Allocate imported array to column variable names
data1.ACCELEROMETERXms = data(:,1);
data1.ACCELEROMETERYms = data(:,2);
data1.ACCELEROMETERZms = data(:,3);
data1.Timesincestartinms = data(:,4);
%% Clear temporary variables
clear opts tb1 input0_0 input0_1 R
% steps_acceleration
% Counts No of Steps from Acceleration Data
ax=data1.ACCELEROMETERXms;
ay=data1.ACCELEROMETERYms;
az=data1.ACCELEROMETERZms;
t=data1.Timesincestartinms;
stepcount = 0;
% Changes in Acceleration Sensors will indicate steps
disp('Walking')
length = sqrt(sum(ax.^2 + ay.^2 + az.^2, 2));
disp(length);
% Plot magnitude
subplot(4,4,6);
stem(t, length);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Magnitude')
% Remove effects of gravitity
magNoGrav = length - mean(length);
subplot(4,4,7);
stem(t, magNoGrav);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('No Gravity')
% Absolute magnitude
amag = abs(magNoGrav);
subplot(4,4,8);
stem(t, amag);
title('Absolute Magnitude')
xlabel('Time (s)');
ylabel('Acceleration Magnitude, No Gravity (m/s^2)');
% step counting
if(length>=2)
    stepcount = stepcount+1;
    disp('stepcount')
end
%% Functions
function findpower(lightint, prsntar)
 power = lightint .* prsntar;
 toplot(lightint, power);
 function toplot(light_intensity, power)
   subplot(4,4,10);
   plot(light_intensity);
   title("Light intensity");
   xlabel("Time");
   ylabel("Light intensity(LUX)");
   subplot(4,4,11);
   plot(power);
   title("Power");
   xlabel("Time");
  ylabel("Power(watts)");
 end
end
function brightness_level(light_intensity)
 for index = 1:44
    if light_intensity(index,1) <= 100
         disp("Dark");
    end
    if (100 < light_intensity(index,1) < 200) 
         disp("Moderate");
    end
     if light_intensity(index,1) > 200
         disp("Bright");
     end
 end
end
