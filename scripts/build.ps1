set sevenzexe="C:\Program Files\7-Zip\7z.exe"
if not exist .\build (
    mkdir .\build
  )

pushd .\build

dir c:\mingw64\bin\
c:\mingw64\bin\cmake.exe ..
c:\mingw64\bin\ninja.exe
popd
