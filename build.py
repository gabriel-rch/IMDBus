import os
import datetime

# Function to get all .sql files from a directory
def get_sql_files(directory):
    sql_files = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".sql"):
                sql_files.append(os.path.join(root, file))
    return sql_files


# Function to read the content of a file
def read_file(file_path):
    with open(file_path, "r") as file:
        content = file.read()
    return content


# Function to create the script.sql file
def create_script_file(sql_files, build_name):
    date = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    script_content = "-- auto generated script\n-- author: build.py\n-- date: {}\n\n".format(date)
    script_content += "DROP SCHEMA IF EXISTS public CASCADE;\nCREATE SCHEMA public;\n\n"

    for sql_file in sql_files:
        if build_name in sql_file:
            continue

        # Read the content of the .sql file
        content = read_file(sql_file)

        # Append the content to the script_content
        script_content += content + "\n\n"

    # Write the script_content to script.sql file
    with open(build_name, "w") as file:
        file.write(script_content)


def main():
    # Directory where the .sql files are located
    directory = "./"
    build_name = "script.sql"

    # Get all .sql files from the directory
    sql_files = get_sql_files(directory)

    # Create the script.sql file
    create_script_file(sql_files, build_name)


if __name__ == "__main__":
    main()