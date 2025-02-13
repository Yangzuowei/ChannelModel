%%
clear all;
addpath(pwd + "\Utility");

%% QPSK
seIdxSetAll = cell(1,1000); nPrbSetAll = cell(1,1000);
snrdBSetAll = cell(1,1000); nSymSetAll = cell(1,1000);
cbBlerListSetAll = cell(1,1000); tbBlerListSetAll = cell(1,1000);

fileNameList = ["DynErr\blerMatQPSK_PRB1.mat" "DynErr\blerMatQPSK_PRB2.mat"...
                "DynErr\blerMatQPSK_PRB5.mat" "DynErr\blerMatQPSK_PRB10.mat"...
                "DynErr\blerMatQPSK_PRB20.mat" "DynErr\blerMatQPSK_PRB50.mat"...
                "DynErr\blerMatQPSK_PRB100.mat" ...
                "ConstErr\blerMatQPSK_PRB10.mat" "ConstErr\blerMatQPSK_PRB15.mat"...
                "ConstErr\blerMatQPSK_PRB20.mat" "ConstErr\blerMatQPSK_PRB25.mat"...
                "ConstErr\blerMatQPSK_PRB30.mat" "ConstErr\blerMatQPSK_PRB40.mat"...
                "ConstErr\blerMatQPSK_PRB50.mat" "ConstErr\blerMatQPSK_PRB70.mat"];
cntItem = 0;
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx);
    load(theFileName, 'snrdB_List', 'nPrb', 'cbBlerMatrix', 'tbBlerMatrix');
    for seIdx = 1:16
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 12; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerMatrix(seIdx, :);
        tbBlerListSetAll{cntItem} = tbBlerMatrix(seIdx, :);
    end
end

fileNameList = ["AlignWith5GMAX\blerMatQPSK_PRB8_SYM9.mat"...
                "AlignWith5GMAX\blerMatQPSK_PRB16_SYM9.mat"...
                "AlignWith5GMAX\blerMatQPSK_PRB16_SYM10.mat"...
                "AlignWith5GMAX\blerMatQPSK_PRB32_SYM9.mat"];
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx);
    load(theFileName, 'snrdB_List', 'nPrb', 'nSymbol', 'cbBlerMatrix', 'tbBlerMatrix');
    for seIdx = 7:16
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = nSymbol; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerMatrix(seIdx, :);
        tbBlerListSetAll{cntItem} = tbBlerMatrix(seIdx, :);
    end
end

fileNameList = ["BGN1_NCB1.mat" "BGN1_NCB2.mat"...
                "BGN2_NCB1.mat" "BGN2_NCB2.mat"];
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx); load(theFileName);
    for itemIdx = 1:size(seIdxSet, 2)
        seIdx = seIdxSet{itemIdx}; nPrb = nPrbSet{itemIdx}; 
        if seIdx > 16
            continue;
        end
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 12; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerListSet{itemIdx};
        tbBlerListSetAll{cntItem} = tbBlerListSet{itemIdx};
    end
end

fileNameList = ["BGN1_NCB1_SYM10.mat"];
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx); load(theFileName);
    for itemIdx = 1:size(seIdxSet, 2)
        seIdx = seIdxSet{itemIdx}; nPrb = nPrbSet{itemIdx}; 
        if seIdx > 16
            continue;
        end
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 10; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerListSet{itemIdx};
        tbBlerListSetAll{cntItem} = tbBlerListSet{itemIdx};
    end
end

theFileName = "SampleData\testData_SE12_CB1.mat"; startPRBIdx = 1; endPRBIdx = 15; seIdx = 12;
load(theFileName, 'snrdB_List', 'testPRB_list', 'cbBlerMatrix', 'tbBlerMatrix');
for prbIdx = startPRBIdx:endPRBIdx
    cntItem = cntItem + 1;
    seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = testPRB_list(prbIdx);
    nSymSetAll{cntItem} = 12; snrdBSetAll{cntItem} = snrdB_List;
    cbBlerListSetAll{cntItem} = cbBlerMatrix(prbIdx, :);
    tbBlerListSetAll{cntItem} = tbBlerMatrix(prbIdx, :);
