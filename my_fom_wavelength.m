clear all
lambdas = [600:10:700];

w = 1.33;
glass = 1.55;

% FOM = zeros(size(lambdas));
% CX = zeros(size(lambdas));
% CI = zeros(size(lambdas));

for ilm = 1:length(lambdas)
    disp(['wavelength ',num2str(lambdas(ilm)), '/', num2str(lambdas(end))])
    lambda = lambdas(ilm)/1000;
    gold=rix_spline(lambda,'gold_palik.txt');
    
    nspp = sqrt(gold^2 * w^2/(gold^2 + w^2));
    theta0 = asind(real(nspp)/glass);
    
    clearvars -except ilm lambdas theta0 lambda nspp FOM CX CI betas thetas glass w
    my_main_sphere_measurement;
    

    betas(ilm) = 2/lambda*pi*nspp*1E9;
    thetas(ilm) = theta0;
    FOM(ilm) = fom;
    CX(ilm) = Cx;
    CI(ilm) = Ci;
    
end


figure
plot(lambdas, FOM, 'LineWidth', 2, 'DisplayName','FOM')
ylabel('FOM')
hold on

yyaxis right
plot(lambdas, CX,'LineWidth', 2, 'DisplayName','max')
plot(lambdas, CI, 'LineWidth', 2, 'DisplayName','min')
hold off

xlabel('\lambda [nm]')
ylabel('I [a. u.]')
title('FOM: wavelength')
legend

saveas(gcf,['saved_figures/FOM_wavelength' '_r_' num2str(r*1e3) '_h_' num2str(h*1e3) '_N' num2str(N_X) '.png'])
saveas(gcf,['saved_figures/FOM_wavelength' '_r_' num2str(r*1e3) '_h_' num2str(h*1e3) '_N' num2str(N_X) '.fig'])

save('saved_data/fom.mat', 'fom');

save('saved_data/CX.mat', 'CX');

save('saved_data/CI.mat', 'CI');
