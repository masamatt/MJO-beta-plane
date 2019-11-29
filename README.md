# mjo_eq-wave_model

*Steady state beta-plane equatorial wave model for Madden-Julian oscillation (MJO)-like diabatic forcing.*
<br>
<br>
<br>
<br>


## Contents
* [I. Overview](#I-Overview) - brief description
* [II. Manifest](#II-Manifest) - repository structure
* [III. User Guide](#III-User-Guide) - **how to access repository and run model**
* [IV. Thesis Abstract](#IV-Thesis-Abstract) - MS abstract reproduced
* [V. Model Description](#V-Model-Description) - details of primitive equation and balanced models
* [VI. Appendix \& Citations](#VI-Appendix--Citations)
<br><br><br>


## I. Overview
This repository contains the original model code used in the _Dynamics of Atmospheres and Oceans_ journal article (Schubert and Masarik, 2006)<sup>[\[1\]](#1)</sup>, as well as the MS thesis (Masarik,  2007)<sup>[\[2\]](#2)</sup>.  The description here will follow the later.  Introductory information on the tropical weather phenomenon that is the subject of the study, the Madden Julian oscillation (MJO), can be found in [Ch 1](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/mtm_thesis_ch1_intro.pdf).  

There are actually two models available within the repository.  The first, derived from [primitive equations](#Vi-Primitive-Equation-Model) on an equatorial beta-plane, is contained mostly in the directory `primitive/`.  
A schematic outlining the computational procedure for the primitive equation model is given in [App F](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/mtm_thesis_comp_proc.pdf).
<br>

[\[Return to top\]](#mjo_eq-wave_model)
<br><br><br>


## II. Manifest
```bash
mjo_eq-wave_model/
├── balanced/                       #   code base for balanced model
├── docs/                           #   portions of thesis and output plots
├── lib/                            #   code shared between both models
├── MJO_PARAMS.m                    # adjustable run parameters
├── MJO_PLOT.m                      # main plotting script
├── MJO_RUN.m                       # main simulation script
├── plotting/                       #   scripts for plotting
├── primitive/                      #   code base for primitive equation model
└── README.md
```
[\[Return to top\]](#mjo_eq-wave_model)
<br><br><br>


## III. User Guide


#### III.i. - Download Repository
Download a copy of the repository to your computer using `git` by
issuing the following command at a prompt (`$`) in a terminal
```bash
  $ git clone https://github.com/masamatt/mjo_eq-wave_model
```
The model is composed only of Matlab scripts and functions, so it does not need to be compiled, and is in fact ready for use once downloaded.
<br><br>


#### III.ii - Run Model:  MJO_RUN.m
Change directories to the root directory in the cloned repository, and start Matlab from there
```bash
  $ cd mjo_eq-wave_model
  $ matlab
```
From the command prompt (`>>`) inside Matlab you can start a model simulation (with default parameters set) by calling the main run script
```matlab
  >> MJO_RUN
```
You will be prompted to run either the primitive equation model (`0`), or the balanced model (`1`).  
```matlab
Which model should be run?
        Primitive: 0
        Balanced:  1
Enter [0 or 1]:
```
If you enter `1` for the balanced model no more input is needed and the model will start solving for the balanced theory solution.  If you entered `0` for the primitive equation model, you will then be prompted for which equatorial wave component should be run
```matlab
Choose from the wave components for the Primitive Model.
                                                        
      Wave Components   Wave ID                         
      ---------------   -------                         
           All waves  =   0                             
         Rossby wave  =   1                             
          Mixed wave  =   2                             
        Gravity wave  =   3                             
         Kelvin wave  =   4                             
                                                        
Enter the wave ID number [0,1,2,3,4]:
```
Entering a wave ID `1` to `4` computes the response for that particular equatorial wave componment, while entering `0` computes the total wave solution, i.e., the sum of waves `1-4`.  

The model will run for ~O(5 min), computer dependent, and will automatically open a plot of the output upon completion.
<br><br>


#### III.iii - Set Run Parameters:  MJO_PARAMS.m
The file [`MJO_PARAMS.m`](https://github.com/masamatt/mjo_eq-wave_model/blob/master/MJO_PARAMS.m) is a script containing all the parameters available to the user for configuring the model forcing and resolution.  Edit the following parameters then run the script `MJO_RUN.m` to compute the solution for the selected parameters.
<br>

| Parameter | MatLab Variable | &nbsp;&nbsp; Units &nbsp;&nbsp;&nbsp; | Description | Sample Value |
|:---------:| --------:|:--------------:|:------------| ------------:|
| Q<sub>0</sub>/c<sub>p</sub> | `Q0_cp`  | \[K day<sup>-1</sup>\] | diabatic heating rate | `12` |
| a<sub>0</sub> | `a0_km` |    \[km\]   | zonal half-width of diabatic heating  | `1250` |
| b<sub>0</sub> | `b0_km` |     \[km\]   | meridional e-folding width of diabatic heating  | `450` |
| y<sub>0</sub> | `y0_km` |    \[km\]    | meridional displacement of diabatic heating from equator  | `450` |
| c  | `c` |   \[m s<sup>-1</sup>\]    | zonal translation speed of diabatic heating | `5` |
|    |     |                  |        |           |
| N  | `nMax` |    \[ \]     |  maximum meriodional mode (int) |  `200` |
| M  | `mMax` |      \[ \]       |  maximum zonal wavenumber (int)  |  `200` |
|   | `zonalDomain` |      \[ \]       |  extent of physical space zonal channel to display (float) | `0.5` |

<br>


#### III.iv - Plot Model Output:  MJO_PLOT.m
[Primitive Eq. - total wave response]()<br>
[ - Rossby wave]()<br>
[ - Mixed Rossby-gravity wave]()<br>
[ - Gravity wave]()<br>
[ - Kelvin wave]()<br>
[Balanced solution]()<br>
Safely ignore warnings of the like...
```matlab
Warning: Contour not rendered for constant ZData 
> In contourf (line 60)
  In plot_PV (line 62)
  In plotFields (line 70)
  In MJO_PLOT (line 46)
  In MJO_RUN (line 118) 
>>
```
<br>

[`MJO_PLOT.m`](https://github.com/masamatt/mjo_eq-wave_model/blob/master/MJO_PLOT.m).
<br>

[\[Return to top\]](#mjo_eq-wave_model)
<br><br><br>


## IV. Thesis Abstract
> POTENTIAL VORTICITY AND ENERGY ASPECTS OF THE MJO THROUGH
>                   EQUATORIAL WAVE THEORY
> 
>   Considering linearized motion about a resting basic state, we derive analytical solutions
> of the equatorial beta-plane primitive equations under the assumption that the flow is steady
> in a reference frame moving eastward with a diabatic forcing resembling a Madden-Julian oscillation (MJO)
> convective envelope.  The spectral series solutions allow us to
> decompose the total response into equatorial wave components.
>
>    The diabatic source term in the potential vorticity (PV) principle contains a factor 
> of `beta * y` which acts to suppress PV generation at the equator, while  maximizing it at the
> poleward edges of the convection.  In this way a moving heat source can produce two ribbons
> of lower tropospheric PV anomaly, a positive one off the equator in the northern hemisphere
> and a negative one off the equator in the southern hemisphere, with oppositely signed PV
> anomalies in the upper troposphere.  An approximate relationship between the geopotential
> and streamfunction is used to formulate an invertibility principle.  The balanced wind and 
> mass fields recovered from inverting the primitive equation PV quite accurately reproduce
> the flow west of the forcing.  While this result demonstrates the MJO wake response can
> be described by simple PV dynamics, it also illustrates the Kelvin response ahead of the 
> convection cannot be captured within this balanced framework.
>
>    We then derive the primitive equation total energy principle which reduces to a balance
> between generation and dissipation under the assumed steady state.  The total energy 
> can be expressed as a physical space integral, or equivalently as an infinite sum in spectral
> space through a Parseval relation.  Using the spectral sum we can isolate the individual
> equatorial wave contributions to the total energy.  The dependence of wave response energy
> on the horizontal shape, propagation speed, and meridional position of the prescribed
> forcing are examined by evaluating the Parseval relation for different values of these
> forcing parameters.
> <br>

[\[Return to top\]](#mjo_eq-wave_model)
<br><br><br>


## V. Model Description
Two models.
The solution can be considered as the primitive equation generalization of the simplest MJO model involving the first 
baroclinic mode response to a moving planetary scale heat source under the long-wave approximation 
(Chao, 1987).<sup>[\[3\]](#3)</sup>

<br><br>


#### V.i Primitive Equation Model
The governing equations for the primitive equation model are presented in [Sec 2.1](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/mtm_thesis_sec_2.1.pdf).  These 
equations in 3-dimensional space are separated into horizonal and vertical structure equations in [Sec 2.2](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/mtm_thesis_sec_2.2.pdf). In 
[Sec 2.3](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/mtm_thesis_sec_2.3.pdf) the prescription of the diabatic forcing term for the horizontal structure problem is given.  Assuming steady-state conditions in a reference frame translating [App C](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/mtm_thesis_xi_coord.pdf) at a constant speed with the prescribed diabatic forcing, the horizontal structure equations are solved in [Sec 2.4](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/mtm_thesis_sec_2.4.pdf).  Plots of the horizontal solutions fields are displayed for a given pressure surface in [Sec 2.5](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/mtm_thesis_sec_2.5.pdf).
<br>
[Primitive: Equatorial wave dispersion](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/prim_eq_disp.pdf)
<br><br>


#### V.ii Balanced Model
[PE Rossby vs. Balanced Dispersion](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/prim_bal_disp.pdf)
<br>
[\[Return to top\]](#mjo_eq-wave_model)
<br><br><br>


## VI. Appendix \& Citations
* <sup><a name="1">\[1\]</a></sup> Schubert, W. H., and M. T. Masarik, 2006: Potential vorticity apsects of the MJO. _Dynamics of Atmospheres and Oceans_, **42**, 127-151. [\[PDF\]](http://dx.doi.org/10.1016/j.dynatmoce.2006.02.003)
* <sup><a name="2">\[2\]</a></sup> Masarik, M. T. 2007: Potential Vorticity and Energy Aspects of the MJO Through Equatorial Wave Theory.  M.S. Thesis, pp. 94, Dept. of Atmos. Sci., Colo. State Univ., Fort Collins, Colo. [\[PDF\]](http://schubert.atmos.colostate.edu/publications/theses/masarik_thesis_2007.pdf)
* <sup><a name="3">\[3\]</a></sup> Chao, W. C., 1987: On the origin of the tropical intraseasonal oscillation.  _J. Atmos. Sci._, 
**44**, 1940-1949.
* [Bibliography](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/mtm_thesis_bib.pdf) for MS thesis.
* [Appendix F](https://github.com/masamatt/mjo_eq-wave_model/blob/master/docs/mtm_thesis_comp_proc.pdf) - schematic flow-chart of the computational procedure.
<br><br><br>
[\[Return to top\]](#mjo_eq-wave_model)
<br>
