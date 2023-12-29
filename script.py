import os
import shutil

def remove_directories(starting_with):
    for root, dirs, files in os.walk('.'):
        for directory in dirs:
            if directory.startswith(starting_with):
                dir_path = os.path.join(root, directory)
                print(dir_path)
                try:
                    # Remove everything inside the directory
                    for item in os.listdir(dir_path):
                        item_path = os.path.join(dir_path, item)
                        if os.path.isfile(item_path):
                            os.remove(item_path)
                        elif os.path.isdir(item_path):
                            shutil.rmtree(item_path)

                    # Remove the directory itself
                    shutil.rmtree(dir_path)
                    print(f"Directory removed: {dir_path}")
                except OSError as e:
                    print(f"Error removing directory {dir_path}: {e}")

if __name__ == "__main__":
    starting_prefix = "learnability2agents_Sarsa"
    remove_directories(starting_prefix)