end

theFileName = "SampleData\testData_SE12.mat"; startPRBIdx = 1; endPRBIdx = 18; seIdx = 12;
load(theFileName, 'snrdB_List', 'testPRB_list', 'cbBlerMatrix', 'tbBlerMatrix');
for prbIdx = startPRBIdx:endPRBIdx
    cntItem = cntItem + 1;
    seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = testPRB_list(prbIdx);
    nSymSetAll{cntItem} = 12; snrdBSetAll{cntItem} = snrdB_List;
    cbBlerListSetAll{cntItem} = cbBlerMatrix(prbIdx, :);
    tbBlerListSetAll{cntItem} = tbBlerMatrix(prbIdx, :);
end

seIdxSetAll = seIdxSetAll(1:cntItem); nPrbSetAll = nPrbSetAll(1:cntItem);
snrdBSetAll = snrdBSetAll(1:cntItem); nSymSetAll = nSymSetAll(1:cntItem);
cbBlerListSetAll = cbBlerListSetAll(1:cntItem); tbBlerListSetAll = tbBlerListSetAll(1:cntItem);
save("4QAMSampleSet.mat", 'seIdxSetAll', 'nPrbSetAll', 'snrdBSetAll', 'nSymSetAll',...
     'cbBlerListSetAll', 'tbBlerListSetAll');


%% 16QAM
seIdxSetAll = cell(1,1000); nPrbSetAll = cell(1,1000);
snrdBSetAll = cell(1,1000); nSymSetAll = cell(1,1000);
cbBlerListSetAll = cell(1,1000); tbBlerListSetAll = cell(1,1000);

fileNameList = ["DynErr\blerMat16QAM_PRB5.mat" "DynErr\blerMat16QAM_PRB10.mat"...
                "DynErr\blerMat16QAM_PRB20.mat" "DynErr\blerMat16QAM_PRB50.mat"...
                "ConstErr\blerMat16QAM_PRB10.mat" "ConstErr\blerMat16QAM_PRB15.mat"...
                "ConstErr\blerMat16QAM_PRB20.mat" "ConstErr\blerMat16QAM_PRB30.mat"...
                "ConstErr\blerMat16QAM_PRB50.mat"];
cntItem = 0;
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx);
    load(theFileName, 'snrdB_List', 'nPrb', 'cbBlerMatrix', 'tbBlerMatrix');
    for seIdx = 17:23
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 12; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerMatrix(seIdx, :);
        tbBlerListSetAll{cntItem} = tbBlerMatrix(seIdx, :);
    end
end

fileNameList = ["AlignWith5GMAX\blerMat16QAM_PRB8_SYM9.mat"...
                "AlignWith5GMAX\blerMat16QAM_PRB16_SYM9.mat"...
                "AlignWith5GMAX\blerMat16QAM_PRB16_SYM10.mat"...
                "AlignWith5GMAX\blerMat16QAM_PRB32_SYM9.mat"];
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx);
    load(theFileName, 'snrdB_List', 'nPrb', 'nSymbol', 'cbBlerMatrix', 'tbBlerMatrix');
    for seIdx = 17:23
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = nSymbol; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerMatrix(seIdx, :);
        tbBlerListSetAll{cntItem} = tbBlerMatrix(seIdx, :);
    end
end

fileNameList = ["BGN1_NCB1.mat" "BGN1_NCB2.mat"...
                "BGN2_NCB1.mat" "BGN2_NCB2.mat"];
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx); load(theFileName);
    for itemIdx = 1:size(seIdxSet, 2)
        seIdx = seIdxSet{itemIdx}; nPrb = nPrbSet{itemIdx}; 
        if (seIdx < 17 || seIdx > 23)
            continue;
        end
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 12; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerListSet{itemIdx};
        tbBlerListSetAll{cntItem} = tbBlerListSet{itemIdx};
    end
