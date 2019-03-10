function opt_option_out = fcnChooseOption(opt_option,tol_opt, u0)
% specify and configure optimization method
%refer to goo.gl/aTQFwr	
%(http://www.mathworks.com/help/optim/ug/fmincon.html#inputarg_options)
    warning off all;
    if ( opt_option == 0 )
        opt_option_out = optimset('Display','off',...
            'TolFun', tol_opt,...
            'MaxIter', 10000,...
            'Algorithm', 'active-set',...
            'FinDiffType', 'forward',...
            'RelLineSrchBnd', [],...
            'RelLineSrchBndDuration', 1,...
            'TolConSQP', 1e-6);
    elseif ( opt_option == 1 )
        opt_option_out = optimset('Display','off',...
            'TolFun', tol_opt,...
            'MaxIter', 2000,...
            'Algorithm', 'interior-point',...
            'AlwaysHonorConstraints', 'bounds',...
            'FinDiffType', 'forward',...
            'HessFcn', [],...
            'Hessian', 'bfgs',...
            'HessMult', [],...
            'InitBarrierParam', 0.1,...
            'InitTrustRegionRadius', sqrt(size(u0,1)*size(u0,2)),...
            'MaxProjCGIter', 2*size(u0,1)*size(u0,2),...
            'ObjectiveLimit', -1e20,...
            'ScaleProblem', 'obj-and-constr',...
            'SubproblemAlgorithm', 'cg',...
            'TolProjCG', 1e-2,...
            'TolProjCGAbs', 1e-10);
    %                       'UseParallel','always',...
    elseif ( opt_option == 2 )
        opt_option_out = optimset('Display','off',...
            'TolFun', tol_opt,...
            'MaxIter', 2000,...
            'Algorithm', 'trust-region-reflective',...
            'Hessian', 'off',...
            'MaxPCGIter', max(1,floor(size(u0,1)*size(u0,2)/2)),...
            'PrecondBandWidth', 0,...
            'TolPCG', 1e-1);
    end
    
end