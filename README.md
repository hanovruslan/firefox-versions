## how to use multiple versions of firefox ##

How to set up multiple firefox version and how to switch between then

### init ###

1. init bash-dep source
1. run command


### how to init bash-dep source ###

from project root run this

```
git clone git@github.com:hanovruslan/bash-dep.git src/bash-dep \
&& ./src/bash-dep/add.sh ${PWD}/src/bash-get-options-env.sh
```

###  Commands ###

1. add - add specific version into alternatives location
1. set - set default binary alternative
1. show - show available binary alternatives (default action)


### How to add ###

Available version are listed [here](https://ftp.mozilla.org/pub/firefox/releases/)

```
./main.sh -a add -v ${version}
```

### Hot to set specific version ###


```
./main.sh -a set -v ${version}
```

### how to show all alternatives ###

```
./main.sh -a show
```

or

```
./main.sh
```
