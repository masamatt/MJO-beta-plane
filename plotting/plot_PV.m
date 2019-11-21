%
% plot_PV.m
% 
% PURPOSE: plot potential vorticity (PV) contours.
%
q_mu           = q * 10^6;              % mu s^-1 = 10^-6 s^-1
q_cyclonic     = zeros(Y_NUM,XI_NUM);
q_anticyclonic = zeros(Y_NUM,XI_NUM);

for xixi = 1:XI_NUM
    for yy = 1:Y_NUM
        if q_mu(yy,xixi) >= 0
            q_cyclonic(yy,xixi) = q_mu(yy,xixi);
            q_anticyclonic(yy,xixi) = NaN;
        else
            q_cyclonic(yy,xixi) = NaN;
            q_anticyclonic(yy,xixi) = q_mu(yy,xixi);
        end
    end
end

peakPVString='';
if displayPeakValues == true
    PVmax = max(max(q_cyclonic));
    PVmin = min(min(q_anticyclonic));
    PVmaxStr = sprintf('%0.2f',PVmax);
    PVminStr = sprintf('%0.2f',PVmin);
    peakPVString=[' [peak: PV$_{+}$=',PVmaxStr,' PV$_{-}$=',PVminStr,']'];
end

contourf(XI,Y,q_cyclonic,'linestyle','-');
hold on
contourf(XI,Y,q_anticyclonic,'linestyle','--');
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
label_plot(['potential vorticity(10$^{-6}\,$ s$^{-1}$) anomaly p=',num2str(p),'hPa',peakPVString]);
hold off

% END
