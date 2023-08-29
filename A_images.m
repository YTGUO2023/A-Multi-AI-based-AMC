addpath("dataset\features\real\")

% load('BPSK_10_data.mat');
% load('QPSK_10_data.mat');
% load('PSK8_10_data.mat');
% load('QAM16_10_data.mat');
load('data_OFDM_5.mat');

% d1 = BPSK_10_data(1:150,1);
% d2 = QPSK_10_data(1:150,1);
% d3 = PSK8_10_data(1:150,1);
% d4 = QAM16_10_data(1:150,1);
d5 = data_OFDM_5(1:150,1);

% x1 = real(d1);
% y1 = imag(d1);
% x2 = real(d2);
% y2 = imag(d2);
% x3 = real(d3);
% y3 = imag(d3);
% x4 = real(d4);
% y4 = imag(d4);
x5 = real(d5);
y5 = imag(d5);

% minx = min(x5);
% maxx = max(x5);
% miny = min(y5);
% maxy = max(y5);
% fprintf('the range of x is %d to %d, the range of y is %d to %d',minx,maxx,miny,maxy)

% images of BPSK
% length1 = length(x1);
% 
% for i = 1:length1
%     
%     x1(i) = x1(i);
%     y1(i) = y1(i);
% 
%     % create a new figure, keep them unvisible
%     figure('Visible','off');
%     % plot the images
%     s(i) = scatter(x1(i), y1(i),'filled');
%     xlim([-3.5,3.5]);
%     ylim([-3.5,3.5]);
% %     ax = gca;
% %     ax.XAxisLocation = 'origin';
% %     ax.YAxisLocation = 'origin';
% 
%     % set the folder path and file name with serial numbers
%     save_folder = 'D:\Guo Yating\papers\yguo\Image_10\BPSK';    
%     file_name = sprintf('BPSK_%d.png', i);
%     % generate the path
%     save_path = fullfile(save_folder, file_name);
%     saveas(gcf, save_path);
% end
% 
% % images of QPSK
% length2 = length(x2);
% 
% for i = 1:length2
%     x2(i) = x2(i);
%     y2(i) = y2(i);
% 
%     figure('Visible','off');
%     
%     s(i) = scatter(x2(i), y2(i),'filled');
%     xlim([-3.5,3.5]);
%     ylim([-3.5,3.5]);
% 
%     save_folder = 'D:\Guo Yating\papers\yguo\Image_10\QPSK';  
%     
%     file_name = sprintf('QPSK_%d.png', i);
%     
%     save_path = fullfile(save_folder, file_name);
%     saveas(gcf, save_path);
% end
% 
% % images of 8PSK
% length3 = length(x3);
% 
% for i = 1:length3
%     
%     x3(i) = x3(i);
%     y3(i) = y3(i);
% 
%     figure('Visible','off');
%   
%     s(i) = scatter(x3(i), y3(i),'filled');
%     xlim([-3.5,3.5]);
%     ylim([-3.5,3.5]);
% 
%     save_folder = 'D:\Guo Yating\papers\yguo\Image_10\8PSK';  
% 
%     file_name = sprintf('8PSK_%d.png', i);
% 
%     save_path = fullfile(save_folder, file_name);
%     saveas(gcf, save_path);
% 
% end
% 
% % images of 16QAM
% length4 = length(x4);
% 
% for i = 1:length4
%     x4(i) = x4(i);
%     y4(i) = y4(i);
% 
%     figure('Visible','off');
% 
%     s(i) = scatter(x4(i), y4(i),'filled');
%     xlim([-3.5,3.5]);
%     ylim([-3.5,3.5]);
% 
%     save_folder = 'D:\Guo Yating\papers\yguo\Image_10\16QAM';  
% 
%     file_name = sprintf('16QAM_%d.png', i);
% 
%     save_path = fullfile(save_folder, file_name);
%     saveas(gcf, save_path);
% 
% end

% % images of OFDM
length5 = length(x5);

for i = 1:length5

    x5(i) = x5(i);
    y5(i) = y5(i);

    figure('Visible','off');

    s(i) = scatter(x5(i), y5(i),'filled');
    xlim([-3.5,3.5]);
    ylim([-3.5,3.5]);
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';

    save_folder = 'D:\Guo Yating\AMC_files\dataset\images\realData\OFDM';  

    file_name = sprintf('OFDM_%d.png', i);

    save_path = fullfile(save_folder, file_name);
    saveas(gcf, save_path);

end
