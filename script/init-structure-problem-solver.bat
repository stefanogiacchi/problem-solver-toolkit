@echo off
REM ======================================================
REM  Initialize folder structure for Problem Solver Toolkit
REM  Creates all folders AND adds .gitkeep to make GitHub display them
REM ======================================================

echo [SRC] Creating src structure...

mkdir src
mkdir src\Behaviors
mkdir src\Diagnostics
mkdir src\Exceptions
mkdir src\Extensions
mkdir src\Http
mkdir src\Mapping
mkdir src\Results
mkdir src\Validation

mkdir src\Behaviors\CQRS
mkdir src\Diagnostics\Logging
mkdir src\Diagnostics\Tracing
mkdir src\Diagnostics\Telemetry
mkdir src\Exceptions\ProblemDetails
mkdir src\Exceptions\Handlers
mkdir src\Extensions\Collections
mkdir src\Extensions\Linq
mkdir src\Extensions\Primitives
mkdir src\Http\Wrappers
mkdir src\Http\Policies
mkdir src\Mapping\Configs
mkdir src\Mapping\Helpers
mkdir src\Results\Core
mkdir src\Results\Pagination
mkdir src\Results\Errors
mkdir src\Validation\Validators
mkdir src\Validation\Guards

echo Adding .gitkeep files...

for /r src %%f in (.) do (
    if not exist "%%f\.gitkeep" (
        echo.> "%%f\.gitkeep"
    )
)

echo [TESTS] Creating tests structure...

mkdir tests
mkdir tests\ProblemSolverToolkit.Tests

if not exist tests\ProblemSolverToolkit.Tests\.gitkeep echo.> tests\ProblemSolverToolkit.Tests\.gitkeep

echo [ROOT] Creating README if missing...

IF NOT EXIST README.md (
    echo # Problem Solver Toolkit>README.md
)

echo.
echo Done. All folders created and .gitkeep added so GitHub will display them.
echo.
pause
