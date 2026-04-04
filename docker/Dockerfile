FROM busybox AS unpack
WORKDIR /unpack
ADD https://dl.google.com/android/repository/commandlinetools-linux-14742923_latest.zip ./sdk.zip
RUN unzip ./sdk.zip


FROM gradle:9-jdk25-noble
COPY --from=unpack /unpack/ /root/sdk
ENV ANDROID_HOME=/root/sdk
ENV PATH="${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/cmdline-tools/latest/bin"
RUN mkdir $ANDROID_HOME/cmdline-tools/latest
WORKDIR $ANDROID_HOME/cmdline-tools
RUN mv bin lib NOTICE.txt source.properties ./latest/
RUN  yes | sdkmanager "platform-tools" "platforms;android-36"
CMD ["/bin/bash"]