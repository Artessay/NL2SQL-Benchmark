"""Tool exports.

Keep optional runtime dependencies lazy so importing the package (for example
during test discovery) does not require the full benchmark environment.
"""

__all__ = ["SqlExecutor"]


def __getattr__(name):
    if name == "SqlExecutor":
        from .SqlExecutor import SqlExecutor

        return SqlExecutor
    raise AttributeError(f"module {__name__!r} has no attribute {name!r}")
