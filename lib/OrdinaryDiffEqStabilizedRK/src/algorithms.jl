
@doc generic_solver_docstring("""Second order method. Exhibits high stability for real eigenvalues
    and is smoothened to allow for moderate sized complex eigenvalues.""",
    "ROCK2",
    "Stabilized Explicit Method.",
    """Assyr Abdulle, Alexei A. Medovikov. Second Order Chebyshev Methods based on Orthogonal Polynomials.
    Numerische Mathematik, 90 (1), pp 1-18, 2001. doi: https://dx.doi.org/10.1007/s002110100292""",
    """
    - `min_stages`: TBD
    - `max_stages`: TBD
    - `eigen_est`: function of the form
        `(integrator) -> integrator.eigen_est = upper_bound`,
        where `upper_bound` is an estimated upper bound on the spectral radius of the Jacobian matrix.
        If `eigen_est` is not provided, `upper_bound` will be estimated using the power iteration.
    """,
    """
    min_stages = 0,
    max_stages = 200,
    eigen_est = nothing,
    """)
struct ROCK2{E} <: OrdinaryDiffEqAdaptiveAlgorithm
    min_stages::Int
    max_stages::Int
    eigen_est::E
end
function ROCK2(; min_stages = 0, max_stages = 200, eigen_est = nothing)
    ROCK2(min_stages, max_stages, eigen_est)
end

@doc generic_solver_docstring("""Fourth order method. Exhibits high stability for real eigenvalues
    and is smoothened to allow for moderate sized complex eigenvalues.""",
    "ROCK4",
    "Stabilized Explicit Method.",
    """Assyr Abdulle. Fourth Order Chebyshev Methods With Recurrence Relation. 2002 Society for
    Industrial and Applied Mathematics Journal on Scientific Computing, 23(6), pp 2041-2054, 2001.
    doi: https://doi.org/10.1137/S1064827500379549""",
    """
    - `min_stages`: TBD
    - `max_stages`: TBD
    - `eigen_est`: function of the form
        `(integrator) -> integrator.eigen_est = upper_bound`,
        where `upper_bound` is an estimated upper bound on the spectral radius of the Jacobian matrix.
        If `eigen_est` is not provided, `upper_bound` will be estimated using the power iteration.
    """,
    """
    min_stages = 0,
    max_stages = 152,
    eigen_est = nothing,
    """)
struct ROCK4{E} <: OrdinaryDiffEqAdaptiveAlgorithm
    min_stages::Int
    max_stages::Int
    eigen_est::E
end
function ROCK4(; min_stages = 0, max_stages = 152, eigen_est = nothing)
    ROCK4(min_stages, max_stages, eigen_est)
end

# SERK methods

for Alg in [:ESERK4, :ESERK5, :RKC]
    @eval begin
        struct $Alg{E} <: OrdinaryDiffEqAdaptiveAlgorithm
            eigen_est::E
        end
        $Alg(; eigen_est = nothing) = $Alg(eigen_est)
    end
end

@doc generic_solver_docstring("""Second order method. Exhibits high stability for real eigenvalues.""",
    "RKC",
    "Stabilized Explicit Method.",
    """B. P. Sommeijer, L. F. Shampine, J. G. Verwer. RKC: An Explicit Solver for Parabolic PDEs,
    Journal of Computational and Applied Mathematics, 88(2), pp 315-326, 1998. doi:
    https://doi.org/10.1016/S0377-0427(97)00219-7""",
    """
    - `eigen_est`: function of the form
        `(integrator) -> integrator.eigen_est = upper_bound`,
        where `upper_bound` is an estimated upper bound on the spectral radius of the Jacobian matrix.
        If `eigen_est` is not provided, `upper_bound` will be estimated using the power iteration.
    """,
    """
    eigen_est = nothing,
    """)
function RKC end

@doc generic_solver_docstring("""Fourth order method. Exhibits high stability for real eigenvalues
    and is smoothened to allow for moderate sized complex eigenvalues.""",
    "ESERK4",
    "Stabilized Explicit Method.",
    """J. Martín-Vaquero, B. Kleefeld. Extrapolated stabilized explicit Runge-Kutta methods,
    Journal of Computational Physics, 326, pp 141-155, 2016. doi:
    https://doi.org/10.1016/j.jcp.2016.08.042.""",
    """
    - `eigen_est`: function of the form
        `(integrator) -> integrator.eigen_est = upper_bound`,
        where `upper_bound` is an estimated upper bound on the spectral radius of the Jacobian matrix.
        If `eigen_est` is not provided, `upper_bound` will be estimated using the power iteration.
    """,
    """
    eigen_est = nothing,
    """)
function ESERK4 end

@doc generic_solver_docstring("""Fifth order method. Exhibits high stability for real eigenvalues
    and is smoothened to allow for moderate sized complex eigenvalues.""",
    "ESERK5",
    "Stabilized Explicit Method.",
    """J. Martín-Vaquero, A. Kleefeld. ESERK5: A fifth-order extrapolated stabilized explicit Runge-Kutta method,
    Journal of Computational and Applied Mathematics, 356, pp 22-36, 2019. doi:
    https://doi.org/10.1016/j.cam.2019.01.040.""",
    """
    - `eigen_est`: function of the form
        `(integrator) -> integrator.eigen_est = upper_bound`,
        where `upper_bound` is an estimated upper bound on the spectral radius of the Jacobian matrix.
        If `eigen_est` is not provided, `upper_bound` will be estimated using the power iteration.
    """,
    """
    eigen_est = nothing,
    """)
function ESERK5 end

@doc generic_solver_docstring("""Second order method. description TBD""",
    "ESERK5",
    "Stabilized Explicit Method.",
    """REF TBD""",
    """
    - `controller`: TBD
    - `eigen_est`: function of the form
        `(integrator) -> integrator.eigen_est = upper_bound`,
        where `upper_bound` is an estimated upper bound on the spectral radius of the Jacobian matrix.
        If `eigen_est` is not provided, `upper_bound` will be estimated using the power iteration.
    """,
    """
    controller = :PI
    eigen_est = nothing,
    """)
struct SERK2{E} <: OrdinaryDiffEqAdaptiveAlgorithm
    controller::Symbol
    eigen_est::E
end
SERK2(; controller = :PI, eigen_est = nothing) = SERK2(controller, eigen_est)
