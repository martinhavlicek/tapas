function indC = tapas_physio_check_get_xcon_index(SPM, cname)
% returns index of contrasts in SPM.xCon, whose name matches cname
% used to find existing contrasts in an SPM.mat
%
% INPUT:
%   SPM     - SPM.mat-file
%   cname   - name of contrast to be searched for (string)
%             (works for incomplete names/patterns as well, e.g. to find all F-contrasts)
%
% OUTPUT:
%   indC    -  vector of contrast indices in SPM.xCon with matching name
%              returns 0, if none found
%
% Author: Lars Kasper
% Created: 2014-01-21
% Copyright (C) 2014 TNU, Institute for Biomedical Engineering, University of Zurich and ETH Zurich.
%
% This file is part of the TNU CheckPhysRETROICOR toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.
%
% $Id: tapas_physio_check_get_xcon_index.m 415 2014-01-21 03:16:11Z kasperla $
for c = 1:length(SPM.xCon)
    cnames{c} = SPM.xCon(c).name;
end
indC = find(cell2mat(cellfun(@(x) ~isempty(x), strfind(cnames, cname), 'UniformOutput', false)));
if isempty(indC), indC = 0; end
end