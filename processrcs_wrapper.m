% Run ProcessRCS() on all sessions of input directory
% processrcs_wrapper(<parent_dir_of_Sessions_directories>)
% processrcs_wrapper('/Users/mariaolaru/Downloads/RCS15L')
%
% maria.olaru@ucsf.edu


function [] = processrcs_wrapper(dir_name)
files = dir(fullfile(fullfile(dir_name, 'Session*'), 'Device*'));

% Run ProcessRCS() on each file
for i = 1:length(files)
    P = fullfile(files(i).folder, files(i).name);
    try
        ProcessRCS(P);
        fprintf("Processing:\n %s\n\n", P)
        %Create CSV tables
        out_matobj_fp = (P + "/AllDataTables.mat");
        load(out_matobj_fp)

        out_fp_eventlog = strcat(P, "/eventLogTable.csv");
        writetable(eventLogTable, out_fp_eventlog);
        
        subj_ID = {getfield(metaData, 'subjectID')};
        implant_side = {getfield(metaData, 'INSimplantLocation')};
        mt = table(subj_ID, implant_side);
        
        out_fp_metadata = strcat(P, "/metaData.csv");
        writetable(mt, out_fp_metadata);
         
        out_fp_timedomain = strcat(P, "/timeDomainData.csv");
        writetable(timeDomainData, out_fp_timedomain);

        out_fp_stim_settings = strcat(P, "/stimLogSettings.csv");
        writetable(stimLogSettings(:, [1, 3, 9]), out_fp_stim_settings);

        out_fp_td_settings = strcat(P, "/timeDomainSettings.csv");
        writetable(timeDomainSettings, out_fp_td_settings);
    catch
        fprintf("Failed to Process:\n %s\n\n", P)
    end
end