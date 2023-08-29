% data1 = randi([0 1],5000,1);
% B_data = pskmod(data1,2);
% BPSK_10_data = awgn(B_data,10);
% scatterplot(BPSK_10_data)
% save('D:\Guo Yating\papers\yguo\SNR_10\BPSK_10_data.mat', 'BPSK_10_data');
% 
% data2 = randi([0 3],5000,1);
% Q_data = pskmod(data2,4,pi/4);
% QPSK_10_data = awgn(Q_data,10);
% scatterplot(QPSK_10_data)
% save('D:\Guo Yating\papers\yguo\SNR_10\QPSK_10_data.mat', 'QPSK_10_data');
% 
% data3 = randi([0 7],5000,1);
% P8_data = pskmod(data3,8,pi/8);
% PSK8_10_data = awgn(P8_data,10);
% scatterplot(PSK8_10_data)
% save('D:\Guo Yating\papers\yguo\SNR_10\PSK8_10_data.mat', 'PSK8_10_data');
% 
% data4 = randi([0 15],5000,1);
% Q16_data = qammod(data4,16);
% QAM16_10_data = awgn(Q16_data,10);
% scatterplot(QAM16_10_data)
% save('D:\Guo Yating\papers\yguo\SNR_10\QAM16_10_data.mat', 'QAM16_10_data');


% load('50M.mat')
% 
% O_data = waveStruct.waveform;
% OFDM_data = awgn(O_data,5);
% data_OFDM_5 = OFDM_data(1:5000,1);
% scatterplot(data_OFDM_5)
% save('D:\Guo Yating\AMC_files\dataset\features\real\data_OFDM_5.mat', 'data_OFDM_5');

