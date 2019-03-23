% WRITESTATUS - writes the current values of the variable parameters.
% 
% FILE:        writeStatus.m
% AUTHOR:      Matt Masarik
% DATE:        August 27, 2006
% MODIFIED:    N/A
% CALL SYNTAX: writeStatus;
%
% PRE:         VARIABLE_DEFINITIONS.m has been called,
%              modelType = 0 or 1, has been defined.
% POST:        The values for the current run of some variables
%              of interest are appended to the file runParameters.txt
%              located in the directory ./output


% display writing message
disp('Writing current run status to ./output/runParameters.txt...')
disp(' ')

% compose strings
% ---------------

% zonal wave number
zonalString = ['Maximum Zonal Wavenumber, M: ',int2str(mMax)];

% meridional mode
meridionalString = ['Maximum Meridional Mode, N: ',int2str(nMax)];

% phase speed of cloud cluster
cString = ['Phase speed, c = ',num2str(c),' m/s.'];

% zonal half-width of cloud cluster
a0_km = a0/1000;    % a0 expressed in kilometers
a0String = ['Zonal half-width, a0 = ',num2str(a0_km),' km.'];

% meridional e-folding width of cloud cluster
b0_km = b0/1000;
b0String = ['Meridional e-folding width, b0 = ',num2str(b0_km),' km.'];

% meridional displacement off equator of center of cloud cluster
y0_km = y0/1000;
y0String = ['Meridional displacement, y0 = ',num2str(y0_km),' km.'];

% pressure level
p_mb = p;
pString = ['Pressure level, p = ',num2str(p_mb),' mb.'];

% model type
if modelType == 0
  modelName = 'Model Type: Primitive - ';
  
  % wave component
  if waves == 0
    waveType = 'Total wave solution';
  elseif waves == 1
    waveType = 'Rossby wave';
  elseif waves == 2
    waveType = 'Mixed wave';
  elseif waves == 3
    waveType = 'Gravity wave';
  else
    waveType = 'Kelvin wave';
  end
  
  modelString = [modelName,waveType];
  clear modelName waveType
    
else
  modelString = 'Model Type: Balanced';
end

% corresponding output file name
if modelType == 0
  mName = 'prim';
else
  mName = 'bal';
  waves = 0;
end
outFileName = getOutFile(mName,p,y0,waves);

% get output type file extension
load ./matFiles/type_input.mat
if outputType == 0
  fileType = '.bin';
else
  fileType = '.txt';
end

% full output file name
outFileString = ['Output File Name: ',outFileName,fileType];

% start time of run
timeString = getTimeString();
runTimeString = ['Run start time: ',timeString];

% formatting space
space1 = '            ';


% write information
% -----------------
RUNFILE = fopen('./output/runParameters.txt','a');
fprintf(RUNFILE,'\n%s%s\n',space1,runTimeString);
fprintf(RUNFILE,'%s%s\n',space1,outFileString);
fprintf(RUNFILE,'%s%s\n',space1,modelString);
fprintf(RUNFILE,'%s%s\n',space1,zonalString);
fprintf(RUNFILE,'%s%s\n',space1,meridionalString);
fprintf(RUNFILE,'%s%s\n',space1,cString);
fprintf(RUNFILE,'%s%s\n',space1,a0String);
fprintf(RUNFILE,'%s%s\n',space1,b0String);
fprintf(RUNFILE,'%s%s\n',space1,y0String);
fprintf(RUNFILE,'%s%s\n\n',space1,pString);
fclose(RUNFILE);

% clear unneeded strings, temp variables
clear a0_km b0_km y0_km p_mb
clear zonalString meridionalString a0String b0String y0String pString
clear cString space1 modelString outFileName outFileString
clear timeString runTimeString outputType fileType RUNFILE

% done writing message
disp('Done writing run status to file.')
disp(' ')

% END

