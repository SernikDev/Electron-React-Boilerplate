FROM lukasz1989/electron-react:latest

ARG USER_ID
ARG USER_NAME
ARG NODE_VERSION
ARG APP_FOLDER_NAME

# npm
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash
RUN apt-get -qq install nodejs

RUN useradd -u $USER_ID $USER_NAME
WORKDIR /home/$USER_NAME/$APP_FOLDER_NAME
RUN chown -R $USER_ID:$USER_ID /home/$USER_NAME

USER $USER_NAME