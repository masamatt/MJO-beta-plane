% BALANCED_CALL - Root script for the Balanced Model.
%                 This script calls scripts to do the 
%                 following: (1) define parameter variables
%                 and constants, (2) display the current
%                 parameter status, (3) compute intermediate
%                 variables needed in the computations for
%                 all 5 field variables, (4) compute each
%                 of the 5 field variables independently,
%                 (5) print the data to a text file.
%                      
% FILE:         BALANCED_CALL.m
% AUTHOR:       Matt Masarik
% DATE:         August 14 2005
% MODIFIED:     August 27 2006 - MM - added writeStatus.
% CALL SYNTAX:  BALANCED_CALL;
%
% PRE:  The following script has been called:
%               MJO_MASTER.m
%
% POST: An output text file containing the data from the
%       current Balanced Model run will be written to
%       the "output" directory.
%



% start balanced run
disp('                                          ')
disp('                                          ')
disp('        =========================         ')
disp('        *    BALANCED MODEL     *         ')
disp('        =========================         ')
disp('                                          ')
disp('                                          ')

% Balanced = 1 modelType
modelType = 1;

% Call CONSTANT_DEFINITIONS.m, initialize global constants.
CONSTANT_DEFINITIONS;

% Call VARIABLE_DEFINITIONS.m, initialize variables.
VARIABLE_DEFINITIONS;

% Compute variables needed for all 5 fields
balancedBasis;

% write record to runParameters.txt file
writeStatus;

% Call STATUS.m, wait for 10 seconds
STATUS;
disp('Sleeping for 10 seconds...');
pause(1);
disp('To ABORT run:  CTRL-C');
pause(10);

% Compute u field
disp('                                          ')
disp('                                          ')
disp('    ----------------------------------    ')
disp('            Computing u field             ')
disp('    ----------------------------------    ')
disp('                                          ')
disp('                                          ')
uBalanced;
disp('    ----------------------------------    ')
disp('          End computing u field           ')
disp('    ----------------------------------    ')
disp('                                          ')
disp('                                          ')

% Compute v field
disp('                                          ')
disp('                                          ')
disp('    ----------------------------------    ')
disp('            Computing v field             ')
disp('    ----------------------------------    ')
disp('                                          ')
disp('                                          ')
vBalanced;
disp('    ----------------------------------    ')
disp('          End computing v field           ')
disp('    ----------------------------------    ')
disp('                                          ')
disp('                                          ')

% Compute phi field
disp('                                          ')
disp('                                          ')
disp('    ----------------------------------    ')
disp('           Computing phi field            ')
disp('    ----------------------------------    ')
disp('                                          ')
disp('                                          ')
phiBalanced;
disp('    ----------------------------------    ')
disp('         End computing phi field          ')
disp('    ----------------------------------    ')
disp('                                          ')
disp('                                          ')

% Compute omegaM field
disp('                                          ')
disp('                                          ')
disp('    ----------------------------------    ')
disp('         Computing omegaM field           ')
disp('    ----------------------------------    ')
disp('                                          ')
disp('                                          ')
omegaMBalanced;
disp('    ----------------------------------    ')
disp('        End computing omegaM field        ')
disp('    ----------------------------------    ')
disp('                                          ')
disp('                                          ')

% Compute q field
disp('                                          ')
disp('                                          ')
disp('    ----------------------------------    ')
disp('            Computing q field             ')
disp('    ----------------------------------    ')
disp('                                          ')
disp('                                          ')
qBalanced;
disp('    ----------------------------------    ')
disp('          End computing q field           ')
disp('    ----------------------------------    ')
disp('                                          ')
disp('                                          ')

% Print all balanced fields to a text file
%%%bPrintResults;

% End balanced run
disp('                                          ')
disp('                                          ')
disp('        =========================         ')
disp('        *   END BALANCED MODEL  *         ')
disp('        =========================         ')
disp('                                          ')
disp('                                          ')

% END

