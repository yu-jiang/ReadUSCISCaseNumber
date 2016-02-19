function status = readMyCaseStatus(caseNumber)
    % MATLAB Function to read the USCIS status for a specific case number
    
    % Author: Yu Jiang  
    % Email:  yu.jiang@nyu.edu
    h = webread(['http://egov.uscis.gov/casestatus/mycasestatus.do?appReceiptNum=', caseNumber]);
    [si, ei] = regexp(h,'<div class="current-status-sec">.*<span class="appointment-sec-show"');
    h1 = h(si:ei);
    newlineIdx = regexp(h1, '\n');
    status = strtrim(h1(newlineIdx(2)+1:newlineIdx(3)-1));
    disp(['Your case number is: ', caseNumber])
    if isempty(status)
    disp('This may not be a valid case number.')
    else
    disp(['Your current status: ', status])
    end
end
