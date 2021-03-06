%%% Minimal Opioid and Sedative Concentrations for Anesthetic
% In this example, we determine the minimal concentrations of an opioid and
% sedative that produce an effective anesthetic.  We develop a mathematical
% model to describe the relationship between drug concentration and
% anesthetic response, and then use the model to determine minimal dosages.
% 
% Copyright 2011 The MathWorks, Inc.

%% Import Drug Interaction Data from Excel
% Import experimental data using importfile function (auto-generated by
% import wizard).

importfile('ResponseData.xls')

%% Create 3D Visualization to Examine Influences
% Create 3D scatter plots that shows how tetany and pressure responses
% change with drug concentrations.

createfigure(opioid, sedative, tetany, pressure)

%% Fit Surface to Pressure and Tetany Responses
% Fit the response to the following formula:
% 
% $$R = \frac{(\frac{C_o}{IC50_o}+\frac{C_s}{IC50_s}+
% \alpha\frac{C_o}{IC50_o}\frac{C_s}{IC50_s})^n}
% {1+(\frac{C_o}{IC50_o}+\frac{C_s}{IC50_s}+
% \alpha\frac{C_o}{IC50_o}\frac{C_s}{IC50_s})^n}$$
%
% Tetany Response
[tFit, gof1] = createSurfaceFit(opioid,sedative,tetany);

% Pressure Response
[pFit, gof2] = createSurfaceFit(opioid,sedative,pressure);

%% Determine Minimal Drug Concentrations that Produces Sufficient Response
% Call custom function called minDosage.m, which calculates minimimal drug 
% concentrations that produce pressure and tetany responses > 0.98.  

minDosage(tFit,pFit)
