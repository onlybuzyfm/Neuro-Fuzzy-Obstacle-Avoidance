function desnorm_data = desnormalize(normalized_data, min_val, max_val)
    % desnormalize desnormaliza los datos a su rango original
    % normalized_data: los datos normalizados (vector o matriz)
    % min_val: el valor mínimo del rango original
    % max_val: el valor máximo del rango original
    
    % Calcular el rango original
    original_range = max_val - min_val;
    
    % Desnormalizar los datos
    desnorm_data = normalized_data * original_range + min_val;
end