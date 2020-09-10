FROM gitpod/workspace-full

USER gitpod

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install

RUN mkdir ~/.ssh
RUN echo $GP_AWS_SSH_KEY_RSA > ~/.ssh/id_rsa
RUN echo $GP_AWS_SSH_KEY_RSA_PUB > ~/.ssh/id_rsa.pub
RUN echo -e "\n\
Host git-codecommit.*.amazonaws.com\n\
User $GP_AWS_SSH_KEY_ID\n\
IdentityFile ~/.ssh/id_rsa\n\
" > ~/.ssh/config
RUN chmod +x ~/.ssh/config
