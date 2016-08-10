function settings = initSettings()
%Functions initializes and saves settings. Settings can be edited inside of
%the function, updated from the command line or updated using a dedicated
%GUI - "setSettings".  
%
%All settings are described inside function code.
%
%settings = initSettings()
%
%   Inputs: none
%
%   Outputs:
%       settings     - Receiver settings (a structure). 

%--------------------------------------------------------------------------
%                           SoftGNSS v3.0
% 
% Copyright (C) Darius Plausinaitis
% Written by Darius Plausinaitis
%--------------------------------------------------------------------------
%This program is free software; you can redistribute it and/or
%modify it under the terms of the GNU General Public License
%as published by the Free Software Foundation; either version 2
%of the License, or (at your option) any later version.
%
%This program is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%GNU General Public License for more details.
%
%You should have received a copy of the GNU General Public License
%along with this program; if not, write to the Free Software
%Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
%USA.
%--------------------------------------------------------------------------

% CVS record:
% $Id: initSettings.m,v 1.9.2.31 2006/08/18 11:41:57 dpl Exp $

%% Processing settings ====================================================
% Number of milliseconds to be processed used 36000 + any transients (see
% below - in Nav parameters) to ensure nav subframes are provided
settings.msToProcess        = 37000;        %[ms]

% Number of channels to be used for signal processing
settings.numberOfChannels   = 8;

% Move the starting point of processing. Can be used to start the signal
% processing at any point in the data record (e.g. for long records). fseek
% function is used to move the file read point, therefore advance is byte
% based only. 
settings.skipNumberOfBytes     = 4e5;%4e6; % 2*4*10*1e6 worked for 1 sat

%% Raw signal file name and other parameter ===============================
% This is a "default" name of the data file (signal record) to be used in
% the post-processing mode
%{
%CTTC works, kind of, lat/lon within 1 degree but alt is 5M feet.
% skipNumberOfBytes 1e6, msToProcess = 99000, dll=4/6, pll=50/75
% all neg doppler which is feasible but unlikely? -> neg IF gets more sats
% too?
% Now seems to work with no change... 37000, basic dll/pll, no skip
settings.fileName = ...
gps_gnuradio_4m
    'C:\Users\phahn\Data\CTTC\2013_04_04_GNSS_SIGNAL_at_CTTC_SPAIN.dat';
settings.dataType           = 'int16'; 
settings.dataSize           = 2;           % bytes
settings.fileType           = 2;
settings.IF                 = 0.;          %[Hz] 
settings.samplingFreq       = 4000000;     %[Hz]
settings.skipNumberOfBytes     = 4e6+4e5;%4e6; % 2*4*10*1e6 worked for 1 sat
%}
%{
% GNURadio Complex = pair of singles
% at 4e6 we pick up the right satellites but cant get preambles except 31.
settings.fileName = ...
    'C:\Users\phahn\Data\SDRGPS\Feb06.bin';
settings.dataType           = 'single'; 
settings.dataSize           = 4;    % bytes
settings.fileType           = 2;
settings.IF                 = 110.;      %[Hz]
settings.samplingFreq       = 2048000;     %[Hz]
%}


% 120s sample worked!
settings.fileName = ...
     'C:\Users\phahn\Data\SDRGPS\Feb6.u8'; 
%     'C:\Users\phahn\Data\RTLSDR\test_centerpoint.u8'; 
%     'C:\Users\phahn\Data\SDRGPS\Feb6.s8'; 
%    'C:\Users\phahn\Data\RTLSDR\07152016\agc.bin';
%     'C:\Users\phahn\Data\SDRGPS\Feb6.bin';     % WORKS at location 4e5
%     'C:\Users\phahn\Data\RTLSDR\120s_sample.bin';     % WORKS, IF=0, freq=2048000
%     'C:\Users\phahn\Data\park_fastgps';
%     'C:\Users\phahn\Data\SDRGPS\Feb6.bin';
settings.dataType           = 'uchar'; % they used schar instead of int8
settings.fileType           = 2;
settings.dataSize           = 1;    % bytes
settings.IF                 = 2210.53;        %[Hz]
settings.samplingFreq       = 2048000;     %[Hz]
settings.skipNumberOfBytes  = 6e6;%feb6.bin
settings.msToProcess        = 50000;        %[ms]
settings.numberOfChannels   = 5;


