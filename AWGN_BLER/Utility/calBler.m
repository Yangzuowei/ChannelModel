function [theTbBler, theCbBler] = calBler(mcsIdx, nPrb, nSymbol, snrdB1, snrdB2, nSample)
    load("TablesIn3GPP.mat",...
         "TargetCodeRate_Table", "ModulationOrder_Table", "BitsPerSymbol_Table");

    pdsch = struct();
    pdsch.PRBSet = 0:(nPrb-1); pdsch.nPrb = nPrb; pdsch.nSymbol = nSymbol; pdsch.NLayers = 1;
    pdsch.TargetCodeRate = TargetCodeRate_Table(mcsIdx) / 1024;
    pdsch.Modulation = ModulationOrder_Table{mcsIdx};
    pdsch.BitsPerSymbol = BitsPerSymbol_Table(mcsIdx);

    trBlkLen = hPDSCHTBS(pdsch, 12*pdsch.nSymbol);
    outlen = 12 * pdsch.nSymbol * pdsch.nPrb * pdsch.BitsPerSymbol * pdsch.NLayers;
    
    encDL = nrDLSCH('TargetCodeRate', pdsch.TargetCodeRate);
    decDL = myNrDLSCHDec('TargetCodeRate', pdsch.TargetCodeRate, 'TransportBlockLength', trBlkLen);

    totalErr = 0; totalCb = 0; totalErrCb = 0;
    for iii = 1:nSample
        encDL.reset(); decDL.reset();
        setTransportBlock(encDL,randi([0 1],trBlkLen,1,'int8'));
        codedTrBlock = encDL(pdsch.Modulation, pdsch.NLayers, outlen, 0);
        txSoftBits = nrSymbolModulate(codedTrBlock, pdsch.Modulation);
        
        tmpFlag = rand(size(txSoftBits)) > 0.5;        
        noiseBits1 = (randn(size(txSoftBits)) + 1i * randn(size(txSoftBits))) .* db2mag(-(snrdB1+3));
        noiseBits2 = (randn(size(txSoftBits)) + 1i * randn(size(txSoftBits))) .* db2mag(-(snrdB2+3));
        noiseBits = noiseBits1 .* tmpFlag + noiseBits2 .* (1 - tmpFlag);

        rxSoftBits = nrSymbolDemodulate(txSoftBits + noiseBits, pdsch.Modulation, var(noiseBits));
        [~, nacked, cbNacked] = decDL(rxSoftBits, pdsch.Modulation, pdsch.NLayers, 0);
        
        if nacked == true
            totalErr = totalErr + 1;
        end
        
        if (size(cbNacked,1) == 0)
            totalErrCb = totalErr; totalCb = totalCb + 1;
        else
            totalErrCb = totalErrCb + sum(cbNacked); totalCb = totalCb + size(cbNacked,2);
        end
    end
    theTbBler = totalErr / nSample; theCbBler = totalErrCb / totalCb;
end
