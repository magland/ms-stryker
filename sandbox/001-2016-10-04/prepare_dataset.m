function prepare_dataset(raw_fname,output_folder,opts)

if nargin<1
    default_prepare_dataset;
    return;
end;

mkdir(output_folder);
if (isfield(opts,'geom'))
    csvwrite([output_folder,'/geom.csv'],opts.geom);
end;
system(sprintf('prv-create %s %s',raw_fname,[output_folder,'/raw.mda.prv']));
json=sprintf('{"samplerate":%g}',opts.samplerate);
write_text_file([output_folder,'/params.json'],json);

end

function default_prepare_dataset

G=load('emap64D.mat');
geom=G.emap(2:end-1,:);

raw_fname='/home/magland/dev/ms-stryker/raw_mda/2015_12_10/data003/raw.mda';
output_folder='datasets/2015_12_10-data003';
opts.samplerate=20000;
opts.geom=geom;

prepare_dataset(raw_fname,output_folder,opts);

end

function write_text_file(fname,txt)
F=fopen(fname,'w');
fprintf(F,'%s',txt);
fclose(F);
end