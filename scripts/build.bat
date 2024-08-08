
set sevenzexe="C:\Program Files\7-Zip\7z.exe"
mkdir .\build
pushd .\build

dir c:\mingw64\bin\
c:\mingw64\bin\cmake.exe ..
c:\mingw64\bin\ninja.exe
move Tnn-miner.exe Tnn-miner-win-x64.exe
%sevenzexe% a ..\tnn-miner-win64.zip Tnn-miner-win-x64.exe
popd
