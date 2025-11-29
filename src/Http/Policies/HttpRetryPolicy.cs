using System.Net.Http;

namespace ProblemSolverToolkit.Http.Policies;

public static class HttpRetryPolicy
{
    public static async Task<HttpResponseMessage> ExecuteWithSimpleRetryAsync(
        Func<Task<HttpResponseMessage>> action,
        int maxRetries = 3,
        int delayMilliseconds = 300,
        CancellationToken cancellationToken = default)
    {
        if (maxRetries < 1)
            throw new ArgumentOutOfRangeException(nameof(maxRetries));

        HttpResponseMessage? lastResponse = null;

        for (var attempt = 1; attempt <= maxRetries; attempt++)
        {
            lastResponse = await action();

            if (lastResponse.IsSuccessStatusCode)
                return lastResponse;

            if (attempt < maxRetries)
                await Task.Delay(delayMilliseconds, cancellationToken);
        }

        return lastResponse!;
    }
}
