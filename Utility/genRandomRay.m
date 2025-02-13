function [rayList] = genRandomRay(numRay, powerLoss_dB, maxDelay_ns, maxFreqShift_Hz, maxPhase_Rad)
    rayList = zeros(numRay, 4);
    for idx = 1:numRay
        rayList(idx, 1) = powerLoss_dB + 10*log10(numRay);
        
        rayList(idx, 2) = max(0, rand(1) * maxDelay_ns);
        %rayList(idx, 2) = max(0, maxDelay_ns/2 + randn(1) * maxDelay_ns/4);
        
        rayList(idx, 3) = sind(rand(1) * 360) * maxFreqShift_Hz;
        %rayList(idx, 3) = (rand(1) * 2 - 1) * maxFreqShift_Hz;
        %rayList(idx, 3) = randn(1) * maxFreqShift_Hz;
        
        rayList(idx, 4) = rand(1) * maxPhase_Rad;
    end
end

