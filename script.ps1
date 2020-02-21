$cmd=$args[0]

function build {
    remove-item .\layers\python-dependencies -recurse
    mkdir ./layers/python-dependencies/python/lib/python3.7/site-packages
    pip install -r requirements.txt -t ./layers/python-dependencies/python/lib/python3.7/site-packages
    sam build -u
}

function deploy{
    sam deploy
    remove-item .\layers\python-dependencies -recurse
}

function fetch{
    Remove-Item .\layers\selenium-binaries\chromedriver
    Remove-Item .\layers\selenium-binaries\headless-chromium
    Invoke-WebRequest -Uri https://chromedriver.storage.googleapis.com/2.32/chromedriver_linux64.zip -UseBasicParsing -outfile .\chromedriver.zip
    Expand-Archive -Path .\chromedriver.zip -DestinationPath .\layers\selenium-binaries\
    Invoke-WebRequest -Uri https://github.com/adieuadieu/serverless-chrome/releases/download/v1.0.0-29/stable-headless-chromium-amazonlinux-2017-03.zip -UseBasicParsing -outfile .\headless-chromium.zip
    Expand-Archive -Path .\headless-chromium.zip -DestinationPath .\layers\selenium-binaries\
    Remove-Item .\chromedriver.zip
    Remove-Item .\headless-chromium.zip
}

if($cmd -eq "deploy"){
    deploy
} elseif($cmd -eq "build"){
    build
}  elseif($cmd -eq "fetch"){
    fetch
} elseif($cmd -eq "bd"){
    build
    deploy
}
