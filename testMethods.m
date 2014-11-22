clf; clc;
clear all; close all;
format long g;

addpath 'filter'
addpath 'helper'
addpath 'visualize'
addpath 'transform'

%% Digram
figure;

files = getAllFiles('files');
i = 1;
filename = files{i};
filename = 'files/mov.mov';

bitDepth = 8;
offset = 1;

bitFormat = ['uint' num2str(bitDepth)];

fileID = fopen(filename);
[~,~,ext] = fileparts(filename);

bytes = fread(fileID,Inf,bitFormat);
fclose(fileID);

digram = generateNgram( 2, bytes );

visualizeDigram( digram );


%% Digram compression

figure;
subplot(1,2,1);
visualizeDigram( digram );
subplot(1,2,2);
comp = compressDigram(digram,2);
visualizeDigram( comp );

%% Trigram

filename = 'files/mov.mov';

bitDepth = 8;
bitFormat = ['uint' num2str(bitDepth)];

fileID = fopen(filename);
[~,~,ext] = fileparts(filename);

bytes = fread(fileID,Inf,bitFormat);
fclose(fileID);

trigram = generateNgram( 3, bytes, bitDepth );

visualizeTrigram(trigram);

%% Hilbert/Entropy
% 
% filename = 'files/vi.exe';
% 
% bitDepth = 8;
% bitFormat = ['uint' num2str(bitDepth)];
% 
% fileID = fopen(filename);
% [~,~,ext] = fileparts(filename);
% 
% bytes = fread(fileID,Inf,bitFormat);
% fclose(fileID);
% 
% % Format the byte stream into hilbert format
% [ Hbytes ] = hilbertTransform( bytes );
% 
% visualizeBytes( Hbytes );
% filtered = entropyFilt( Hbytes );
% imagesc(filtered);