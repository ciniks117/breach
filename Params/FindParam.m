function index =  FindParam(S,param)
% FINDPARAM Finds the indices of parameters given by their name for a given
% system or parameter set.
%
% Syntax: index = FindParam(Sys, param)
%     or  index = FindParam(P, param)
%
% param can be a string or a cell of string when looking for more than one
% parameter. Returns index greater than Sys.DimP for parameter(s) not
% found. (for unfound parameters, the returned indexes is compact,
% different for each parameter and the smaller index is equal to the higher
% known parameter index + 1).
%
% Example:
%
%  CreateSystem;
%  idx = FindParam(Sys, 'a');
%  idxs = FindParam(Sys, {'a','F','G'});
%

if ~isfield(S,'ParamList')
    error('FindParam:noParamList','No parameter list ...');
end

if (~iscell(param))
    param = {param};
end

index = zeros(1, numel(param));

newp = S.DimP;
if isfield(S, 'pts') % S.pts can be > S.DimP (due to properties parameters)
    newp = size(S.pts,1);
end

for i = 1:numel(param)
    found = 0;
    for j = 1:numel(S.ParamList)
        test = strcmp(S.ParamList{j},param{i});
        if (test)
            found = 1;
            index(i) = j;
        end
    end
    if (~found)
        newp = newp+1;
        index(i) = newp;
    end
end

end

