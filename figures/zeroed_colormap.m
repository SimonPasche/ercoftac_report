function m = zeroed_colormap(z_min, z_max)
%ZEROED_COLORMAP   Make a color map centered at the zero value.
%   ZEROED_COLORMAP(Z_MIN, ZMAX) returns a colormap (to be passed into COLORMAP)
%   such that the zero value is white, Z_MIN is blue, and Z_MAX is red.

n = 1000; % Number of colormap entries.
m = ones(n, 3);

z = linspace(z_min, z_max, n);
zero_ind = find(z >= 0, 1);

% Negative entries.
m(1:zero_ind-1, 2) = 1 - z(1:zero_ind-1) / z_min;
m(1:zero_ind-1, 1) = m(1:zero_ind-1, 2);

% Positive entries.
m(zero_ind:end, 2) = 1 - z(zero_ind:end) / z_max;
m(zero_ind:end, 3) = m(zero_ind:end, 2);
end
