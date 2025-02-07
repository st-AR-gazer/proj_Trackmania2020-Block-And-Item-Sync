import os
import shutil
import logging

logging.basicConfig(level=logging.DEBUG, format='%(levelname)s: %(message)s')

def parse_dir_structure(file_path):
    mapping = {}
    current_path = []
    try:
        with open(file_path, 'r') as f:
            for line in f:
                line = line.rstrip('\n')
                if not line.strip():
                    continue
                indent = len(line) - len(line.lstrip(' '))
                level = indent // 4
                content = line.lstrip(' ')
                if content.endswith('/'):
                    dir_name = content.rstrip('/')
                    current_path = current_path[:level]
                    current_path.append(dir_name)
                else:
                    if content.endswith('.Block.Gbx'):
                        base_name = content[:-len('.Block.Gbx')]
                        mapping[base_name] = list(current_path)
                        logging.debug(f"Mapping added: {base_name} -> {current_path}")
    except Exception as e:
        logging.error(f"Error reading structure file: {e}")
    return mapping

def main():
    source_dir = "./aa_HeavyWood_Blocks_Holder"
    dest_dir = "./Altered_Nadeo"
    structure_file = "./dir_structure.txt"
    mapping = parse_dir_structure(structure_file)
    if not mapping:
        logging.error("No mappings found. Exiting.")
        return

    # If I convert more, e.g -> magnet / fastmagnet / resonant metal/trans metal etc add 'location to 'default to' on the left, and what it should be on the right...
    # Also note to self, do not use 'PlatformTech' everyone uses this so it gets easily clogged...
    platform_mapping = {
        "PlatformPlastic": "PlatformWood"
        # "PlatformGrass": "PlatformMagnet",
        # "PlatformDirt": "PlatformFastMagnet",

    }

    for root, dirs, files in os.walk(source_dir):
        for filename in files:
            if not filename.endswith(".Block.Gbx"):
                logging.debug(f"Skipping non-block file: {filename}")
                continue
            src_file = os.path.join(root, filename)
            name_without_ext = filename[:-len(".Block.Gbx")]
            if '-' not in name_without_ext:
                logging.warning(f"Skipping file without proper suffix: {filename}")
                continue
            base, suffix = name_without_ext.rsplit('-', 1)
            if base not in mapping:
                logging.warning(f"Base name '{base}' not found in structure mapping for file: {filename}")
                continue

            rel_path = mapping[base]
            if not rel_path:
                logging.warning(f"No relative path found for base name: {base}")
                continue

            if rel_path[0] == "Roads":
                dest_path = os.path.join(dest_dir, suffix, *rel_path)
            elif rel_path[0] == "Platforms":
                if len(rel_path) < 2:
                    logging.error(f"Invalid platform structure for file: {filename}")
                    continue
                platform_type = rel_path[1]
                new_platform = platform_mapping.get(platform_type, platform_type)
                remaining = rel_path[2:]
                dest_path = os.path.join(dest_dir, suffix, new_platform, *remaining)
            else:
                logging.error(f"Unknown top-level folder '{rel_path[0]}' for file: {filename}")
                continue

            try:
                os.makedirs(dest_path, exist_ok=True)
                new_filename = f"{base}-{suffix}.Block.Gbx"
                dest_file = os.path.join(dest_path, new_filename)
                logging.info(f"Moving '{src_file}' to '{dest_file}'")
                shutil.move(src_file, dest_file)
            except Exception as e:
                logging.error(f"Error moving file '{src_file}' to '{dest_path}': {e}")

if __name__ == "__main__":
    main()
