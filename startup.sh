#!/bin/bash

# hueneu Studio Website - Startup Script

# This script serves the static HTML/CSS website on port 9000.

# --- Configuration ---
PORT=9000
PROJECT_DIR="."

# --- Functions ---

# Function to check if Python 3 is installed
check_python() {
  if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed. Please install Python 3 to run the server."
    exit 1
  fi
}

# Function to start the HTTP server
start_server() {
  echo "Starting a simple HTTP server for hueneu studio website..."
  echo "Serving files from directory: $(pwd)/${PROJECT_DIR}"
  echo "Access the website at: http://localhost:${PORT}"
  echo "Press Ctrl+C to stop the server."

  # Navigate to the project directory if PROJECT_DIR is not "."
  if [ "${PROJECT_DIR}" != "." ]; then
    if [ -d "${PROJECT_DIR}" ]; then
      cd "${PROJECT_DIR}" || exit
    else
      echo "Error: Project directory '${PROJECT_DIR}' not found."
      exit 1
    fi
  fi
  
  # Check if index.html exists
  if [ ! -f "index.html" ]; then
    echo "Error: index.html not found in the current directory."
    echo "Please ensure you are in the root directory of the project or specify the correct PROJECT_DIR."
    exit 1
  fi

  # Start Python's built-in HTTP server
  # The -u flag ensures that stdout/stderr are unbuffered, which can be helpful for logging.
  python3 -u -m http.server ${PORT}
}

# --- Main Execution ---

echo "-----------------------------------"
echo " hueneu Studio Website Launcher    "
echo "-----------------------------------"

# 1. Check for dependencies
echo "Checking dependencies..."
check_python
echo "Python 3 found."

# 2. (No build step for static HTML/CSS project)

# 3. (No specific environment configuration needed beyond port)

# 4. Start the server
start_server

exit 0
