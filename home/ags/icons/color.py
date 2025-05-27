
import os
import re
import argparse

def get_colors_from_scss(scss_file_path):
    """Extract the values of the tx1 and bg1 variables from the SCSS file."""
    with open(scss_file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Search for the tx1 and bg1 variables in the SCSS content
    tx1_match = re.search(r'\$tx1\s*:\s*(#[0-9a-fA-F]{3,6}|[a-zA-Z]+)', content)
    bg1_match = re.search(r'\$bg1\s*:\s*(#[0-9a-fA-F]{3,6}|[a-zA-Z]+)', content)

    if tx1_match and bg1_match:
        return tx1_match.group(1), bg1_match.group(1)
    else:
        raise ValueError("Could not find the $tx1 or $bg1 variables in the SCSS file.")

def delete_inverted_files(folder_path):
    """Delete all existing files in the folder that have '-invert' in their filenames."""
    for file in os.listdir(folder_path):
        if file.endswith('-invert.svg'):
            os.remove(os.path.join(folder_path, file))
            print(f"Deleted existing inverted file: {file}")

def update_svg_strokes(folder_path, new_color, invert=False):
    svg_files = [f for f in os.listdir(folder_path) if f.endswith('.svg')]
    stroke_pattern = re.compile(r'stroke="[^"]*"')
    style_pattern = re.compile(r'style="[^"]*stroke:[^;]*;?[^"]*"')

    for file in svg_files:
        file_path = os.path.join(folder_path, file)
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Replace stroke in the 'stroke="..."' attributes
        updated_content = stroke_pattern.sub(f'stroke="{new_color}"', content)

        # Replace stroke in the inline 'style="stroke:..."' properties
        updated_content = style_pattern.sub(lambda match: re.sub(r'stroke:[^;]*', f'stroke:{new_color}', match.group(0)), updated_content)

        if invert:
            # Create a new SVG file with '-invert' in the filename
            new_file_path = os.path.join(folder_path, f"{os.path.splitext(file)[0]}-invert.svg")
            with open(new_file_path, 'w', encoding='utf-8') as f:
                f.write(updated_content)
            print(f"Created inverted file: {new_file_path}")
        else:
            # Write the updated content back to the original file
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(updated_content)
            print(f'Updated stroke color in: {file}')

def main():
    parser = argparse.ArgumentParser(description='Change stroke color in all SVG files in a folder.')
    parser.add_argument('folder_path', type=str, help='Path to the folder containing SVG files')
    parser.add_argument('scss_path', type=str, help='Path to the SCSS file containing the tx1 and bg1 variables')

    args = parser.parse_args()

    # Retrieve the tx1 and bg1 color values from the SCSS file
    try:
        tx1_color, bg1_color = get_colors_from_scss(args.scss_path)
        print(f"Using color from SCSS - tx1: {tx1_color}, bg1: {bg1_color}")
    except ValueError as e:
        print(e)
        return

    # Correct the folder_path to make sure it's an absolute path
    folder_path = os.path.abspath(args.folder_path)  # Convert relative to absolute path if needed

    # Step 1: Delete any existing inverted files
    delete_inverted_files(folder_path)

    # Step 2: Update all SVG files with tx1 color (original files)
    update_svg_strokes(folder_path, tx1_color, invert=False)
    
    # Step 3: Create the inverted files with bg1 color
    update_svg_strokes(folder_path, bg1_color, invert=True)

if __name__ == '__main__':
    main()
