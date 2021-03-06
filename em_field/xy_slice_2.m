%if correct_calculation==1 && plot_field_component==1
%    plot_field_component=7;
%elseif correct_calculation==1 && plot_field_component==2
%    plot_field_component=8;
%end

total_thickness(1)=0;
for i=1:1:length(thickness)
    total_thickness(i+1)=total_thickness(i)+thickness(i);
    if xy_slice_coordinate_z>=total_thickness(i) && xy_slice_coordinate_z<total_thickness(i+1)
        xy_slice_section_to_view=i;
        break
    end
end

u_plus=c_p(:,:,xy_slice_section_to_view);
d_minus=c_m(:,:,xy_slice_section_to_view);        

D_l_pred=total_thickness(xy_slice_section_to_view);
D_l=D_l_pred+thickness(xy_slice_section_to_view);
z_plus=xy_slice_coordinate_z-D_l_pred;
z_minus=xy_slice_coordinate_z-D_l;

if symmetry==1
    % u_plus a d_minus jsou spocitany na horni a dolni casti vrstvicky        
    %X_plus_u_plus=c_p(:,:,xy_slice_section_to_view_reduce).*exp(z_plus*1i*diag(gamma_new(:,:,matice_stejnosti_final(xy_slice_section_to_view,3))));        
    X_plus_u_plus=c_p(:,:,xy_slice_section_to_view_reduce).*exp(z_plus*1i*diag(eval(['gamma_new_' num2str(matice_stejnosti_final(xy_slice_section_to_view,3))])));        
    % pred eig je minus, ale <0 je take y_minus        
    %X_minus_d_minus=c_m(:,:,xy_slice_section_to_view_reduce).*exp(-z_minus*1i*diag(gamma_new(:,:,matice_stejnosti_final(xy_slice_section_to_view,3))));
    X_minus_d_minus=c_m(:,:,xy_slice_section_to_view_reduce).*exp(-z_minus*1i*diag(eval(['gamma_new_' num2str(matice_stejnosti_final(xy_slice_section_to_view,3))])));
elseif symmetry==2
    
    % u_plus a d_minus jsou spocitany na horni a dolni casti vrstvicky        
    %X_plus_u_plus=c_p(:,:,xy_slice_section_to_view_reduce).*exp(z_plus*1i*diag(gamma(:,:,matice_stejnosti_final(xy_slice_section_to_view,3))));        
    X_plus_u_plus=c_p(:,:,xy_slice_section_to_view).*exp(-1i*z_plus*diag(eval(['gamma_2_' num2str(matice_stejnosti_final(xy_slice_section_to_view,3))])));        
    % pred eig je minus, ale <0 je take y_minus        
    %X_minus_d_minus=c_m(:,:,xy_slice_section_to_view_reduce).*exp(-z_minus*1i*diag(gamma(:,:,matice_stejnosti_final(xy_slice_section_to_view,3))));
    X_minus_d_minus=c_m(:,:,xy_slice_section_to_view).*exp((-1)*-z_minus*1i*diag(eval(['gamma_2_' num2str(matice_stejnosti_final(xy_slice_section_to_view,3))])));
end

x_points=x_point_b*1E-6:((x_point_e-x_point_b)*1E-6/resolution_x):(x_point_e*1E-6);
y_points=y_point_b*1E-6:((y_point_e-y_point_b)*1E-6/resolution_y):(y_point_e*1E-6);

if plot_field_component==1 % E_1
    E_1=zeros(length(x_points),length(y_points));
    
    E_1_plus_eigvec=eigvec_E(:,:,matice_stejnosti_final(xy_slice_section_to_view,3));
    E_1_minus_eigvec=E_1_plus_eigvec;
    E_1_harmonics=E_1_plus_eigvec*X_plus_u_plus+E_1_minus_eigvec*X_minus_d_minus;  
elseif plot_field_component==2 % E_2
    E_2=zeros(length(x_points),length(y_points));
    
    E_2_plus_eigvec=eigvec_E(:,:,matice_stejnosti_final(xy_slice_section_to_view,3));
    E_2_minus_eigvec=E_2_plus_eigvec;
    E_2_harmonics=E_2_plus_eigvec*X_plus_u_plus+E_2_minus_eigvec*X_minus_d_minus;
    
