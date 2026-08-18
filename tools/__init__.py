"""Tool exports.

Keep optional runtime dependencies lazy so importing the package (for example
during test discovery) does not require the full benchmark environment.
"""

__all__ = ["SqlExecutor"]


def __getattr__(name):
    if name == "SqlExecutor":
        from .SqlExecutor import SqlExecutor

        # Importing the submodule installs ``tools.SqlExecutor`` as the module
        # object. Cache the exported class afterwards so repeated runner-loop
        # accesses remain callable.
        globals()[name] = SqlExecutor
        return SqlExecutor
    raise AttributeError(f"module {__name__!r} has no attribute {name!r}")
