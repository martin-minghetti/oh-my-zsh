# ------------------------- MARTIN WAS HERE -------------------------

## Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"
alias cls="clear"
alias dir="ls -a"

## Finder
alias finder="open ."

## Open in code
alias c="code"
alias c.="code ."

## NPM
alias dev="echo '\n\n Simon says: npm run dev 🧪' && npm run dev"
alias st="echo '\n\n Simon says: npm start 🧪' && npm start"
alias bd="echo '\n\n Simon says: npm run build 👷🏻‍' && npm run build"

## -------------------------------------------------------------
## Shortcuts
## -------------------------------------------------------------

# . /Users/martinminghetti/z/z.sh
## Opens AirLST folder located on Documents
alias lst="/Users/martinminghetti/Documents/AirLST/"

## Opens Martin folder located on Documents
alias me="/Users/martinminghetti/Documents/Martin/"

## Open Google Chrome
alias chrome='open -a "Google Chrome"'

## Open my alias in VS Code
alias myalias='code ~/.oh-my-zsh/custom/alias.zsh'

## Ping Server
alias ping_server='ping ldi-server.local'


## -------------------------------------------------------------
## Functions
## -------------------------------------------------------------

## Launch server in port custom port, example: servus 3030 (by default opens :8000)
servus () {
    if [ $@ -eq ""]; then
        open -a "Google Chrome" http://0.0.0.0:8000/
    else
        open -a "Google Chrome" http://0.0.0.0:"$@"/
    fi
    python -m SimpleHTTPServer "$@"
}

## Add a new project to BitBucket with a boilerplate,
## example: bp newProjectName (will create a folder called "newProjectName"
## with the boilerplate inside)

## First create a new empty repo on Bitbucket, then:

bp () {
    echo '--> Cloning the Boilerplate from Bitbucket';
    git clone https://martin-minghetti@bitbucket.org/airlst/airlst-landing-boilerplate.git;

    echo '--> Renaming the boilerplate folder to '"$@";
    mv airlst-landing-boilerplate "$@";

    echo '--> Accessing '"$@"' folder';
    cd "$@";

    echo '--> Deleting .git folder';
    rm -rf .git;

    echo '--> Initializing git';
    git init;

    echo '--> git add .';
    git add .;

    echo '--> git commit -m "initial commit"';
    git commit -m 'initial commit';

    echo '--> Commiting to repository https://martin-minghetti@bitbucket.org/airlst/'"$@"'.git';
    git remote add origin https://martin-minghetti@bitbucket.org/airlst/"$@".git;

    echo '--> Pushing"';
    git push -u origin master
}


## Clone a specific project from BitBucket,
## create a workspace folder for VS Code and open it

## To use: bitme projectName (without airlst-landing- )

bb () {
    echo '\n\n🚕  Vamos to AirLST folder';
    lst;
    echo '\n'

    echo '👯';
    git clone https://martin-minghetti@bitbucket.org/airlst/airlst-landing-$@.git;
    echo '\n'

    echo '✨ Creating a workspace for VS Code';
    echo '{"folders":[{"path": "airlst-landing-'$@'"}],"settings": {}}' > landing-"$@".code-workspace
    echo '\n'

    echo '🖖🏻  Open in VS Code';
    code landing-"$@".code-workspace;
    echo '\n'
}