elseif plot_field_component==3 % E_3
    E_3=zeros(length(x_points),length(y_points));
    
    H_1_plus_eigvec=eigvec_H(:,:,matice_stejnosti_final(xy_slice_section_to_view,3));
    H_1_minus_eigvec=-H_1_plus_eigvec;
    H_1_harmonics=H_1_plus_eigvec*X_plus_u_plus+H_1_minus_eigvec*X_minus_d_minus;

    H_2_plus_eigvec=eigvec_H(:,:,matice_stejnosti_final(xy_slice_section_to_view,3));
    H_2_minus_eigvec=-H_2_plus_eigvec;
    H_2_harmonics=H_2_plus_eigvec*X_plus_u_plus+H_2_minus_eigvec*X_minus_d_minus;
elseif plot_field_component==4 % H_1
    H_1=zeros(length(x_points),length(y_points));

    H_1_plus_eigvec=eigvec_H(:,:,matice_stejnosti_final(xy_slice_section_to_view,3));
    H_1_minus_eigvec=-H_1_plus_eigvec;
    H_1_harmonics=H_1_plus_eigvec*X_plus_u_plus+H_1_minus_eigvec*X_minus_d_minus;
elseif plot_field_component==5 % H_2
    H_2=zeros(length(x_points),length(y_points));
    
    H_2_plus_eigvec=eigvec_H(:,:,matice_stejnosti_final(xy_slice_section_to_view,3));
    H_2_minus_eigvec=-H_2_plus_eigvec;
    H_2_harmonics=H_2_plus_eigvec*X_plus_u_plus+H_2_minus_eigvec*X_minus_d_minus;
elseif plot_field_component==6 % H_3
    H_3=zeros(length(x_points),length(y_points));
    
    E_1_plus_eigvec=eigvec_E(:,:,matice_stejnosti_final(xy_slice_section_to_view,3));
    E_1_minus_eigvec=E_1_plus_eigvec;
    E_1_harmonics=E_1_plus_eigvec*X_plus_u_plus+E_1_minus_eigvec*X_minus_d_minus;
    
    E_2_plus_eigvec=eigvec_E(:,:,matice_stejnosti_final(xy_slice_section_to_view,3));
    E_2_minus_eigvec=E_2_plus_eigvec;
    E_2_harmonics=E_2_plus_eigvec*X_plus_u_plus+E_2_minus_eigvec*X_minus_d_minus; 
elseif plot_field_component==7 % E_1 (D_1)
    E_1=zeros(length(x_points),length(y_points));
            
    H_2_plus_eigvec=eigvec_H(:,:,matice_stejnosti_final(xz_slice_section_to_view,3));        
    E_1_plus_eigvec=eigvec_E(:,:,matice_stejnosti_final(xz_slice_section_to_view,3));    
        
    H_2_harmonics=H_2_plus_eigvec*eval(['gamma_2_' num2str(matice_stejnosti_final(xy_slice_section_to_view,3))])*(-X_plus_u_plus-X_minus_d_minus);
    E_1_harmonics=E_1_plus_eigvec*(X_plus_u_plus+X_minus_d_minus);        
elseif plot_field_component==8 % E_2 (D_2)
    E_2=zeros(length(x_points),length(y_points));
    
    E_1_plus_eigvec=eigvec_E(:,:,matice_stejnosti_final(xy_slice_section_to_view,3));
    H_1_plus_eigvec=eigvec_H(:,:,matice_stejnosti_final(xy_slice_section_to_view,3));        
        
    E_1_harmonics=E_1_plus_eigvec*(X_plus_u_plus+X_minus_d_minus);        
    E_2_harmonics=E_1_harmonics; %E_2_plus_eigvec*(X_plus_u_plus+X_minus_d_minus);        
    H_1_harmonics=H_1_plus_eigvec*eval(['gamma_2_' num2str(matice_stejnosti_final(xy_slice_section_to_view,3))])*(-X_plus_u_plus-X_minus_d_minus);
end

% indexy (i,j) pro N_X=2
% (-2,-2), (-2,-1), (-2,0), (-2,1), (-2,2)
% (-1,-2), (-1,-1), (-1,0), (-1,1), (-1,2)
%  (0,-2),  (0,-1),  (0,0),  (0,1),  (0,2)
%  (1,-2),  (1,-1),  (1,0),  (1,1),  (1,2)
%  (2,-2),  (2,-1),  (2,0),  (2,1),  (2,2)

