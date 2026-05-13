import subprocess
import getpass
import datetime
import os
import shutil

# Database configuration
db_user = 'backup_user'  # Use a dedicated backup user, not 'root'
db_name = 'hoteldb'
db_password = getpass.getpass("Enter MySQL Password: ")

# Set backup folder (configurable, defaults to './backups')
backup_folder = input("Enter backup folder path (or press Enter for default './backups'): ") or r'./backups'
os.makedirs(backup_folder, exist_ok=True)

# Log file for auditing
log_file = os.path.join(backup_folder, "backup_log.txt")

# Timestamp for backup file
today = datetime.datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
backup_file = os.path.join(backup_folder, f"backup_{db_name}_{today}.sql")

# Function to log messages
def log_message(message):
    with open(log_file, "a", encoding="utf-8") as log:
        log.write(f"{today}: {message}\n")

# Check if mysqldump and mysql are available
if not shutil.which("mysqldump"):
    print("Error: mysqldump not found. Please install MySQL or check your PATH.")
    exit(1)
if not shutil.which("mysql"):
    print("Error: mysql not found. Please install MySQL or check your PATH.")
    exit(1)

# Backup function
def backup_database():
    command = [
        "mysqldump",
        f"-u{db_user}",
        f"-p{db_password}",
        "--routines",
        "--triggers",
        "--events",
        db_name
    ]
    with open(backup_file, "w", encoding="utf-8") as outfile:
        result = subprocess.run(command, stdout=outfile, stderr=subprocess.PIPE, text=True)
    
    if result.returncode == 0:
        print(f"\nDatabase '{db_name}' backed up successfully!")
        print(f"File saved at: {backup_file}")
        log_message(f"Backup successful - File: {backup_file}")
    else:
        print("Backup failed!")
        print("Error details:", result.stderr)
        log_message(f"Backup failed - Error: {result.stderr}")

# Recovery function
def restore_database():
    # List available backups
    backup_files = [f for f in os.listdir(backup_folder) if f.startswith(f"backup_{db_name}_") and f.endswith(".sql")]
    if not backup_files:
        print("No backup files found in the specified folder!")
        return
    
    print("\nAvailable backups:")
    for i, file in enumerate(backup_files, 1):
        print(f"{i}. {file}")
    
    choice = int(input("Enter the number of the backup file to restore (or 0 to cancel): "))
    if choice == 0:
        print("Restore cancelled.")
        return
    
    if 1 <= choice <= len(backup_files):
        restore_file = os.path.join(backup_folder, backup_files[choice - 1])
        restore_command = [
            "mysql",
            f"-u{db_user}",
            f"-p{db_password}",
            db_name
        ]
        with open(restore_file, "r", encoding="utf-8") as infile:
            result = subprocess.run(restore_command, stdin=infile, stderr=subprocess.PIPE, text=True)
        
        if result.returncode == 0:
            print(f"\nDatabase '{db_name}' restored successfully from file: {restore_file}")
            log_message(f"Restore successful - File: {restore_file}")
        else:
            print("Restore failed!")
            print("Error details:", result.stderr)
            log_message(f"Restore failed - Error: {result.stderr}")
    else:
        print("Invalid choice!")

# Main menu
def main():
    while True:
        print("\nHotel Management Database - Backup and Recovery")
        print("1. Backup Database")
        print("2. Restore Database")
        print("3. Exit")
        choice = input("Enter your choice (1-3): ")
        
        if choice == '1':
            backup_database()
        elif choice == '2':
            restore_database()
        elif choice == '3':
            print("Exiting program.")
            break
        else:
            print("Invalid choice! Please try again.")

if __name__ == "__main__":
    main()