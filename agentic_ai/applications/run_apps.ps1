# Set Python path to include parent directory
$env:PYTHONPATH = (Get-Item -Path "$PSScriptRoot\..").FullName

# Start backend in background
Start-Process -FilePath "uv" -ArgumentList "run python backend.py" -WorkingDirectory $PSScriptRoot -NoNewWindow

# Wait a moment for backend to initialize
Start-Sleep -Seconds 2

# Run Streamlit frontend (this will keep the console open)
Start-Process -FilePath "uv" -ArgumentList "run streamlit run frontend.py" -WorkingDirectory $PSScriptRoot -Wait -NoNewWindow