# ReadUSCISCaseNumber
MATLAB code to read the status of a range of USCIS cases and return them in a Table.

Tested in MATLAB R2015b

Example:

```
>> ct = readUSCISCases('SRC', 1690135896, 1690135901)


ct = 

    CaseNumber              CaseStatus          
    ---------     -----------------------

    1690135896    'Case Was Received'           
    1690135897    'Case Was Received'           
    1690135898    'Case Was Received'           
    1690135899    'Fingerprint Fee Was Received'
    1690135900    'Case Was Received'           
    1690135901    'Case Was Received'      
```
