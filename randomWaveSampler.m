

function randomWaveSampler(L, stepSize, maxDuration)
    % Default parameters
    if nargin < 1
        L = 200;            % Interval length
    end
    if nargin < 2
        stepSize = 0.01;    % Time resolution
    end
    if nargin < 3
        maxDuration = 20;   % Maximum time duration to plot (in time units)
    end
    
    N = L / stepSize;   % Number of points
    
    % Generate path and analyze
    [path, t] = genPathSpectral(N, stepSize);
    maxDurationSteps = round(maxDuration/stepSize) + 1;
    empCov = autocorrDirect(path, maxDurationSteps);
    
    % Plot results
    figure('Position', [100, 100, 1200, 900]);
    
    % Plot path
    subplot(2, 1, 1);
    plot(t, path, 'k', 'LineWidth', 1.5);
    title('Single Path (Spectral Method)', 'FontSize', 14);
    xlabel('Time', 'FontSize', 12);
    ylabel('X(t)', 'FontSize', 12);
    grid on;
    
    % Plot covariance
    subplot(2, 1, 2);
    durations = 0:stepSize:maxDuration;
    plotLen = min(length(durations), length(empCov));
    plot(durations(1:plotLen), empCov(1:plotLen), 'b', 'LineWidth', 1.5);
    hold on;
    plot(durations(1:plotLen), besselj(0, 2*pi*durations(1:plotLen)), 'r--', 'LineWidth', 2);
    title('Covariance Verification', 'FontSize', 14);
    xlabel('Time Duration', 'FontSize', 12);
    ylabel('Autocorrelation', 'FontSize', 12);
    legend('Empirical', 'Theoretical J₀(2π τ)');
    grid on;
    ylim([-0.5, 1.05]);
    xlim([0, maxDuration]);
    
    fprintf('USING SPECTRAL METHOD - Target Covariance J0(2*pi*tau)\n');
end

function [path, t] = genPathSpectral(N, dt)
    % Simple frequency vector creation
    freq = ((-N/2):(N/2-1))/(N*dt);
    freq = fftshift(freq);  % Reorder for FFT
    
    % Simple PSD calculation
    psd = zeros(size(freq));
    validIdx = abs(freq) < 1.0 & abs(freq) > 1e-9;
    psd(validIdx) = 1.0 ./ (pi * sqrt(1 - freq(validIdx).^2));
    
    % Generate random complex coefficients
    Z = randn(1,N) + 1i*randn(1,N);
    
    % Simple symmetry technique: create real-valued signal directly
    X = sqrt(psd/dt) .* Z;
    X(1) = 0;  % Set DC to zero
    
    % Force conjugate symmetry by using real(ifft())
    path = real(ifft(X)) * N;
    
    fprintf('Generated path variance: %.4f (Theoretical = 1.0)\n', var(path));
    t = (0:N-1) * dt;
end

function acorr = autocorrDirect(x, maxLags)
    % Direct correlation calculation without edge cases
    acorr = zeros(1, maxLags);
    x = x - mean(x);
    v = var(x);
    
    for k = 0:maxLags-1
        if k == 0
            acorr(1) = 1.0;  % First lag is always 1
        else
            % Simple correlation calculation
            acorr(k+1) = mean(x(1:end-k) .* x(k+1:end)) / v;
        end
    end
end
