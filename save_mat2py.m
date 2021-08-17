function save_mat2py(path_python)

    [file,path_home] = uigetfile('*.mat',...
        'Select One or More Files', ...
        'MultiSelect', 'on');
    if iscell(file)
        for i=1:length(file)
            clearvars -except path_home file path_python i
            load(file{1, i})
            cd(path_python)
            save(file{1, i}, '-v4','-regexp', '^(?!path.*$).')
            cd(path_home)
        end
    else
        load(file)
        cd(path_python)
        save(file, '-v4','-regexp', '^(?!path.*$).')
    end
    cd(path_home)
end

