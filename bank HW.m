dates = datenum(2025, 3, 1:22)';  
dollar_rates = [392.07, 392.07, 392.26, 392.41, 392.81, 393.17, 393.22, 393.18, 393.18, 393.27, 393.08, 392.42, 392.42, 390.74, 390.74, 390.74, 390.74, 390.74, 391.14, 391.14, 391.14, 390.07, 390.07]';  

p = polyfit(dates, dollar_rates, 1);  

correlation_matrix = corrcoef(dates, dollar_rates);  
correlation = correlation_matrix(1, 2);  

linev = polyval(p, dates);  
midv = mean(dollar_rates);  
mainsum = sum((dollar_rates - midv).^2);  
leftsum = sum((dollar_rates - linev).^2);  
detcoef = 1 - leftsum / mainsum;  
today = datenum(datetime('today'));  
predicted_rate = polyval(p, today);  

fprintf('Correlation coefficient between dates and exchange rate: %.4f\n', correlation);  
fprintf('Coefficient of determination: %.2f\n', detcoef);  
fprintf('Possible exchange rate for today (%s): %.4f\n', datestr(today), predicted_rate);
