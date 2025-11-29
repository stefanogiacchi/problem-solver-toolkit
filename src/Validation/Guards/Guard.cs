namespace ProblemSolverToolkit.Validation.Guards;

public static class Guard
{
    public static void AgainstNull(object? input, string parameterName)
    {
        if (input is null)
            throw new ArgumentNullException(parameterName);
    }

    public static void AgainstNullOrWhiteSpace(string? input, string parameterName)
    {
        if (string.IsNullOrWhiteSpace(input))
            throw new ArgumentException("Value cannot be null or whitespace.", parameterName);
    }

    public static void AgainstOutOfRange(int value, int min, int max, string parameterName)
    {
        if (value < min || value > max)
            throw new ArgumentOutOfRangeException(parameterName, $"Value must be between {min} and {max}.");
    }
}
