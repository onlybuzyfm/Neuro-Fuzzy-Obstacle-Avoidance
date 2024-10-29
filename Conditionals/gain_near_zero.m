function normalized_gain = gain_near_zero(x, scale)
    if nargin < 2
        scale = 10;
    end
    gain = exp(-scale * x);
    normalized_gain = (gain - exp(-scale)) / (1 - exp(-scale));
end