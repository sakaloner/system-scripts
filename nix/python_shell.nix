{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # Define Python and any necessary packages
  buildInputs = [
    pkgs.python39
    pkgs.python39Packages.pip
    pkgs.python39Packages.virtualenv
    pkgs.git  # Include Git if needed
  ];

  # Specify additional Python packages
  shellHook = ''
    # Install Python dependencies if not already present
    if [ ! -d "venv" ]; then
      python3 -m venv venv
      source venv/bin/activate
      pip install -r requirements.txt
    else
      source venv/bin/activate
    fi
  '';
}

