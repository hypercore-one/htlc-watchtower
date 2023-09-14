FROM dart:stable AS build
RUN apt-get update && apt-get install -y wget

# Resolve app dependencies.
WORKDIR /
COPY pubspec.* ./
RUN dart pub get
RUN wget https://github.com/isar/isar/releases/download/3.1.0%2B1/libisar_linux_x64.so

# Copy app source code and AOT compile it.
COPY . .
RUN mkdir build
RUN cp libisar_linux_x64.so build/libisar.so

# Ensure packages are still up-to-date if anything has changed
RUN dart pub get --offline

# Build Watchtower Service
RUN dart run build_runner build --delete-conflicting-outputs
RUN cp config.yaml build/config.yaml
RUN dart compile exe src/main.dart -o build/main

# Start service.
CMD ["/build/main"]
