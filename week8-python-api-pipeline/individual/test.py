from pathlib import Path
import py_compile


BASE_DIR = Path(__file__).resolve().parent


def require_file(relative_path):
    path = BASE_DIR / relative_path
    if not path.exists():
        raise FileNotFoundError(f"Missing required file: {path}")
    return path


def main():
    required_files = [
        "extract.py",
        "pipeline.py",
        "requirements.txt",
        ".env.example",
        "README.md",
    ]

    for relative_path in required_files:
        require_file(relative_path)

    py_compile.compile(str(BASE_DIR / "extract.py"), doraise=True)
    py_compile.compile(str(BASE_DIR / "pipeline.py"), doraise=True)

    print("Week 8 pipeline project checks passed.")


if __name__ == "__main__":
    main()
