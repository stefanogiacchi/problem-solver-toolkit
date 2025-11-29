# Problem Solver Toolkit  
### Real-World Utilities for Enterprise Systems  
**.NET 8 • Clean Architecture • CQRS • HTTP Clients • Validation • Diagnostics**

The **Problem Solver Toolkit** is a curated collection of utilities, helpers, extensions and patterns  
designed for **real-world enterprise development**.

These are components I rely on when dealing with:
- high-complexity systems
- legacy modernization
- distributed architectures
- API integrations
- performance bottlenecks
- debugging production issues
- delivery acceleration

This repository captures the **core tools that consistently solve problems** across .NET enterprise projects.

---

# 🚀 What’s Inside

The toolkit includes production-ready utilities for:

### ✔ Pipeline Behaviors
Reusable behaviors for CQRS/Mediator pipelines:
- Logging behavior  
- Validation behavior  
- Performance tracking behavior  
- Transaction behavior  
- Exception handling behavior  

### ✔ Validation Utilities
- FluentValidation base classes  
- Value object validators  
- Guard clauses  
- Validation wrappers  

### ✔ HTTP Client Extensions
- Resilient HTTP wrapper  
- Retry policies  
- Exponential backoff  
- Typed clients  
- Request/response logging  

### ✔ Diagnostics & Observability
- Serilog helpers  
- Correlation ID utilities  
- Enriched context logging  
- Activity tracing (OpenTelemetry)  

### ✔ Mapping Utilities
- Mapster configuration  
- AutoMapper profiles  
- Strongly typed ID conversions  

### ✔ Error Handling Models
- Standardized error response model  
- ProblemDetails extensions  
- API exception filter helpers  

### ✔ Common Patterns
- Result<T> functional pattern  
- Paginated results  
- Domain event dispatcher helpers  

---

# 📦 Folder Structure
problem-solver-toolkit/
│
├── src/
│ ├── Behaviors/ -> CQRS pipeline behaviors
│ ├── Diagnostics/ -> Logging, tracing, telemetry
│ ├── Exceptions/ -> Exception helpers & ProblemDetails
│ ├── Extensions/ -> Common extension methods
│ ├── Http/ -> HttpClient wrappers & policies
│ ├── Mapping/ -> Mapping configs and helpers
│ ├── Results/ -> Result<T>, errors, pagination
│ ├── Validation/ -> Validators & guard clauses
│ └── README.md
│
├── tests/
│ ├── ProblemSolverToolkit.Tests/
│
└── README.md


---

# 🛠️ Example Utilities

### **1. Guard Clauses**
```csharp
public static class Guard
{
    public static void AgainstNull(object? input, string name)
    {
        if (input is null)
            throw new ArgumentNullException(name);
    }
}
```
2. Result<T> Pattern
```csharp
public class Result<T>
{
    public bool IsSuccess { get; }
    public bool IsFailure => !IsSuccess;
    public T? Value { get; }
    public string? Error { get; }

    public static Result<T> Success(T value) => new(true, value, null);
    public static Result<T> Failure(string error) => new(false, default, error);
}
```
3. Logging Behavior
```csharp
public class LoggingBehavior<TRequest, TResponse> : IPipelineBehavior<TRequest, TResponse>
{
    private readonly ILogger<LoggingBehavior<TRequest, TResponse>> _logger;

    public LoggingBehavior(ILogger<LoggingBehavior<TRequest, TResponse>> logger)
    {
        _logger = logger;
    }

    public async Task<TResponse> Handle(TRequest request, RequestHandlerDelegate<TResponse> next, CancellationToken cancellationToken)
    {
        _logger.LogInformation("Handling {RequestName}", typeof(TRequest).Name);
        var response = await next();
        _logger.LogInformation("Handled {RequestName}", typeof(TRequest).Name);
        return response;
    }
}
```
🌐 Why This Toolkit Exists

Because enterprise software is messy:

bad documentation

unclear requirements

legacy systems

missing logs

slow queries

flaky integrations

random production incidents

impossible timelines

This toolkit collects the solutions that always work when everything else fails.

🧪 Tests Included

Unit tests for:

Guard clauses

Result<T>

Pipeline behaviors

HttpClient wrapper

Frameworks used:

xUnit

FluentAssertions

Moq

📘 Documentation

Each folder includes a localized README.md explaining:

the problem

the solution

when to use it

examples

🤝 Contributions

Contributions and suggestions are welcome.
Open an issue for:

missing utilities

improvements

bug fixes

new patterns

📜 License

MIT License.



