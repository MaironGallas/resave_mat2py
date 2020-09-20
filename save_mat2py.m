function save_mat2py(path_python)

    [file,path_home] = uigetfile('*.m',...
    'Select One or More Files', ...
    'MultiSelect', 'on');

    for i=1:length(file)
        clearvars -except path_home file path_python i
        cd(path_home)
        load(file{1, i})
        cd(path_python)
        save(file{1, i}, '-v4','-regexp', '^(?!path.*$).')
    end
end

