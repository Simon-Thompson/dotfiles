import argparse
from pathlib import Path

def process_markdown_file(file_path: Path, new_line: str, skip_line: str, edit_line: str | None) -> tuple[int, int]:
    """Process a single markdown file. Returns (lines_added, lines_skipped)."""
    lines_added = 0
    lines_skipped = 0

    content = file_path.read_text(encoding="utf-8").splitlines()

    # Skip if skip_line already exists
    if any(skip_line.strip() == line.strip() for line in content):
        print(f"Skipped: {file_path}")
        return 0, 1

    if edit_line:
        # Edit existing line
        edited = False
        for i, line in enumerate(content):
            if edit_line in line:
                content[i] = new_line
                edited = True
                print(f"Edited: {file_path}")
                break
        if edited:
            file_path.write_text("\n".join(content) + "\n", encoding="utf-8")
            return 1, 0
        else:
            return 0, 1

    # Add new line logic
    if content and content[0].strip() == "---":
        content.insert(1, new_line)
        print(f"Added: {file_path}")
    else:
        content = ["---", new_line, "---"] + content
        print(f"Added: {file_path}")

    file_path.write_text("\n".join(content) + "\n", encoding="utf-8")
    lines_added += 1
    return lines_added, lines_skipped


def process_directory(target_dir: Path, new_line: str, skip_line: str | None = None, edit_line: str | None = None):
    """Process all markdown files in a directory and subdirectories."""
    skip_line = skip_line or new_line
    total_added = 0
    total_skipped = 0

    for file_path in target_dir.rglob("*.md"):
        added, skipped = process_markdown_file(file_path, new_line, skip_line, edit_line)
        total_added += added
        total_skipped += skipped

    print(f"Done. Lines added: {total_added}, Lines skipped: {total_skipped}")


def main():
    parser = argparse.ArgumentParser(description="Mass edit properties in markdown files.")
    parser.add_argument("--target-dir", required=True, help="Target directory containing markdown files.")
    parser.add_argument("--new-line", required=True, help="The new property line to add or replace.")
    parser.add_argument("--skip-line", help="Line to check for skipping. Defaults to new-line if not set.")
    parser.add_argument("--edit-line", help="If set, replaces this line instead of adding a new one.")

    args = parser.parse_args()

    process_directory(
        target_dir=Path(args.target_dir),
        new_line=args.new_line,
        skip_line=args.skip_line,
        edit_line=args.edit_line
    )


if __name__ == "__main__":
    main()
