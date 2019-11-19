%
% plot_phi_u_v.m
%
% PURPOSE:  plot phi mass contours and (u,v) wind vectors.
%

% *****************  U,V QUIVER PLOT PARAMETERS ***************** %
y_incr_val     = 5;
xi_incr_val    = y_incr_val * 4;

xi_skip_vec    = xi_Mm(1:xi_incr_val:XI_NUM);
y_skip_vec     = y_Mm(1:y_incr_val:Y_NUM);
u_skip_vec     = u(1:y_incr_val:Y_NUM, 1:xi_incr_val:XI_NUM);
v_skip_vec     = v(1:y_incr_val:Y_NUM, 1:xi_incr_val:XI_NUM);

[XISKIP,YSKIP] = meshgrid(xi_skip_vec, y_skip_vec);
% *************************************************************** %

% convert geopotential (phi, [m^2 s^-2]) to geopotential height (PHI, [m])
gravity_const = 9.81;  % [m s^-2]
PHI = phi / gravity_const;


contourf(XI,Y,PHI);
hold on
colormap(gray_scale_map);
if displayColorBar == true
    colorbar;
end
if overlayEquator == true
    contour_Equator(XI,Y,EQ);
end
if overlayForcing == true
    contour_DiabForcing(XI,Y,Qdiab);
end
quiver(XISKIP,YSKIP,u_skip_vec,v_skip_vec,'Color','black');
label_plot(['wind (m s$^{-1}$) and height anomaly (m) at p=',num2str(p),' hPa']);
hold off
