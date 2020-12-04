clear all
lambdas = [500:10:800];

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
    theta_spp = asind(real(nspp)/glass);
    
    clearvars -except ilm lambdas theta_spp lambda nspp FOM CX CI betas thetas glass w
    my_main_flat_gold_measurement;
    
    figure
    plot(all_records(2:end, 1), all_records(2:end, 2), 'LineWidth', 2, 'DisplayName','R')
    ylabel('FOM')
    hold on


    xlabel('\theta [deg]')
    ylabel('R')
    title([num2str(lambda*1e3) ' th0 ' num2str(theta_spp)])
    legend

    saveas(gcf,['saved_figures/SPR' '_r_' num2str(lambda) '_t_' num2str(theta_spp) '.png'])
    saveas(gcf,['saved_figures/SPR' '_r_' num2str(lambda) '_t_' num2str(theta_spp) '.fig'])

end



