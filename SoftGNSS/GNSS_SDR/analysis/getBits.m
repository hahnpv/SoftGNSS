function [bits] = getBits(trackResults, settings, varargin)
parser = inputParser;
parser.addParameter('Plot', true,@isscalar);
parser.parse(varargin{:});

%% GETBITS returns array of bits from bitstream

[subFrameStart, activeChnList] = findPreambles(trackResults, settings);

nsamples       = numel(trackResults(activeChnList(1)).I_P(subFrameStart(activeChnList(1)):end));

% Ultimately we want 1 entire message (12.5 minutes). I don't have a sample
% that long and I don't know how to figure out when a message starts (frame
% 1, subframe 1) so for now just fill navigation_message with what you get.
nbits      = 300*floor(nsamples/6000);     % 300 bits * 20 ms * 1 sample/msec
nmsgs      = floor( nbits / (300*5*25));
nframes    = floor( nbits / (300*5));
nsubframes = floor( nbits / 300);
words      = nsubframes*10;

% create data structure
%TODO make navigation_message a struct with dervied parameters ( gps time,
% frame / subframe / parity fail flag, etc. for data analysis and
% post-processing. Can correct out plots or null out bad data. Maybe a bad 
% frame is causing issues w/ephemeris silently and causing noise in data??? )
navigation_message = repmat({NaN*zeros(5*25,300)},numel(activeChnList),1);
gps_times = NaN*zeros(numel(activeChnList),nsubframes);

for channelNr = activeChnList
    % "-40" is the last two bits from the (incomplete) subframe, required for
    % parity check
    navBitsSamples = trackResults(channelNr).I_P(subFrameStart(channelNr) - 40 : ...
        subFrameStart(channelNr) + 6000*floor(nsamples/(300*20)) -1)';
    
    %--- Sum every 20 vales of bits to get the best estimate ------------------------
    navBits = sum( reshape(navBitsSamples, ...
        20, (size(navBitsSamples, 1) / 20)) );
    
    %--- Threshold and convert from decimal to binary -----------------------------------
    % TODO don't convert to binary
    bits = dec2bin(navBits > 0);
    
    D29Star = bits(1);
    D30Star = bits(2);
    bits = bits(3:end);
    
    for i = 1:nsubframes
        subframe = bits(300*(i-1)+1 : 300*i)';
        
        for j = 1:10
            try
            % perform parity check on each word
            [subframe(30*(j-1)+1 : 30*j)] = ...
                parityCheck(subframe(30*(j-1)+1 : 30*j), D29Star, D30Star);
            catch exc
                warning(['Parity check failed! Channel ' num2str(channelNr) ' subframe ' num2str(i) ' word ' num2str(j)]);
            end

    		% tmp - try the other parity function
            % navPartyChk expects +1, -1 not 1/0, and not dec2bin.
%        	status = navPartyChk(logical([D29Star, D30Star, subframe(30*(j-1)+1 : 30*j)]'-'0')');
%            if status == 0
%                warning(['Second Parity check failed! Channel ' num2str(channelNr) ' subframe ' num2str(i) ' word ' num2str(j)]);
%            end
			
            D29Star = subframe(30*j-1);
            D30Star = subframe(30*j);
        end
           
        subframeID = bin2dec(subframe(50:52));
        
        truncated_z_count = bin2dec(subframe(31:47));   % AKA TOW
        z_count           = truncated_z_count * 4;
        gps_time          = z_count * 1.5 - 30;         % transmitted value is NEXT subframe time!
        gps_day           =         floor(gps_time /  86400);
        gps_hour          =     floor(mod(gps_time,   86400)    / (60*60));
        navmsgcount       =         floor(gps_time / (12.5*60));
        framecount        =     floor(mod(gps_time,  (12.5*60)) / 30) + 1;
        subframecount     = floor(mod(mod(gps_time,  (12.5*60)),  30) / 6) + 1;
        
        % TODO GPS time passes parity but is errant in several locations
        disp([num2str(framecount) ' ' num2str(subframecount) ' ' num2str(gps_time)])

        navigation_message{channelNr}(5*(framecount-1)+subframecount,:) = logical(subframe(:)'-'0');
        gps_times(channelNr,i) = gps_time;
        
        if subframeID >5 || subframeID <1
            error('Wrong subframe ID , IF Data is not reliable!');
        end
    end
    
    if any (diff(gps_times(channelNr,:)) ~= 6)
        warning(['Out of order TOW in channel ' num2str(channelNr)])
    end
end

if parser.Results.Plot
    for channelNr = activeChnList
        figure;
        [r,c] = size(navigation_message{channelNr});
        imagesc((1:c)+0.5,(1:r)+0.5,navigation_message{channelNr});%# Plot the image
        colormap(gray);                              %# Use a gray colormap
        axis equal;                                   %# Make axes grid sizes equal
        set(gca,'XTick',1:(c+1),'YTick',1:(r+1),...  %# Change some axes properties
            'XLim',[1 c+1],'YLim',[1 r+1],...
            'GridLineStyle','-','XGrid','on','YGrid','on');
    end
end