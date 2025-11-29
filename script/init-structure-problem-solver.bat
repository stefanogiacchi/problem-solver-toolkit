@echo off
REM ======================================================
REM  Initialize folder structure for Problem Solver Toolkit
REM  Run from root: problem-solver-toolkit>
REM ======================================================

echo [SRC] Creating src structure...

REM cartelle principali
mkdir src
mkdir src\Behaviors
mkdir src\Diagnostics
mkdir src\Exceptions
mkdir src\Extensions
mkdir src\Http
mkdir src\Mapping
mkdir src\Results
mkdir src\Validation

REM sottocartelle logiche

REM Behaviors -> CQRS pipeline behaviors
mkdir src\Behaviors\CQRS

REM Diagnostics -> Logging, tracing, telemetry
mkdir src\Diagnostics\Logging
mkdir src\Diagnostics\Tracing
mkdir src\Diagnostics\Telemetry

REM Exceptions -> helpers & ProblemDetails
mkdir src\Exceptions\ProblemDetails
mkdir src\Exceptions\Handlers

REM Extensions -> common extension methods
mkdir src\Extensions\Collections
mkdir src\Extensions\Linq
mkdir src\Extensions\Primitives

REM Http -> HttpClient wrappers & policies
mkdir src\Http\Wrappers
mkdir src\Http\Policies

REM Mapping -> configs & helpers
mkdir src\Mapping\Configs
mkdir src\Mapping\Helpers

REM Results -> Result<T>, errors, pagination
mkdir src\Results\Core
mkdir src\Results\Pagination
mkdir src\Results\Errors

REM Validation -> validators & guard clauses
mkdir src\Validation\Validators
mkdir src\Validation\Guards

echo [SRC] Creating README.md for src...
IF NOT EXIST src\README.md (
    echo # Problem Solver Toolkit - Source>src\README.md
)

echo [TESTS] Creating tests structure...

mkdir tests
mkdir tests\ProblemSolverToolkit.Tests

echo [ROOT] Creating root README if missing...

IF NOT EXIST README.md (
    echo # Problem Solver Toolkit>README.md
)

echo.
echo Done. Folder structure for Problem Solver Toolkit has been created.
echo.
pause
