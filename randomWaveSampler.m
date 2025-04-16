function randomWaveSampler(L, stepSize, maxDuration)
    if nargin < 1, L = 500; end
    if nargin < 2, stepSize = 0.01; end
    if nargin < 3, maxDuration = 20; end

    N = round(L / stepSize);
    [path, t] = genPathSpectral(N, stepSize);
    maxDurationSteps = round(maxDuration/stepSize) + 1;
    empCov = autocorrDirect(path, maxDurationSteps);

    figure('Position', [100, 100, 1200, 900]);
    subplot(2, 1, 1);
    plot(t, path, 'k', 'LineWidth', 1.5);
    title('Single Path (Spectral Method)', 'FontSize', 14);
    xlabel('Time', 'FontSize', 12);
    ylabel('X(t)', 'FontSize', 12);
    grid on;

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
    % Frequency grid (centered)
    df = 1/(N*dt);
    if mod(N,2)==0
        f = (-N/2:N/2-1)*df;
    else
        f = (-(N-1)/2:(N-1)/2)*df;
    end

    % PSD: S(f) = 1/(pi*sqrt(1-f^2)), for |f|<1
    psd = zeros(size(f));
    valid = abs(f) < 1;
    psd(valid) = 1 ./ (pi * sqrt(1 - f(valid).^2));

    % Generate random spectrum with Hermitian symmetry
    X = zeros(1,N);
    % DC
    X(1) = sqrt(psd(1)*df) * randn;
    % Positive frequencies (excluding DC and Nyquist)
    for k = 2:floor(N/2)
        mag = sqrt(psd(k)*df/2);
        X(k) = mag * (randn + 1i*randn);
        X(N-k+2) = conj(X(k));
    end
    % Nyquist (if N even)
    if mod(N,2)==0
        X(N/2+1) = sqrt(psd(N/2+1)*df) * randn;
    end

    % IFFT and scaling
    path = real(ifft(ifftshift(X))) * N; % MATLAB's ifft is unnormalized
    t = (0:N-1)*dt;
    fprintf('Generated path variance: %.4f (Theoretical = 1.0)\n', var(path));
end

function acorr = autocorrDirect(x, maxLags)
    x = x - mean(x);
    v = var(x);
    acorr = zeros(1, maxLags);
    for k = 0:maxLags-1
        acorr(k+1) = mean(x(1:end-k) .* x(k+1:end)) / v;
    end
end