end

fileNameList = ["BGN1_NCB1_SYM10.mat"];
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx); load(theFileName);
    for itemIdx = 1:size(seIdxSet, 2)
        seIdx = seIdxSet{itemIdx}; nPrb = nPrbSet{itemIdx}; 
        if (seIdx < 17 || seIdx > 23)
            continue;
        end
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 10; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerListSet{itemIdx};
        tbBlerListSetAll{cntItem} = tbBlerListSet{itemIdx};
    end
end

seIdxSetAll = seIdxSetAll(1:cntItem); nPrbSetAll = nPrbSetAll(1:cntItem);
snrdBSetAll = snrdBSetAll(1:cntItem); nSymSetAll = nSymSetAll(1:cntItem);
cbBlerListSetAll = cbBlerListSetAll(1:cntItem); tbBlerListSetAll = tbBlerListSetAll(1:cntItem);
save("16QAMSampleSet.mat", 'seIdxSetAll', 'nPrbSetAll', 'snrdBSetAll', 'nSymSetAll',...
     'cbBlerListSetAll', 'tbBlerListSetAll');

%% 64QAM
seIdxSetAll = cell(1,1000); nPrbSetAll = cell(1,1000);
snrdBSetAll = cell(1,1000); nSymSetAll = cell(1,1000);
cbBlerListSetAll = cell(1,1000); tbBlerListSetAll = cell(1,1000);

fileNameList = ["DynErr\blerMat64QAM_PRB10.mat"...
                "ConstErr\blerMat64QAM_PRB5.mat" "ConstErr\blerMat64QAM_PRB10.mat"...
                "ConstErr\blerMat64QAM_PRB15.mat" "ConstErr\blerMat64QAM_PRB20.mat"...
                "ConstErr\blerMat64QAM_PRB30.mat" "ConstErr\blerMat64QAM_PRB50.mat"];
cntItem = 0;
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx);
    load(theFileName, 'snrdB_List', 'nPrb', 'cbBlerMatrix', 'tbBlerMatrix');
    for seIdx = 24:35
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 12; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerMatrix(seIdx, :);
        tbBlerListSetAll{cntItem} = tbBlerMatrix(seIdx, :);
    end
end

fileNameList = ["AlignWith5GMAX\blerMat64QAM_PRB8_SYM9.mat"...
                "AlignWith5GMAX\blerMat64QAM_PRB16_SYM9.mat"...
                "AlignWith5GMAX\blerMat64QAM_PRB16_SYM10.mat"...
                "AlignWith5GMAX\blerMat64QAM_PRB32_SYM9.mat"];
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx);
    load(theFileName, 'snrdB_List', 'nPrb', 'nSymbol', 'cbBlerMatrix', 'tbBlerMatrix');
    for seIdx = 24:35
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = nSymbol; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerMatrix(seIdx, :);
        tbBlerListSetAll{cntItem} = tbBlerMatrix(seIdx, :);
    end
end

fileNameList = ["BGN1_NCB1.mat" "BGN1_NCB2.mat"...
                "BGN2_NCB1.mat" "BGN2_NCB2.mat"];
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx); load(theFileName);
    for itemIdx = 1:size(seIdxSet, 2)
        seIdx = seIdxSet{itemIdx}; nPrb = nPrbSet{itemIdx}; 
        if (seIdx < 24 || seIdx > 35)
            continue;
        end
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 12; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerListSet{itemIdx};
        tbBlerListSetAll{cntItem} = tbBlerListSet{itemIdx};
    end
end