%{
% 120s sample worked!
settings.fileName = ...
     'C:\Users\phahn\Data\SDRGPS\Feb6.s8';     % WORKS at location 4e5
%    'C:\Users\phahn\Data\RTLSDR\07152016\agc.bin';
%     'C:\Users\phahn\Data\SDRGPS\Feb6.bin';     % WORKS at location 4e5
%     'C:\Users\phahn\Data\RTLSDR\120s_sample.bin';     % WORKS, IF=0, freq=2048000
%     'C:\Users\phahn\Data\park_fastgps';
%     'C:\Users\phahn\Data\SDRGPS\Feb6.bin';
settings.dataType           = 'schar'; % they used schar instead of int8
settings.fileType           = 2;
settings.dataSize           = 1;    % bytes
settings.IF                 = 0;        %[Hz]
%settings.IF                 = 2118.;
settings.samplingFreq       = 2048000;     %[Hz]
settings.skipNumberOfBytes  = 4e5;%feb6.bin
settings.skipNumberOfSamples  = (4e5)/2;%feb6.bin
settings.msToProcess        = 210000;        %[ms]
settings.numberOfChannels   = 5;
%}

%{
settings.fileName           = ...
   'C:\Users\phahn\Data\GNSS_signal_records\GPS_and_GIOVE_A-NN-fs16_3676-if4_1304.bin';
% NOTE: using 37000 [ms] works but 99000 [ms] did not (?)
settings.dataType           = 'schar';
settings.fileType           = 1;
settings.dataSize           = 1;    % bytes
settings.IF                 = 4.1304e6;      %[Hz]
settings.samplingFreq       = 16.3676e6;     %[Hz]
%}
% File Types
%1 - 8 bit real samples S0,S1,S2,...
%2 - 8 bit I/Q samples I0,Q0,I1,Q1,I2,Q2,...                      

settings.codeFreqBasis      = 1.023e6;      %[Hz]

% Define number of chips in a code period
settings.codeLength         = 1023;

%% Acquisition settings ===================================================
% Skips acquisition in the script postProcessing.m if set to 1
settings.skipAcquisition    = 0;
% List of satellites to look for. Some satellites can be excluded to speed
% up acquisition
settings.acqSatelliteList   = 1:32;         %[PRN numbers]
% Band around IF to search for satellite signal. Depends on max Doppler
settings.acqSearchBand      = 20;           %[kHz] total bandwidth not one side!
settings.acqSearchBin       = 250;          %[Hz]  Bin size
% Threshold for the signal presence decision rule
settings.acqThreshold       = 2.;

%% Tracking loops settings ================================================
% Code tracking loop parameters
settings.dllDampingRatio         = 0.7;
settings.dllNoiseBandwidth       =   2;       %[Hz]
settings.dllCorrelatorSpacing    = 0.5;     %[chips]

% Carrier tracking loop parameters
settings.pllDampingRatio         = 0.7;
settings.pllNoiseBandwidth       =  25;      %[Hz]

%% Navigation solution settings ===========================================

% Period for calculating pseudoranges and position
settings.navSolPeriod       = 100;          %[ms]

% Elevation mask to exclude signals from satellites at low elevation
settings.elevationMask      = 10;           %[degrees 0 - 90]
% Enable/dissable use of tropospheric correction
settings.useTropCorr        = 1;            % 0 - Off
                                            % 1 - On

% True position of the antenna in UTM system (if known). Otherwise enter
% all NaN's and mean position will be used as a reference .
settings.truePosition.E     = nan;
settings.truePosition.N     = nan;
settings.truePosition.U     = nan;

%% Plot settings ==========================================================
% Enable/disable plotting of the tracking results for each channel
settings.plotTracking       = 1;            % 0 - Off
                                            % 1 - On

%% Constants ==============================================================
settings.c                  = 299792458;    % The speed of light, [m/s]
settings.startOffset        = 68.802;       %[ms] Initial sign. travel time
% Results are insensitive to value of startOffset it is an initial guess.
