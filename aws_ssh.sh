mkdir -p ~/.ssh
echo $GP_AWS_SSH_KEY_RSA | base64 -d > ~/.ssh/id_rsa
echo $GP_AWS_SSH_KEY_RSA_PUB | base64 -d > ~/.ssh/id_rsa.pub
echo -e "\n\
Host git-codecommit.*.amazonaws.com\n\
User $GP_AWS_SSH_KEY_ID\n\
IdentityFile ~/.ssh/id_rsa\n\
" > ~/.ssh/config
chmod +x ~/.ssh/config
