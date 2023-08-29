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
% load('BPSK_data.mat');
% load('QPSK_data.mat');
% load('PSK8_data.mat');
% load('QAM16_data.mat');
% load('OFDM_5_data.mat');

% a = BPSK_data;
% b = QPSK_data;
% c = PSK8_data;
% d = QAM16_data;
% e = OFDM_5_data;

N = 5000;

% ***********************************************************************************************
% original signals
signalcell_5000 = cell(25000,1);
a = a(1:N,:);
b = b(1:N,:);
c = c(1:N,:);
d = d(1:N,:);
e = e(1:N,:);

signal5000 = [a;b;c;d;e];

for i = 1:numel(signal5000)
    signalcell_5000{i} = signal5000(i);
end
% writecell(signalcell_5000,'NewSignalcell5000_10.dat')
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

amplitude_5000 = cell(25000,1);
amplitude_5000 = [BPSKamplitude;QPSKamplitude;PSK8amplitude;QAM16amplitude;OFDMamplitude];
% writecell(amplitude_5000,'NewAmplitude5000_10.dat')
%***********************************************************************************************
% calculate the frequency of x
dataset5000 = {a,b,c,d,e};
numRepeats = 200;
numPointsInRange = 0;
f5000= [];
for i = 1:numel(dataset5000)
    f5000 = [f5000;dataset5000{i}];
end

freq = {};
for i = 1:length(f5000)
    signal = f5000(i);  
    s_real = real(signal);
    x = (1:200) .* s_real;  % multiply by 1 to 200
    freq{i} = sum(abs(x) <= 0.1);
end

freq5000 = freq';
% writecell(freq5000,'NewFreq5000_10.dat');
%**********************************************************************************
% calculate the frequency of y
freqY = {};
for i = 1:length(f5000)
    signal = f5000(i);  
    s_imag = imag(signal);
    y = (1:200) .* s_imag;  

    freqY{i} = sum(abs(y) <= 0.1);
end

freqY5000 = freqY';
% writecell(freqY5000,'NewFreqY5000_10.dat');
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

angle_5000 = cell(25000,1);
angle_5000 = [BPSKangle;QPSKangle;PSK8angle;QAM16angle;OFDMangle];
% writecell(angle_5000,'NewAngle5000_10.dat')
% ***********************************************************************************************
% output
out_5000 = cell(25000,1);

for i = 1:5000
    out_5000{i} = 'BPSK';
end

for i = 5001:10000
    out_5000{i} = 'QPSK';
end

for i = 10001:15000
    out_5000{i} = '8PSK';
end

for i = 15001:20000
    out_5000{i} = '16QAM';
end

for i = 20001:25000
    out_5000{i} = 'OFDM';
end
% writecell(out_5000,'NewOut5000.dat')
%**********************************************************************************
%in5_5000 = [cell2table(signalcell_5000),cell2table(amplitude_5000),cell2table(freq5000),cell2table(freqY5000),cell2table(angle_5000),cell2table(out_5000)];
in3_5000 = [cell2table(signalcell_5000),cell2table(amplitude_5000),cell2table(freq5000),cell2table(out_5000)];
writetable(in3_5000,'In3_5000_real.dat')
%**********************************************************************************
