# Common Print Dialog

## Requirements
- qt5-qmake
- qtdeclarative5-dev
- qml-module-qtquick-controls
- qml-module-qtquick-controls2
- qml-module-qtquick-templates2
- qml-module-qtquick-dialogs
- qml-module-qt-labs-settings
- qml-module-qt-labs-folderlistmodel
- [Frontend and Backend Communication libraries](https://github.com/OpenPrinting/cpdb-libs)
- [CUPS CPD-Backend](https://github.com/OpenPrinting/cpdb-backend-cups)
- [GCP CPD-Backend](https://github.com/OpenPrinting/cpdb-backend-gcp)

On Ubuntu (17.04 or higher), run this command to install all dependencies
```
sudo apt -y install qt5-qmake qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtquick-controls2 qml-module-qtquick-templates2 qml-module-qtquick-dialogs qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel
```

For the helper libraries and CUPS/GCP backends, see their respective README files.

## Build
To build and install the Print Dialog Library

```
mkdir build; cd build
qmake ..
make all
sudo make install
```

## Using the library
Build and run examples/test_application

```
cd examples/test_application
mkdir build; cd build
make all
./printTest

```
