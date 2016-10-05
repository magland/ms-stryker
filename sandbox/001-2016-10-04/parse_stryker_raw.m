function parse_stryker_raw(rhd_directory,output_file_mda)

% Remember to first run mountainlab_setup.m

if (nargin<1)
    default_parse;
    return;
end;

% Test to see if mountainlab is set up
% if not, we should get an error message
% you should run mountainlab_setup.m
writemda16ui(zeros(1,1),output_file_mda);

mkdir(fileparts(output_file_mda));

arrays=cell(0,1);

files=dir(rhd_directory);
for j=1:length(files)
    fname=files(j).name;
    if (~strcmp(fname(1),'.')) % exclude . and ..
        fprintf('---------------------------------------------\n');
        fprintf('Reading %s/%s\n',rhd_directory,fname);
        X=read_RHD2000_jfm([rhd_directory,'/',fname]);
        X=X.amplifier_data;
        disp(size(X));
        arrays{end+1}=X;
    end;
end;

X=cat_timeseries(arrays);
writemda16ui(X,output_file_mda);

end

function default_parse

rhd_directory='/home/magland/dev/ms-stryker/raw/2015_12_10/data003';
output_file_mda='/home/magland/dev/ms-stryker/raw_mda/2015_12_10/data003/raw.mda';
parse_stryker_raw(rhd_directory,output_file_mda);

end

function Y=cat_timeseries(X)
M=size(X{1},1);
N=0;
for j=1:length(X)
    N=N+size(X{j},2);
end;
Y=zeros(M,N);
ii=1;
for j=1:length(X)
    Y(:,ii:ii+size(X{j},2)-1)=X{j};
    ii=ii+size(X{j},2);
end;

end