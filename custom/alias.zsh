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
alias f.="open ."

## Open in code
alias c="code"
alias c.="code ."

## NPM
alias dev="echo '\n\n Please npm run dev 🥨' && npm run dev"
alias sv="echo '\n\n Please npm run serve 🥨' && npm run serve"
alias st="echo '\n\n Please npm run start 🥨' && npm start"
alias w="echo '\n\n Please npm run watch 🥨' && npm run watch"
alias ws="echo '\n\n Please npm run watch 🥨' && npm run watch-styles"
alias bd="echo '\n\n Please npm run build 🚧' && npm run build"
alias cy="echo '\n\n Please npm run cypress 🔥🔥🔥‍' && npm run cypress"

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

## Clone a specific project from BitBucket,
## create a workspace folder for VS Code and open it

## To use: bb projectName (without airlst-landing- )

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

## To use: al + projectName, will type airlst-landing-
al () {
    cd airlst-landing-$@;
}

