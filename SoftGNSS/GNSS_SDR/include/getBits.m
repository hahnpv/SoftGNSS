function [bits] = getBits(trackResults, settings)
%% GETBITS returns array of bits from bitstream

[subFrameStart, activeChnList] = findPreambles(trackResults, settings);

channelNr = activeChnList(1);

nsamples       = numel(trackResults(channelNr).I_P(subFrameStart(channelNr):end));
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

% Ultimately we want 1 entire message (12.5 minutes). I don't have a sample
% that long and I don't know how to figure out when a message starts (frame
% 1, subframe 1) so for now just fill navigation_message with what you get.
nbits      = numel(bits)
nmsgs      = floor( nbits / (300*5*25));
nframes    = floor( nbits / (300*5));
nsubframes = floor( nbits / 300);
words      = nsubframes*10;

% create data structure
navigation_message = repmat({NaN*zeros(nsubframes,300)},numel(activeChnList),1);

% temporary data structure
partial_message = NaN*zeros(nframes,300);

D29Star = bits(1);
D30Star = bits(2);

% find out where we are
for n = 1:numel(activeChnList)
    for i = 1:nsubframes
        subframe = bits(300*(i-1)+3 : 300*i+2)';       % +3 because D29*, D30*
        
        for j = 1:10
            % perform parity check on each word
            [subframe(30*(j-1)+1 : 30*j)] = ...
                parityCheck(subframe(30*(j-1)+1 : 30*j), D29Star, D30Star);
            D29Star = subframe(30*j-1);
            D30Star = subframe(30*j);
        end
        
        navigation_message{n}(i,:) = logical(subframe(:)'-'0');
        
        subframeID = bin2dec(subframe(50:52));
        if subframeID >5 || subframeID <1  
           error('Wrong subframe ID , IF Data is not reliable!');
        end
        
    end
    figure;
    [r,c] = size(navigation_message{n});
    imagesc((1:c)+0.5,(1:r)+0.5,navigation_message{n});%# Plot the image
    colormap(gray);                              %# Use a gray colormap
    axis equal                                   %# Make axes grid sizes equal
    set(gca,'XTick',1:(c+1),'YTick',1:(r+1),...  %# Change some axes properties
        'XLim',[1 c+1],'YLim',[1 r+1],...
        'GridLineStyle','-','XGrid','on','YGrid','on');
end