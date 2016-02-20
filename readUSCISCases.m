function caseTable = readUSCISCases(CenterName, minNum, maxNum)
% MATLAB Function read USCIS cases in a given range. Return a table of
% resuts.
%
% Example 
% >> ct = readMultiCases('SRC', 1690135876, 1690135901)

% Author: Yu Jiang
% Email:  yu.jiang@nyu.edu

CaseNumber = minNum:maxNum;
numCase = numel(CaseNumber);
if ~isnumeric(numCase) || numCase <= 1
    error('Invalid inputs')
end

CaseStatus = cell(numCase,1);

for ct = 1:numCase
    caseNum = [CenterName, num2str(minNum+ct-1)];
    CaseStatus{ct} =  localreadacase(caseNum);
end
caseTable = table(num2str(CaseNumber(:)), CaseStatus);
end

% Read status for specific case
function status = localreadacase(caseNumber)
h = webread(['http://egov.uscis.gov/casestatus/mycasestatus.do?appReceiptNum=', caseNumber]);
[si, ei] = regexp(h,'<div class="current-status-sec">.*<span class="appointment-sec-show"');
h1 = h(si:ei);
newlineIdx = regexp(h1, '\n');
status = strtrim(h1(newlineIdx(2)+1:newlineIdx(3)-1));
end
