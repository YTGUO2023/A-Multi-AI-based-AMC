addpath("dataset\features\real\")


load('data_BPSK.mat');
load('data_QPSK.mat');
load('data_8PSK.mat');
load('data_16QAM.mat');
load('data_OFDM_5.mat');

a = data_BPSK';
b = data_QPSK';
c = data_8PSK';
d = data_16QAM';
e = data_OFDM_5;

N = 500;

% ***********************************************************************************************
% original signals
signalcell_500 = cell(2500,1);
a = a(1:N,:);
b = b(1:N,:);
c = c(1:N,:);
d = d(1:N,:);
e = e(1:N,:);

signal500 = [a;b;c;d;e];

for i = 1:numel(signal500)
    signalcell_500{i} = signal500(i);
end

% writecell(signalcell_500,'Signalcell500_real.dat')
% ***********************************************************************************************
% calculate the amplitude of signals
BPSKamplitude = {};

for i = 1:N
    BPSKamplitude{i} = abs(a(i));
    BPSKamplitude = [BPSKamplitude;BPSKamplitude{i}];
end

BPSKamplitude = BPSKamplitude(1:N,1);

QPSKamplitude = {};

for i = 1:N
    QPSKamplitude{i} = abs(b(i));
    QPSKamplitude = [QPSKamplitude;QPSKamplitude{i}];
end

QPSKamplitude = QPSKamplitude(1:N,1);

PSK8amplitude = {};

for i = 1:N
    PSK8amplitude{i} = abs(c(i));
    PSK8amplitude = [PSK8amplitude;PSK8amplitude{i}];
end

PSK8amplitude = PSK8amplitude(1:N,1);

QAM16amplitude = {};

for i = 1:N
    QAM16amplitude{i} = abs(d(i));
    QAM16amplitude = [QAM16amplitude;QAM16amplitude{i}];
end

QAM16amplitude = QAM16amplitude(1:N,1);

OFDMamplitude = {};

for i = 1:N
    OFDMamplitude{i} = abs(e(i));
    OFDMamplitude = [OFDMamplitude;OFDMamplitude{i}];
end

OFDMamplitude = OFDMamplitude(1:N,1);

amplitude_500 = cell(2500,1);
amplitude_500 = [BPSKamplitude;QPSKamplitude;PSK8amplitude;QAM16amplitude;OFDMamplitude];
% writecell(amplitude_500,'Amplitude500_real.dat')
% ***********************************************************************************************
% calculate the frequency of x
dataset500 = {a,b,c,d,e};
numRepeats = 200;
numPointsInRange = 0;
f500= [];
for i = 1:numel(dataset500)
    f500 = [f500;dataset500{i}];
end

freq = {};
for i = 1:length(f500)
    signal = f500(i);  
    s_real = real(signal);
    x = (1:200) .* s_real;  % multiply by 1 to 200
    
    freq{i} = sum(abs(x) <= 0.1);

end

freq500 = freq';
% writecell(freq500,'Freq500_real.dat');
%**********************************************************************************
% calculate the frequency of y
freqY = {};
for i = 1:length(f500)
    signal = f500(i);  
    s_imag = imag(signal);
    y = (1:200) .* s_imag;  

    freqY{i} = sum(abs(y) <= 0.1);

end

freqY500 = freqY';
% writecell(freqY500,'FreqY500_real.dat');
%**********************************************************************************
% calculate the phase of signals
BPSKangle = {};

for i = 1:N
    BPSKangle{i} = angle(a(i));
    BPSKangle = [BPSKangle;BPSKangle{i}];
end

BPSKangle = BPSKangle(1:N,1);

QPSKangle = {};

for i = 1:N
    QPSKangle{i} = angle(b(i));
    QPSKangle = [QPSKangle;QPSKangle{i}];
end

QPSKangle = QPSKangle(1:N,1);

PSK8angle = {};

for i = 1:N
    PSK8angle{i} = angle(c(i));
    PSK8angle = [PSK8angle;PSK8angle{i}];
end

PSK8angle = PSK8angle(1:N,1);

QAM16angle = {};

for i = 1:N
    QAM16angle{i} = angle(d(i));
    QAM16angle = [QAM16angle;QAM16angle{i}];
end

QAM16angle = QAM16angle(1:N,1);

OFDMangle = {};

for i = 1:N
    OFDMangle{i} = angle(e(i));
    OFDMangle = [OFDMangle;OFDMangle{i}];
end

OFDMangle = OFDMangle(1:N,1);

angle_500 = cell(2500,1);
angle_500 = [BPSKangle;QPSKangle;PSK8angle;QAM16angle;OFDMangle];
% writecell(angle_500,'Angle500_real.dat')
% ***********************************************************************************************
% output
out_500 = cell(2500,1);

for i = 1:500
    out_500{i} = 'BPSK';
end

for i = 501:1000
    out_500{i} = 'QPSK';
end

for i = 1001:1500
    out_500{i} = '8PSK';
end

for i = 1501:2000
    out_500{i} = '16QAM';
end

for i = 2001:2500
    out_500{i} = 'OFDM';
end
% writecell(out_500,'Out500.dat')
%**********************************************************************************
% combine all the features and output

in3_500 = [cell2table(signalcell_500),cell2table(amplitude_500),cell2table(freq500),cell2table(freqY500),cell2table(angle_500),cell2table(out_500)];
writetable(in3_500,'In3_500_real.dat')
%**********************************************************************************
