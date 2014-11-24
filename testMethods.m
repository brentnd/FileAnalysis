clf; clc;
clear all; close all;
format long g;

addpath 'filter'
addpath 'helper'
addpath 'visualize'
addpath 'transform'

%% Unigram
figure;

filename = 'files/image.ppm';

bitDepth = 8;

bitFormat = ['uint' num2str(bitDepth)];

fileID = fopen(filename);
bytes = fread(fileID,Inf,bitFormat);
fclose(fileID);

unigram = generateNgram( 1, bytes );

visualizeNgram( unigram );

%% Bigram
figure;

filename = 'files/text.txt';

bitDepth = 8;
offset = 1;

bitFormat = ['uint' num2str(bitDepth)];

fileID = fopen(filename);
[~,~,ext] = fileparts(filename);

bytes = fread(fileID,Inf,bitFormat);
fclose(fileID);

bigram = generateNgram( 2, bytes );

visualizeNgram( bigram );


%% Digram compression

figure;
subplot(1,2,1);
visualizeNgram( bigram );
subplot(1,2,2);
comp = compressDigram( bigram,2 );
visualizeNgram( bomp );

%% Trigram

filename = 'files/mov.mov';

bitDepth = 8;
bitFormat = ['uint' num2str(bitDepth)];

fileID = fopen(filename);
[~,~,ext] = fileparts(filename);

bytes = fread(fileID,Inf,bitFormat);
fclose(fileID);

trigram = generateNgram( 3, bytes, bitDepth );

figure;
visualizeNgram(trigram);

%% Hilbert/Entropy

filename = 'files/explorer.exe';

bitDepth = 8;
bitFormat = ['uint' num2str(bitDepth)];

fileID = fopen(filename);
[~,~,ext] = fileparts(filename);

bytes = fread(fileID,Inf,bitFormat);
fclose(fileID);

% Format the byte stream into hilbert format
[ Hbytes ] = hilbertTransform( bytes );

visualizeBytes( Hbytes );

%filtered = entropyFilt( Hbytes );
%imagesc(filtered);

%% Scratch pad

visualizeUnigram(bytes);