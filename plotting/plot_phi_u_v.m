%
% plot_phi_u_v.m
%
% PURPOSE:  plot phi mass contours and (u,v) wind vectors.
%

% ******************  U,V,PHI PLOT PARAMETERS ******************* %
y_incr_val=5;
xi_incr_val=y_incr_val * 4;
% *************************************************************** %



% skip points
xi_skip_vec = xiVec(1:xi_incr_val:length(xiVec));
y_skip_vec = yVec(1:y_incr_val:length(yVec));
u_skip_vec = u(1:y_incr_val:length(yVec), 1:xi_incr_val:length(xiVec));
v_skip_vec = v(1:y_incr_val:length(yVec),1:xi_incr_val:length(xiVec));


% mesh grids
[XIVEC, YVEC]  = meshgrid(xiVec, yVec);
[XISKIP,YSKIP] = meshgrid(xi_skip_vec, y_skip_vec);


contourf(XIVEC,YVEC,phi);
hold on
if overlayForcing == 'true'
    Qmax = max(max(Q));
    contour(XIVEC,YVEC,Q,'LineStyle',':','LineColor','k','LineWidth',1.75, ...
    'LevelListMode','manual','LevelList', ...
    [0.5*Qmax 0.0625*Qmax]);
end
quiver(XISKIP,YSKIP,u_skip_vec,v_skip_vec,'Color','black');
hold off
