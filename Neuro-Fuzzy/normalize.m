function norm_data = normalize(data, min_val, max_val)
    % normalize normaliza los datos al rango [0, 1] dado un rango fijo
    % data: los datos originales (vector o matriz)
    % min_val: el valor mínimo del rango original
    % max_val: el valor máximo del rango original
    
    % Calcular el rango original
    original_range = max_val - min_val;
    
    % Normalizar los datos
    norm_data = (data - min_val) / original_range;
end