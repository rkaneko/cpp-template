## C++ template

This is my template for C++ programming.

### prerequirements

+ [Shell script for cpp-template](https://gist.github.com/rkaneko/6c849ef2a00262e632e6)
+ Git
+ curl
+ [jq](http://stedolan.github.io/jq/)

### Install Shell Script for cpp-template

```bash
$ cd $HOME

$ mkdir $HOME/bin

# (optional) If you haven't add PATH to $HOME/bin yet,
$ echo "export PATH=$PATH:$HOME/bin" >>$HOME/.bashrc

# (optional)
$ source .bashrc

# download Shell script for cpp-template
$ curl https://api.github.com/gists/6c849ef2a00262e632e6 | jq -r .files.cpptemplate.content >cpptemplate

# add execute permission
$ chmod +x cpptemplate
```

### Usage

```bash
$ cd your-workspace

# create C++ template
$ cpptemplate
> myapp
Cloning into 'your-workspace/myapp'...
remote: Counting objects: 45, done.
remote: Compressing objects: 100% (34/34), done.
remote: Total 45 (delta 14), reused 32 (delta 4)
Unpacking objects: 100% (45/45), done.
Checking connectivity... done
Invoking your-workspace/myapp/script/init.sh
Your project name is: myapp
Created Makefile !
Created myapp !

$ cd myapp

# build
$ make

# run
$ bin/myapp
Hello C++ world !
```