if symmetry==1
    if symmetry_switch==1 || symmetry_switch==2
        % x-symmetry
        components_x_symmetry;
    elseif symmetry_switch==3 || symmetry_switch==4
        % y_symmetry
        components_y_symmetry;
    elseif symmetry_switch==5 || symmetry_switch==6
        % x_y symmetry
        components_x_y_symmetry_1;
    elseif symmetry_switch==7 || symmetry_switch==8
        % x_y symmetry
        error('not yet implemented')
        %components_x_y_symmetry_2;
    end
elseif symmetry==2
    components_no_symmetry;
end

exp_alpha_y_2=zeros(length(y_points),length(beta_n));
exp_alpha_x_2=zeros(length(x_points),length(alpha_m));

for y_p=1:1:length(y_points)         
    exp_alpha_y_2(y_p,:)=exp(-1i*beta_n*1E6*y_points(y_p));
end

for x_p=1:1:length(x_points)         
    exp_alpha_x_2(x_p,:)=exp(-1i*alpha_m*1E6*x_points(x_p));
end

%{
for x_p=1:1:length(x_points)
    for y_p=1:1:length(y_points)
        
        %exp_alpha_x=exp(-1i*2*pi*m_K/Lambda_x*1E6*x_points(x_p));
        %exp_alpha_y=exp(-1i*2*pi*n_K/Lambda_y*1E6*y_points(y_p));
        
        if plot_field_component==1 % E_1
            E_1(x_p,y_p)=sum((E_1_harmonics2*exp_alpha_y_2(y_p,:)').*exp_alpha_x_2(x_p,:)');
        elseif plot_field_component==2 % E_2
            E_2(x_p,y_p)=sum((E_2_harmonics2*exp_alpha_y_2(y_p,:)').*exp_alpha_x_2(x_p,:)');
        elseif plot_field_component==3 % E_3
            E_3(x_p,y_p)=sum((E_3_harmonics2*exp_alpha_y_2(y_p,:)').*exp_alpha_x_2(x_p,:)');
        elseif plot_field_component==4 % H_1
            H_1(x_p,y_p)=sum((H_1_harmonics2*exp_alpha_y_2(y_p,:)').*exp_alpha_x_2(x_p,:)');
        elseif plot_field_component==5 % H_2
            H_2(x_p,y_p)=sum((H_2_harmonics2*exp_alpha_y_2(y_p,:)').*exp_alpha_x_2(x_p,:)');
        elseif plot_field_component==6 % H_3
            H_3(x_p,y_p)=sum((H_3_harmonics2*exp_alpha_y_2(y_p,:)').*exp_alpha_x_2(x_p,:)');
        end
    end
end
%}

for y_p=1:1:length(y_points)
    
    %{
    if plot_field_component==1 % E_1            
        harmonics2_vector=E_1_harmonics2*exp_alpha_y_2(y_p,:)';
    elseif plot_field_component==2 % E_2            
        harmonics2_vector=E_2_harmonics2*exp_alpha_y_2(y_p,:)';
    elseif plot_field_component==3 % E_3            
        harmonics2_vector=E_3_harmonics2*exp_alpha_y_2(y_p,:)';
    elseif plot_field_component==4 % H_1            
        harmonics2_vector=H_1_harmonics2*exp_alpha_y_2(y_p,:)';
    elseif plot_field_component==5 % H_2            
        harmonics2_vector=H_2_harmonics2*exp_alpha_y_2(y_p,:)';
    elseif plot_field_component==6 % H_3            
        harmonics2_vector=H_3_harmonics2*exp_alpha_y_2(y_p,:)';    
    end
    %}
    
    %{
    for x_p=1:1:length(x_points)
        if plot_field_component==1 % E_1
            E_1(x_p,y_p)=sum(harmonics2_vector.*exp_alpha_x_2(x_p,:)');
        elseif plot_field_component==2 % E_2
            E_2(x_p,y_p)=sum(harmonics2_vector.*exp_alpha_x_2(x_p,:)');
        elseif plot_field_component==3 % E_3
            E_3(x_p,y_p)=sum(harmonics2_vector.*exp_alpha_x_2(x_p,:)');
        elseif plot_field_component==4 % H_1
            H_1(x_p,y_p)=sum(harmonics2_vector.*exp_alpha_x_2(x_p,:)');
        elseif plot_field_component==5 % H_2
            H_2(x_p,y_p)=sum(harmonics2_vector.*exp_alpha_x_2(x_p,:)');
        elseif plot_field_component==6 % H_3
            H_3(x_p,y_p)=sum(harmonics2_vector.*exp_alpha_x_2(x_p,:)');
        end
    end
    %}
    %%{
    if plot_field_component==1 % E_1
        E_1(:,y_p)=sum(bsxfun(@times,(E_1_harmonics2*exp_alpha_y_2(y_p,:)'),exp_alpha_x_2'));      
    elseif plot_field_component==2 % E_2
        E_2(:,y_p)=sum(bsxfun(@times,(E_2_harmonics2*exp_alpha_y_2(y_p,:)'),exp_alpha_x_2'));       
    elseif plot_field_component==3 % E_3
        E_3(:,y_p)=sum(bsxfun(@times,(E_3_harmonics2*exp_alpha_y_2(y_p,:)'),exp_alpha_x_2'));      
    elseif plot_field_component==4 % H_1
        H_1(:,y_p)=sum(bsxfun(@times,(H_1_harmonics2*exp_alpha_y_2(y_p,:)'),exp_alpha_x_2'));       
    elseif plot_field_component==5 % H_2
        H_2(:,y_p)=sum(bsxfun(@times,(H_2_harmonics2*exp_alpha_y_2(y_p,:)'),exp_alpha_x_2'));       
    elseif plot_field_component==6 % H_3
        H_3(:,y_p)=sum(bsxfun(@times,(H_3_harmonics2*exp_alpha_y_2(y_p,:)'),exp_alpha_x_2'));
    elseif plot_field_component==7 % E_1
        E_1(:,y_p)=sum(bsxfun(@times,(E_1_harmonics2*exp_alpha_y_2(y_p,:)'),exp_alpha_x_2'));
    elseif plot_field_component==8 % E_2
        E_2(:,y_p)=sum(bsxfun(@times,(E_2_harmonics2*exp_alpha_y_2(y_p,:)'),exp_alpha_x_2'));
    end
    %%}
end

if plot_field_component==1
    profile_mode=zobrazeni_pole(E_1,field_function); 
elseif plot_field_component==2
    profile_mode=zobrazeni_pole(E_2,field_function); 
elseif plot_field_component==3
    profile_mode=zobrazeni_pole(E_3,field_function); 
elseif plot_field_component==4
    profile_mode=zobrazeni_pole(H_1,field_function); 
elseif plot_field_component==5
    profile_mode=zobrazeni_pole(H_2,field_function); 
elseif plot_field_component==6
    profile_mode=zobrazeni_pole(H_3,field_function);
elseif plot_field_component==7
    E_1=E_1;
    profile_mode=zobrazeni_pole(E_1,field_function);
elseif plot_field_component==8
    size_r_index=size(r_index_1);
    for i=1:1:size_r_index(1)    
        y_beg=find(y_points>=coordinate_y_1(i)*1e-6,1,'first');   
        y_end=find(y_points>=coordinate_y_1(i+1)*1e-6,1,'first');    
        for j=1:1:size_r_index(2)        
            x_beg=find(x_points>=coordinate_x_1(j)*1e-6,1,'first');        
            x_end=find(x_points>=coordinate_x_1(j+1)*1e-6,1,'first');        
            new_epsilon(y_beg:y_end,x_beg:x_end)=r_index_1(i,j)^2;    
        end
    end
    % D=E/eps;
    E_2=E_2./new_epsilon;
    profile_mode=zobrazeni_pole(E_2,field_function);
end

%{
figure
set(gcf, 'Renderer', 'zbuffer');
axes('FontSize',13)
surf(1E6.*y_points,1E6.*x_points,profile_mode,'LineWidth',1);

shading flat
axis([coordinate_y_1(1) coordinate_y_1(end) coordinate_x_1(1) coordinate_x_1(end)]);
ylabel('x [\mu{}m]','FontSize',13);
xlabel('y [\mu{}m]','FontSize',13);
%view([90 90]);

if set_grating_framework==1
hold on;
grating_framework;
end

view([90 90])
%}
%view([0 -90]);

%Mov(cylus_frame) = getframe;
%cylus_frame=cylus_frame+1;
%end

%movie(Mov,1,8)
%movie2avi(Mov, '1_2.avi','fps',4)

if correct_calculation==1 && plot_field_component==7
    plot_field_component=1;    
elseif correct_calculation==1 && plot_field_component==8
    plot_field_component=2;    
end