fileNameList = ["BGN1_NCB1_SYM10.mat"];
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx); load(theFileName);
    for itemIdx = 1:size(seIdxSet, 2)
        seIdx = seIdxSet{itemIdx}; nPrb = nPrbSet{itemIdx}; 
        if (seIdx < 24 || seIdx > 35)
            continue;
        end
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 10; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerListSet{itemIdx};
        tbBlerListSetAll{cntItem} = tbBlerListSet{itemIdx};
    end
end

seIdxSetAll = seIdxSetAll(1:cntItem); nPrbSetAll = nPrbSetAll(1:cntItem);
snrdBSetAll = snrdBSetAll(1:cntItem); nSymSetAll = nSymSetAll(1:cntItem);
cbBlerListSetAll = cbBlerListSetAll(1:cntItem); tbBlerListSetAll = tbBlerListSetAll(1:cntItem);
save("64QAMSampleSet.mat", 'seIdxSetAll', 'nPrbSetAll', 'snrdBSetAll', 'nSymSetAll',...
     'cbBlerListSetAll', 'tbBlerListSetAll');


%% 256QAM
seIdxSetAll = cell(1,1000); nPrbSetAll = cell(1,1000);
snrdBSetAll = cell(1,1000); nSymSetAll = cell(1,1000);
cbBlerListSetAll = cell(1,1000); tbBlerListSetAll = cell(1,1000);

fileNameList = ["DynErr\blerMat256QAM_PRB1.mat" "DynErr\blerMat256QAM_PRB2.mat"...
                "DynErr\blerMat256QAM_PRB4.mat" "DynErr\blerMat256QAM_PRB5.mat"...
                "DynErr\blerMat256QAM_PRB8.mat" "DynErr\blerMat256QAM_PRB10.mat"];
cntItem = 0;
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx);
    load(theFileName, 'snrdB_List', 'nPrb', 'cbBlerMatrix', 'tbBlerMatrix');
    for seIdx = 36:43
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 12; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerMatrix(seIdx, :);
        tbBlerListSetAll{cntItem} = tbBlerMatrix(seIdx, :);
    end
end

fileNameList = ["BGN1_NCB1.mat" "BGN1_NCB2.mat"...
                "BGN2_NCB1.mat" "BGN2_NCB2.mat"];
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx); load(theFileName);
    for itemIdx = 1:size(seIdxSet, 2)
        seIdx = seIdxSet{itemIdx}; nPrb = nPrbSet{itemIdx}; 
        if (seIdx < 36)
            continue;
        end
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 12; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerListSet{itemIdx};
        tbBlerListSetAll{cntItem} = tbBlerListSet{itemIdx};
    end
end

fileNameList = ["BGN1_NCB1_SYM10.mat"];
for fileIdx = 1:size(fileNameList, 2)
    theFileName = "SampleData\" + fileNameList(fileIdx); load(theFileName);
    for itemIdx = 1:size(seIdxSet, 2)
        seIdx = seIdxSet{itemIdx}; nPrb = nPrbSet{itemIdx}; 
        if (seIdx < 36)
            continue;
        end
        cntItem = cntItem + 1;
        seIdxSetAll{cntItem} = seIdx; nPrbSetAll{cntItem} = nPrb;
        nSymSetAll{cntItem} = 10; snrdBSetAll{cntItem} = snrdB_List;
        cbBlerListSetAll{cntItem} = cbBlerListSet{itemIdx};
        tbBlerListSetAll{cntItem} = tbBlerListSet{itemIdx};
    end
end

seIdxSetAll = seIdxSetAll(1:cntItem); nPrbSetAll = nPrbSetAll(1:cntItem);
snrdBSetAll = snrdBSetAll(1:cntItem); nSymSetAll = nSymSetAll(1:cntItem);
cbBlerListSetAll = cbBlerListSetAll(1:cntItem); tbBlerListSetAll = tbBlerListSetAll(1:cntItem);
save("256QAMSampleSet.mat", 'seIdxSetAll', 'nPrbSetAll', 'snrdBSetAll', 'nSymSetAll',...
     'cbBlerListSetAll', 'tbBlerListSetAll');

